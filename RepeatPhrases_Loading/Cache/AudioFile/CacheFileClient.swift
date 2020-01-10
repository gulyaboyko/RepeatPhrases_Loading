//
//  CacheFileClient.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/10/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

protocol CacheFileClient {
    func save(from: URL, completion: @escaping (Result<String, Error>) -> Void)
}