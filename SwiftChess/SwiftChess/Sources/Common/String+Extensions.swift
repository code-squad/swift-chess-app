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

    /// 문자열 숫자(예, "1")로 표현된 Rank를 정수형으로 바꾸어 반환한다.
    var asRankIndex: Int {
        return Int(self) ?? 0
    }

    /// 문자열(예, "A")로 표현된 File을 정수형으로 바꾸어 반환한다.
    var asFileIndex: Int {
        return self.asAsciiValue - Board.Configuration.minimumFile.asAsciiValue + 1
    }
}
