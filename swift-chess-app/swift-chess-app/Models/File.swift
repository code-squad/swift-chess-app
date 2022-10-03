//
//  File.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

enum File: String, CaseIterable, Hashable  {
    
    case a, b, c, d, e, f, g, h
    
    var toString: String { self.rawValue.uppercased() }
    
    private static let asciiCodeLowerA: Int = Int(UnicodeScalar("a").value)
    
    var toInt: Int {
        guard let value = UnicodeScalar(rawValue)?.value else { return 0 }
        return Int(value) - File.asciiCodeLowerA
    }
}

extension File {
    
    init?(_ num: Int) {
        let string = String(UnicodeScalar(UInt8(num + File.asciiCodeLowerA)))
        guard let file = File(rawValue: string) else { return nil }
        self = file
    }
    
    init?(_ string: String) {
        let lowerString = string.lowercased()
        guard let file = File(rawValue: lowerString) else { return nil }
        self = file
    }
}

extension File: Equatable {
    
    static func == (lhs: File, rhs: File) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

extension File {
    
    static func + (left: File, right: File) -> File? {
        return File(left.toInt + right.toInt)
    }
    
    static func + (left: File, right: Int) -> File? {
        return File(left.toInt + right)
    }
    
    static func - (left: File, right: File) -> File? {
        return File(left.toInt - right.toInt)
    }
    
    static func - (left: File, right: Int) -> File? {
        return File(left.toInt - right)
    }
}
