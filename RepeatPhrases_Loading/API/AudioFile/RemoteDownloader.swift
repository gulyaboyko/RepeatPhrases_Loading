//
//  RemoteDownloader.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/10/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

struct RemoteDownloader: AudioDownloader {
    private var url: URL
    private var client: HTTPDownloadClient
    
    init(url: URL, client: HTTPDownloadClient) {
        self.client = client
        self.url = url
    }

    private static var statusCodeError = NSError(domain: "", code: 100, userInfo: nil)
    private var OK_CODE = 200
    
    func download(filePath: String, completion: @escaping (Result<URL, Error>) -> Void) {
        client.download { result in
            switch result {
            case let .success(url, response):
                completion(self.map(url: url, response: response))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    private func map(url: URL, response: HTTPURLResponse) -> Result<URL, Error> {
        if response.statusCode == OK_CODE {
            return .success(url)
        } else {
            return .failure(RemoteDownloader.statusCodeError)
        }
    }
}
