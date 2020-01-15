//
//  FileSystemManager.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/10/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

struct FileSystemManager: CacheFileClient {
    
//    private let queue = DispatchQueue(label: "\(FileSystemManager.self)Queue", qos: .userInitiated, attributes: .concurrent)
    
    private var dirToSaveFiles: String
    private var documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    init(dirToSaveFiles: String) {
        try? FileManager.default.createDirectory(atPath: self.documentDirectory + "/" + dirToSaveFiles, withIntermediateDirectories: true, attributes: nil)
        self.dirToSaveFiles = dirToSaveFiles
    }
    
    func save(from: URL, withFileName: String, completion: @escaping (Result<Void, Error>) -> Void) {
//        queue.async {
            do {
                var audioDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                audioDirectoryURL.appendPathComponent(self.dirToSaveFiles, isDirectory: true)
                let destinationURL = audioDirectoryURL.appendingPathComponent(withFileName)
                try FileManager.default.moveItem(at: from, to: destinationURL)
                completion(.success(()))
            } catch let error {
                completion(.failure(error))
            }
//        }
    }
    
//    private mutating func getDestinationURL(from: URL) -> URL {
//
//        return
//    }
//
//    private lazy var audioDirectoryURL: URL = {
//        var audioDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        audioDirectoryURL.appendPathComponent(dirToSaveFiles, isDirectory: true)
//        return audioDirectoryURL
//    }()
    
}
