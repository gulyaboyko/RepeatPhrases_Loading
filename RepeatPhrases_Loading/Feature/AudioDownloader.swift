//
//  AudioDownloader.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/9/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

protocol AudioFileDownloader {
    // URL for temporary place
    func download(filePath: String, completion: @escaping (Result<URL, Error>) -> Void)
}
struct AudioDownloaderSuccessResult {
    var successLoadedFiles: Int
    var failedLoadedFiles: Int
}
protocol AudioDownloader {
    func downloadAudios(completion: @escaping (Result<AudioDownloaderSuccessResult, Error>) -> Void)
}
