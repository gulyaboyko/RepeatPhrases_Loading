//
//  RemoteLoaderMapper.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/9/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

struct RemoteLoaderMapper {
    private struct RemoteLoadedAudio: Decodable {
        var id: Int
        var text: String
        var audioPath: String
        
        var loadedAudio: LoadedAudio { LoadedAudio(id: self.id, text: self.text, audioPath: self.audioPath)}
    }
    static func map(data: Data, response: HTTPURLResponse) -> Result<[LoadedAudio], Error> {
        if response.statusCode == 200, let loadedAudio = try? JSONDecoder().decode([RemoteLoadedAudio].self, from: data) {
            return .success(loadedAudio.map { $0.loadedAudio })
        }
        return .failure(NSError(domain: "", code: 100, userInfo: nil))
    }
}
