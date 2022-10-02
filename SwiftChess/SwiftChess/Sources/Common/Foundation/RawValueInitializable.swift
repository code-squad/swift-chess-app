//
//  RawValueInitializable.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/02.
//

/// `RawValue`를 통해 인스턴스를 생성하는 생성자를 제공하는 타입.
protocol RawValueInitializable: RawRepresentable {
    init?(rawValue: RawValue)
}
