//
//  RemoteLoaderMapper.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/9/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

struct RemoteLoaderMapper {
    private struct Root: Decodable {
        var documents: [RemoteLoadedAudio]
    }
    private struct Fields: Decodable {
        var filename: Filename
        var text: Filename
    }
    private struct Filename: Decodable {
        var stringValue: String
    }
    private struct RemoteLoadedAudio: Decodable {
        var name: String
        var fields: Fields
        var loadedAudio: LoadedAudio {
            let id = self.name.components(separatedBy: "/").last!
            return LoadedAudio(id: id,
                               text: self.fields.text.stringValue,
                               audioURLPath: "https://firebasestorage.googleapis.com/v0/b/espresso-app-a33f5.appspot.com/o/All-Advanced-Phrases%2F" + self.fields.filename.stringValue + "?alt=media",
                               audioFileName: id + ".mp3")
        }
    }
    static func map(data: Data, response: HTTPURLResponse) -> Result<[LoadedAudio], Error> {
        if response.statusCode == 200, let root = try? JSONDecoder().decode(Root.self, from: data) {
            return .success(root.documents.map { $0.loadedAudio })
        }
        return .failure(NSError(domain: "", code: 100, userInfo: nil))
    }
}
