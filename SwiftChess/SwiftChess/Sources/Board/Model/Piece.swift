//
//  Piece.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

protocol Piece {

    /// 이동할 수 있는 규칙. 예) (1, 2) -> Rank 1, File 2
    static var moveRules: Set<MoveRule> { get }
    /// 체스판에 존재할 수 있는 최대 개수
    static var maxCount: Int { get }
    /// 체스말이 잡혔을 때 획득할 수 있는 점수.
    static var point: Int { get }

    var color: PieceColor { get }
    /// 체스말이 잡혔을 때 획득할 수 있는 점수. ``Piece/point`` 타입 상수를 참조하여 반환한다.
    var point: Int { get }

    /// 입력된 위치에서 이동할 수 있는 위치 후보를 반환한다.
    func movableLocations(from location: Board.Location) -> [Board.Location]
}

enum PieceColor: CaseIterable {
    case black
    case white
}

struct MoveRule: Hashable {
    let rank: Int
    let file: Int
}

extension Piece {

    var point: Int {
        switch self {
        case _ as Pawn:
            return Pawn.point
        default:
            return 0
        }
    }
}
