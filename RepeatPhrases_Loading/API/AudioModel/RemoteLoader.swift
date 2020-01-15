//
//  RemoteLoader.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/9/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

struct RemoteLoader: AudioLoader {
    private var url: URL
    private var client: HTTPClient
    
    init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    func get(completion: @escaping (Result<[LoadedAudio], Error>) -> Void) {
        client.get(url: url) { result in
            switch result {
            case let .success(data, response):
                completion(RemoteLoaderMapper.map(data: data, response: response))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
