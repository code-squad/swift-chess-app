//
//  main.swift
//  King
//
//  Created by 이재은 on 2022/10/06.
//

import Foundation

enum Color {
    case white
    case black
}

protocol KingProtocol {
    var color: Color { get }
    var rank: Int { get set }
    var file: Int { get set }
}

extension KingProtocol {
    func move(to: Position) -> Bool {
        let rankDelta = abs(to.rank - rank)
        let fileDelta = abs(to.file - file)

        return rankDelta + fileDelta <= 2
    }
}

typealias Position = (rank: Int, file: Int)

final class WhiteKing: KingProtocol {

    let color: Color = .white

    var rank: Int

    var file: Int

    init() {
        rank = 0
        file = 3
    }


}

final class BlackKing: KingProtocol {

    let color: Color = .black

    var rank: Int

    var file: Int

    init() {
        rank = 7
        rank = 3
    }
}
