//
//  Position.swift
//  swift chess app
//
//  Created by 윤태민(Yun, Taemin) on 2022/10/02.
//

import Foundation

struct Position: Equatable {
    private(set) var rank: String
    private(set) var file: String
    
    init?(input: String) {
        guard input.count == 2 else { return nil }
        
        guard let rank = input.last,
              let file = input.first else { return nil }
        
        self.rank = String(rank)
        self.file = String(file)
    }
    
    var string: String {
        file + rank
    }
    
    func getLocation() -> Location? {
        guard let tmpRank = UnicodeScalar(rank),
              let tmpFile = UnicodeScalar(file) else { return nil }
        
        var row = Int(tmpRank.value)
        row -= Int(UnicodeScalar("1").value)
        var col = Int(tmpFile.value)
        col -= Int(UnicodeScalar("A").value)
        
        return Location(row: row, col: col)
    }
}
