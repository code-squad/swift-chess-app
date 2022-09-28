//
//  Occupiable.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

protocol Occupiable {
    var isEmpty: Bool { get }
    var isNotEmpty: Bool { get }
}

extension Occupiable {
    var isNotEmpty: Bool {
        return !isEmpty
    }
}

extension Array: Occupiable {}
