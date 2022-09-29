//
//  Piece.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

/// 체스말 타입이 준수하는 프로토콜. 체스말이 가지는 기본 요건을 정의하고 있다.
protocol Piece {

    /// 이동할 수 있는 규칙 모음. 자세한 내용은 ``MoveRule``을 참고한다.
    static var moveRules: Set<MoveRule> { get }
    /// 체스판에 존재할 수 있는 최대 개수
    static var maxCount: Int { get }
    /// 체스말이 잡혔을 때 획득할 수 있는 점수.
    static var point: Int { get }

    var color: PieceColor { get }
    /// 체스말이 잡혔을 때 획득할 수 있는 점수. `point` 타입 상수를 참조하여 반환한다.
    var point: Int { get }
    /// 체스말을 콘솔에 표현할 때 사용하는 표식
    var asSymbol: String { get }

    /// 입력된 위치에서 이동할 수 있는 위치 후보를 반환한다.
    func movableLocations(from location: Board.Location) -> [Board.Location]
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

    var asSymbol: String {
        switch self {
        case _ as Pawn:
            return color == .black
                ? PieceSymbol.blackPawn.rawValue
                : PieceSymbol.whitePawn.rawValue

        default:
            return PieceSymbol.empty.rawValue
        }
    }
}

enum PieceColor: CaseIterable {
    case black
    case white
}

/// 체스말의 이동 규칙을 정의한 타입.
///
///  예를 들어, `MoveRule(rank: 2, file:1)`은 해당 체스말이 rank로 2 칸, file로 1 칸 이동하는 규칙을 가지고 있다는 의미이다.
struct MoveRule: Hashable {
    let rank: Int
    let file: Int
}

/// 체스말을 콘솔에 표현할 때 사용하는 표식을 모두 정의한 타입.
enum PieceSymbol: String {
    case blackPawn = "♟"
    case whitePawn = "♙"
    case empty = "."
}
