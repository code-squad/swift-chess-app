//
//  IndexRepresentable.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/02.
//

protocol IndexRepresentable {
    var index: Int { get }
}

extension IndexRepresentable where Self: RawRepresentable, RawValue == Int {
    var index: Int {
        return self.rawValue - 1
    }
}
