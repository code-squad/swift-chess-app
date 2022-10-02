//
//  Location.swift
//  swift chess app
//
//  Created by 윤태민(Yun, Taemin) on 2022/09/30.
//

import Foundation

struct Location: Equatable {
    private(set) var row: Int
    private(set) var col: Int
    
    func getPosition() -> Position? {
        guard let rank = UnicodeScalar(row + Int(UnicodeScalar("1").value)),
              let file = UnicodeScalar(col + Int(UnicodeScalar("A").value)) else {
            return nil
        }
        
        return Position(input: "\(file)\(rank)")
    }
}
