//
//  URLSessionDownloadClient.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/10/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

struct URLSessionDownloadClient: HTTPDownloadClient {
    private var url: URL
    private var session: URLSession
    
    init(url: URL, session: URLSession = .shared) {
        self.url = url
        self.session = session
    }
    
    private static var unexpectedError = NSError(domain: "", code: 100, userInfo: nil)
    
    func download(completion: @escaping (Result<(URL, HTTPURLResponse), Error>) -> Void) {
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
}
