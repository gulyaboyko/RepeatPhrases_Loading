//
//  CacheFileManager.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/10/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

struct CacheFileManager: AudioFileSaver {
    private var client: CacheFileClient
    
    init(client: CacheFileClient) {
        self.client = client
    }
    
    func save(from: URL, withFileName: String, completion: @escaping (Result<Void, Error>) -> Void) {
        client.save(from: from, withFileName: withFileName, completion: completion)
    }
    
}
