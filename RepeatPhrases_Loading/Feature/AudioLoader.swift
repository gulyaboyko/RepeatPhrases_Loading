//
//  AudioLoader.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/9/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

struct LoadedAudio {
    var id: Int
    var text: String
    var audioPath: String
}

protocol AudioLoader {
    func get(completion: (Result<[LoadedAudio], Error>) -> Void)
}
