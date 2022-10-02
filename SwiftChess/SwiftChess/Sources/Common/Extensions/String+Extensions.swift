//
//  String+Extensions.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

extension String {

    var asciiValue: Int {
        return Int(UnicodeScalar(self)!.value)
    }
}
