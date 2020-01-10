//
//  AudioChanger.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/10/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

protocol AudioChanger {
    func audioWasDownloaded(id: Int, withFileName: String)
}
