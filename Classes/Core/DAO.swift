//
//  DAO.swift
//  KVSharkORM
//
//  Created by Кирилл Володин on 25.02.2018.
//  Copyright © 2018 Кирилл Володин. All rights reserved.
//

import Foundation

public protocol DAOProtocol {
    
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
