//
//  URLSessionClient.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/9/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

struct URLSessionClient: HTTPClient {
    private var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    private static var unexpectedError = NSError(domain: "", code: 100, userInfo: nil)
    
    func get(url: URL, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
        session.dataTask(with: url) { (data, urlResponse, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let response = urlResponse as? HTTPURLResponse {
                completion(.success((data, response)))
            } else {
                completion(.failure(URLSessionClient.unexpectedError))
            }
        }.resume()
    }
}
