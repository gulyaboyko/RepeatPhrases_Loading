//
//  URLSessionDownloadClient.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/10/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

struct URLSessionDownloadClient: HTTPDownloadClient {
    private var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    private static var unexpectedError = NSError(domain: "", code: 100, userInfo: nil)
    
    func download(url: URL, completion: @escaping (Result<(URL, HTTPURLResponse), Error>) -> Void) {
        session.downloadTask(with: url) { (url, urlResponse, error) in
            if let error = error {
                completion(.failure(error))
            } else if let url = url, let response = urlResponse as? HTTPURLResponse {
                completion(.success((url, response)))
            } else {
                completion(.failure(URLSessionDownloadClient.unexpectedError))
            }
        }.resume()
    }
    
    func save(from: URL, fileName: String) -> Result<Void, Error> {
        do {
            
            var audioDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            audioDirectoryURL.appendPathComponent("audio", isDirectory: true)
            var isDir = ObjCBool(true)
            if FileManager.default.fileExists(atPath: audioDirectoryURL.absoluteString, isDirectory: &isDir) {
                try FileManager.default.createDirectory(at: audioDirectoryURL, withIntermediateDirectories: true, attributes: nil)
            }
            let destinationURL = audioDirectoryURL.appendingPathComponent(fileName)
            try FileManager.default.moveItem(at: from, to: destinationURL)
            return .success(())
        } catch let error {
            return .failure(error)
        }
    }
    
}
