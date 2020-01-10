//
//  RealmManager.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/9/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation

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
    func markAudioDownloaded(id: Int, withFileName: String) {
        do {
            guard let audio: AudioRealm = try AudioRealm.findById(id) else { return }
            audio.isDownloaded = true
            audio.audioFileName = withFileName
            try AudioRealm.upsert(audio)
        } catch { }
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
