//
//  AsciiValueRepresentable.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/02.
//

/// 개별 인스턴스를 정수형의 AscII 값으로 나타낼 수 있는 타입.
protocol AsciiValueRepresentable {
    /// 인스턴스의 Asc II 값.
    var asciiValue: Int { get }
}
