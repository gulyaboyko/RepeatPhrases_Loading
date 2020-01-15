//
//  HTTPClient.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/9/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

protocol HTTPClient {
    func get(url: URL, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void)
}
