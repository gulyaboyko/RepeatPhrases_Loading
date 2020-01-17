//
//  AudioLoader.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/9/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

struct LoadedAudio {
    var id: String
    var text: String
    var audioURLPath: String
    var audioFileName: String
}

protocol AudioModelLoader {
    func get(completion: @escaping (Result<[LoadedAudio], Error>) -> Void)
}

protocol AudioLoader {
    func download(completion: @escaping (Result<Void, Error>) -> Void)
}


