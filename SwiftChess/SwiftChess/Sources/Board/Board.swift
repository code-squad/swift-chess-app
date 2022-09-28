//
//  Board.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

final class Board {

    private(set) var status: [[Piece?]] = []

    /// 주어진 상태로 체스판을 초기화한다.
    init(
        status: [[Piece?]]
    ) {
        self.status = status
    }

    /// 지정된 방식으로 체스판을 초기화한다.
    init() {
        setInitialState()
    }

    // MARK: - Board 초기화 시 status 구성

    /// 지정된 구성으로 ``Board``의 ``Board/status``를 초기화한다.
    private func setInitialState() {
        setEmptyState()
        setPawns()
    }

    /// ``Board/status``를 빈 상태로 설정한다. 크기는 ``Board/Configuration/size``를 따른다.
    private func setEmptyState() {
        let emptyRank: [Piece?] = Array(
            repeating: nil,
            count: Self.Configuration.size.file
        )
        status = Array(
            repeating: emptyRank,
            count: Self.Configuration.size.rank
        )
    }

    /// 색상별 ``Pawn``을 지정된 위치에 둔다. 색상별 ``Pawn``의 위치는 ``Pawn/initialRankIndex``를 참고한다.
    private func setPawns() {
        for pieceColor in PieceColor.allCases {
            setPawns(for: pieceColor)
        }
    }

    /// 지정된 색상의 ``Pawn``을 위치에 둔다. 색상별 ``Pawn``의 위치는 ``Pawn/initialRankIndex``를 참고한다.
    private func setPawns(for pieceColor: PieceColor) {
        switch pieceColor {
        case .black:
            let blackPawn = Pawn(color: .black)
            let blackPawnRank = Array(
                repeating: blackPawn,
                count: Self.Configuration.size.file
            )
            status[blackPawn.initialRankIndex] = blackPawnRank

        case .white:
            let whitePawn = Pawn(color: .white)
            let whitePawnRank = Array(
                repeating: whitePawn,
                count: Self.Configuration.size.file
            )
            status[whitePawn.initialRankIndex] = whitePawnRank
        }
    }
}

extension Board {

    enum Configuration {
        /// 체스판의 크기
        static let size = Board.Size(rank: 8, file: 8)
    }

    struct Size {
        /// 행(Row)
        let rank: Int
        /// 열(Column)
        let file: Int
    }

    struct Location {
        /// 행(Row)
        var rank: Int
        /// 열(Column)
        var file: Int
    }
}
