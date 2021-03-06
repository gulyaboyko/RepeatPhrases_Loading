//
//  AudioSaver.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/9/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

protocol AudioSaver {
    func save(_ items: [LoadedAudio], completion: @escaping (Result<Void, Error>) -> Void)
    func getNotDownloadedAudio(completion: @escaping (Result<[LoadedAudio], Error>) -> Void)
}
