//
//  BoardPosition.swift
//  swift-chess-app
//
//  Created by 이재은 on 2022/10/03.
//

import Foundation

// MARK: - Rank 가로줄
struct Rank {
    let value: Int
}

// MARK: - File 세로줄
struct File {
    let value: Int

    init(value: Int) {
        self.value = value
    }

    init(text: String) {
        self.value = Int(UnicodeScalar(text)!.value - 64)
    }
}

// MARK: - BoardPosition 보드칸 위치
struct BoardPosition {

    let rank: Rank
    let file: File

    var coordinate: (Rank, File) {
        (rank, file)
    }

    init(_ positionText: String) {
        let pText = Array(positionText).map { String($0) }
        self.rank = Rank(value: Int(pText[1]) ?? 0)
        self.file = File(text: pText[0])
    }

    init(rank: Int, file: Int) {
        self.rank = Rank(value: rank)
        self.file = File(value: file)
    }
}

