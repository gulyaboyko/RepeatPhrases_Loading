//
//  AudioRealm.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/10/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers final class AudioRealm: Object {
    dynamic var id = 0
    dynamic var text = ""
    dynamic var audioPath = ""
    dynamic var audioFileName = ""
    dynamic var nextRepetition: TimeInterval = 0.0 // время когда нужно след раз повторить
    dynamic var shownCount = 0 // кол-во показов при удачном ответе, если пользователь ошибается становится опять 0
    dynamic var isDeleted = false
    dynamic var isDownloaded = false
    
    override static func primaryKey() -> String? { return "id" }
}
