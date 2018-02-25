//
//  SharkDAO.swift
//  KVSharkORM
//
//  Created by Кирилл Володин on 25.02.2018.
//  Copyright © 2018 Кирилл Володин. All rights reserved.
//

import Foundation
import SharkORM

public class SharkDAO<Translator: SharkTranslatorProtocol>: DAOProtocol {
    
    public typealias Entry = Translator.Entry
    public typealias Entity = Translator.Entity
    
    public var translator: Translator
    
    public required init(_ translator: Translator) {
        self.translator = translator
    }
    
    @discardableResult public func persist(_ entity: Entity) -> Bool {
        let entry: Entry = translator.toEntry(entity)
        let result = entry.commit()
        return result
    }
    
    @discardableResult public func persist(_ entities: [Entity]) -> Bool {
        let entries = translator.toEntries(entities)
        for entry in entries {
            if !entry.commit() {
                return false
            }
        }
        return true
    }
    
    // swiftlint:disable:next identifier_name
    public func read(id: Int) -> Entity? {
        guard let entry = Entry.query().where(withFormat: "entryID = %@", withParameters: [id]).fetch().firstObject as? Entry else {
            return nil
        }
        return translator.toEntity(entry)
    }
    
    public func read() -> [Entity] {
        guard let entries = Entry.query().fetch() as? [Entry] else {
            return []
        }
        return translator.toEntities(entries)
    }
    
    // swiftlint:disable:next identifier_name
    @discardableResult public func erase(id: Int) -> Bool {
        guard let entry = Entry.query().where(withFormat: "entryID = %@", withParameters: [id]).fetch().firstObject as? Entry else {
            return true
        }
        return entry.remove()
    }
    
    @discardableResult public func erase() -> Bool {
        guard let entries = Entry.query().fetch() else {
            return true
        }
        return entries.removeAll()
    }
}
