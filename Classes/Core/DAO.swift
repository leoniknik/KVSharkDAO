//
//  DAO.swift
//  KVSharkORM
//
//  Created by Кирилл Володин on 25.02.2018.
//  Copyright © 2018 Кирилл Володин. All rights reserved.
//

import Foundation

public protocol DAOProtocol {
    
//    associatedtype Entry: EntryProtocol
    associatedtype Entry
    associatedtype Entity: EntityProtocol
    associatedtype Translator: TranslatorProtocol
    
    var translator: Translator { get set }
    
    func persist(_ entity: Entity) -> Bool
    
    func persist(_ entities: [Entity]) -> Bool
    
    func read(id: Int) -> Entity? // swiftlint:disable:this identifier_name
    
    func read() -> [Entity]
    
    func erase(id: Int) -> Bool // swiftlint:disable:this identifier_name
    
    func erase() -> Bool
    
}

public class DAO<Entity: EntityProtocol> {
    
    private var persistEntity: ((Entity) -> Bool)
    private var persistEntities: (([Entity]) -> Bool)
    private var readById: ((Int) -> Entity?)
    private var readAll: (() -> [Entity])
    private var eraseById: ((Int) -> Bool)
    private var eraseAll: (() -> Bool)
    
    
    public init<DAO: DAOProtocol>(_ dao: DAO) where DAO.Entity == Entity {
        persistEntity = dao.persist
        persistEntities = dao.persist
        readById = dao.read(id:)
        readAll = dao.read
        eraseById = dao.erase(id:)
        eraseAll = dao.erase
    }
    
    @discardableResult public func persist(entity: Entity) -> Bool {
        return persistEntity(entity)
    }
    
    @discardableResult public func persist(entities: [Entity]) -> Bool {
        return persistEntities(entities)
    }
    
    public func read(id: Int) -> Entity? {
        return readById(id)
    }
    
    public func read() -> [Entity] {
        return readAll()
    }
    
    @discardableResult public func erase(id: Int) -> Bool {
        return eraseById(id)
    }
    
    @discardableResult public func erase() -> Bool {
        return eraseAll()
    }
}

