//
//  RealmManager.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/9/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers final class AudioRealm: Object {
    dynamic var id = 0
    dynamic var text = ""
    dynamic var audioPath = "" // аудио будет храниться в файловой системе в /audio/<ID>.mp3
    dynamic var nextRepetition: TimeInterval = 0.0 // время когда нужно след раз повторить
    dynamic var shownCount = 0 // кол-во показов при удачном ответе, если пользователь ошибается становится опять 0
    dynamic var isDeleted = false
    dynamic var isDownloaded = false
    
    override static func primaryKey() -> String? { return "id" }
}

struct RealmManager: CacheSaver {
    func save(_ items: [LoadedAudio], completion: (Result<Void, Error>) -> Void) {
        let realmObjects: [AudioRealm] = items.toRealmObject()
        do {
            try AudioRealm.upsert(realmObjects)
            completion(.success(()))
        } catch let error {
            completion(.failure(error))
        }
    }
    func getNotDownloadedAudio(completion: (Result<[LoadedAudio], Error>) -> Void) {
        do {
            let audioRealm: [AudioRealm] = try AudioRealm.find("isDownloaded = false")
            completion(.success(audioRealm.toModels()))
        } catch (let error) {
            completion(.failure(error))
        }
    }
}

extension Array where Element == LoadedAudio {
    func toRealmObject() -> [AudioRealm] {
        return map { localAudio in
            let audioRealm = AudioRealm()
            audioRealm.id = localAudio.id
            audioRealm.text = localAudio.text
            audioRealm.audioPath = localAudio.audioPath
            return audioRealm
        }
    }
}

extension Array where Element == AudioRealm {
    func toModels() -> [LoadedAudio] {
        return map { LoadedAudio(id: $0.id, text: $0.text, audioPath: $0.audioPath)}
    }
}
