//
//  CacheManager.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/9/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

struct CacheManager: AudioSaver {
    private var cacheSaver: CacheSaver
    
    init(cacheSaver: CacheSaver) {
        self.cacheSaver = cacheSaver
    }
    
    func save(_ items: [LoadedAudio], completion: (Result<Void, Error>) -> Void) {
        cacheSaver.save(items, completion: completion)
    }
    
    func getNotDownloadedAudio(completion: (Result<[LoadedAudio], Error>) -> Void) {
        cacheSaver.getNotDownloadedAudio(completion: completion)
    }
}

protocol CacheSaver {
    func save(_ items: [LoadedAudio], completion: (Result<Void, Error>) -> Void)
    func getNotDownloadedAudio(completion: (Result<[LoadedAudio], Error>) -> Void)
}

