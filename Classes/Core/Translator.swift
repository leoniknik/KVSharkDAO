//
//  Translator.swift
//  KVSharkORM
//
//  Created by Кирилл Володин on 25.02.2018.
//  Copyright © 2018 Кирилл Володин. All rights reserved.
//

import Foundation

public protocol TranslatorProtocol: class {
    associatedtype Entity: EntityProtocol
    associatedtype Entry
    
    func toEntry(_ entity: Entity) -> Entry
    
    func toEntries(_ entities: [Entity]) -> [Entry]
    
    func toEntity(_ entry: Entry) -> Entity
    
    func toEntities(_ entries: [Entry]) -> [Entity]
}
