//
//  String+Extensions.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

extension String {

    var asAsciiValue: Int {
        return Int(UnicodeScalar(self)!.value)
    }

    var asRankIndex: Int {
        return Int(self) ?? 0
    }

    var asFileIndex: Int {
        return self.asAsciiValue - Board.Configuration.minimumFile.asAsciiValue + 1
    }
}
