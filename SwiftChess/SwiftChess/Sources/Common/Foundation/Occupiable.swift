//
//  Occupiable.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

/// `Collection`을 준수하는 타입의 인스턴스 내부에 요소 유무를 판단할 수 있는 타입.
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
