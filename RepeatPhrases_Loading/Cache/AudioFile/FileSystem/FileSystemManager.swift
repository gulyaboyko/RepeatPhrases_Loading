//
//  FileSystemManager.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/10/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

struct FileSystemManager: CacheFileClient {
    private var dirToSaveFiles: String
    private var documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    init(dirToSaveFiles: String) {
        self.dirToSaveFiles = dirToSaveFiles
    }
    
    func save(from: URL, completion: @escaping (Result<String, Error>) -> Void) {
        do {
            let toPath = documentDirectory + "/" + dirToSaveFiles
            try FileManager.default.moveItem(atPath: from.absoluteString, toPath: toPath)
            completion(.success(from.lastPathComponent))
        } catch let error {
            completion(.failure(error))
        }
    }
    
}
