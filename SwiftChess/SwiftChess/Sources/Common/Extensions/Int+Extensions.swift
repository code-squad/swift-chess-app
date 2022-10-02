//
//  Int+Extensions.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

extension Int {

    /// 숫자를 배열의 index로 변환한다.
    ///
    /// 체스판의 rank, file과 같은 요소를 인덱스로 변환하는데 사용할 수 있다.
    var asIndex: Int {
        return self - 1
    }

    /// Ascii 값을 문자열 타입으로 변환하여 반환한다.
    var asString: String {
        return String(UnicodeScalar(self)!)
    }
}
