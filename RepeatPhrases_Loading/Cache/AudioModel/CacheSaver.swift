//
//  CacheSaver.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/10/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

protocol CacheSaver {
    func save(_ items: [LoadedAudio], completion: @escaping (Result<Void, Error>) -> Void)
    func getNotDownloadedAudio(completion: @escaping (Result<[LoadedAudio], Error>) -> Void)
    func markAudioDownloaded(id: Int, withFileName: String)
}
