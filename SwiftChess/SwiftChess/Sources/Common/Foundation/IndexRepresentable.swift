//
//  IndexRepresentable.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/02.
//

/// 인스턴스의 Index를 표현할 수 있는 타입.
protocol IndexRepresentable {
    var index: Int { get }
}

extension IndexRepresentable where Self: RawRepresentable, RawValue == Int {
    var index: Int {
        return self.rawValue - 1
    }
}
