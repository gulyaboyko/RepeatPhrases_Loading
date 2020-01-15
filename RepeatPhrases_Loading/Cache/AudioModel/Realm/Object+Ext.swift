//
//  Object+Ext.swift
//  RepeatPhrases_Loading
//
//  Created by Gulya Boiko on 1/9/20.
//  Copyright © 2020 com.appres. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

protocol DetachableObject: AnyObject {
    func detached() -> Self
}

extension Object: DetachableObject {
    func detached() -> Self {
        let detached = type(of: self).init()
        for property in objectSchema.properties {
            guard let value = value(forKey: property.name) else { continue }
            if let detachable = value as? DetachableObject {
                detached.setValue(detachable.detached(), forKey: property.name)
            } else { // Then it is a primitive
                detached.setValue(value, forKey: property.name)
            }
        }
        return detached
    }
}

extension Object {
    // Search models by filter
    static func find<T: Object>(_ filter: String? = nil) throws -> [T] {
        let realm = try Realm()
        guard let filter = filter else {
            return realm.objects(T.self).map { $0 }
        }
        return realm.objects(T.self).filter(filter).map { $0.detached() }
    }
    
    // Search by ID
    static func findById<T: Object>(_ id: String) throws -> T? {
        let realm = try Realm()
        return realm.object(ofType: T.self, forPrimaryKey: id)?.detached()
    }
    
    // Insert or update model
    static func upsert<T: Object>(_ instance: T) throws {
        let realm = try Realm()
        try realm.write {
            realm.add(instance, update: .all)
        }
    }
    
    // Insert or update models
    static func upsert<T: Object>(_ instances: [T]) throws {
        let realm = try Realm()
        try realm.write {
            instances.forEach { realm.add($0, update: .all) }
        }
    }
    
    // Delete model
    private static func deleteByFilter(_ filter: String? = nil) throws {
        let realm = try Realm()
        let instances = (filter == nil)
            ? realm.objects(self.self)
            : realm.objects(self.self).filter(filter!)
        for instance in instances {
            try realm.write {
                realm.delete(instance)
            }
        }
    }
    
    static func deleteById(_ id: Int) throws {
        try deleteByFilter("id = \(id)")
    }
    
    // Delete all data
    static func deleteAll() throws {
        let realm = try Realm()
        try realm.write {
            realm.deleteAll()
        }
    }
}

extension Realm {
    static func deleteDB() {
        guard let url = Realm.Configuration.defaultConfiguration.fileURL else { return }
        let realmURLs = [
            url,
            url.appendingPathExtension("lock"),
            url.appendingPathExtension("note"),
            url.appendingPathExtension("management")
        ]
        for URL in realmURLs {
            try? FileManager.default.removeItem(at: URL)
        }
    }
}
