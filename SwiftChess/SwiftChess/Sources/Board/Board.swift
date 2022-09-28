//
//  Board.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

enum BoardError: Error, Equatable {
    /// 유효하지 않은 rank를 전달함
    case invalidRank(Int)
    /// 이동을 시도하였으나 시작점에 체스말이 없음
    case pieceNotExistsAtStartPoint(Board.Location)
    /// 이동 가능한 위치가 존재하지 않음
    case movableLocationsNotExists
    /// 이동을 시도하였으나 시작점이 유효하지 않음
    case invalidStartPoint(Board.Location)
    /// 이동을 시도하였으나 목적지가 유효하지 않음
    case invalidEndPoint(Board.Location)
    /// 이동 시 시작점과 목적지가 동일할 수 없음
    case startEndPointShouldNotBeIdentical
    /// 이동 규칙에 따라 해당 체스말은 지정한 목적지로 이동할 수 없음
    case moveRuleViolated(possibleEndPoints: [Board.Location])
    /// 목적지에 동일한 색상의 체스말이 이미 존재하여 이동할 수 없음
    case identicalColoredPieceAlreadyExists(endPoint: Board.Location)
}

final class Board {

    /// 체스판의 상태. 체스말이 놓여진 상태를 확인할 수 있다. 빈 위치는 `nil`로 표현한다.
    private(set) var status: [[Piece?]] = []

    subscript(_ location: Board.Location) -> Piece? {
        get {
            return status[location.rank.asIndex][location.file.asIndex]
        }
        set {
            status[location.rank.asIndex][location.file.asIndex] = newValue
        }
    }

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
            status[blackPawn.initialRank.asIndex] = blackPawnRank

        case .white:
            let whitePawn = Pawn(color: .white)
            let whitePawnRank = Array(
                repeating: whitePawn,
                count: Self.Configuration.size.file
            )
            status[whitePawn.initialRank.asIndex] = whitePawnRank
        }
    }

    // MARK: - 체스말 이동

    /// 체스말을 시작점에서 목적지로 이동시킨다.
    func move(
        from startPoint: Board.Location,
        to endPoint: Board.Location
    ) throws {
        try validate(startPoint: startPoint, endPoint: endPoint)

        guard let piece = self[startPoint] else {
            throw BoardError.pieceNotExistsAtStartPoint(startPoint)
        }

        guard canMove(piece: piece, from: startPoint, to: endPoint) else {
            throw BoardError.identicalColoredPieceAlreadyExists(endPoint: endPoint)
        }

        if self[endPoint] != nil {
            captureEnemyPiece(at: endPoint)
            let currentPoints = currentPoints()
            // TODO: 출력 타입 마련해서 포매팅 후 출력
            print(currentPoints)
        }

        move(piece, from: startPoint, to: endPoint)
    }

    /// 시작점과 목적지가 체스판 안의 위치를 가리키고 있는지, 그리고 서로 같지 않은지 검증한다.
    private func validate(
        startPoint: Board.Location,
        endPoint: Board.Location
    ) throws {
        guard startPoint.isValid else {
            throw BoardError.invalidStartPoint(startPoint)
        }

        guard endPoint.isValid else {
            throw BoardError.invalidEndPoint(endPoint)
        }

        guard startPoint != endPoint else {
            throw BoardError.startEndPointShouldNotBeIdentical
        }
    }

    /// 주어진 체스말의 시작점에서 목적지로 이동 가능 여부를 반환한다.
    private func canMove(
        piece: Piece,
        from startPoint: Board.Location,
        to endPoint: Board.Location
    ) -> Bool {
        let movableLocations = piece.movableLocations(from: startPoint)

        guard movableLocations.isNotEmpty else {
            // TODO: Log BoardError.movableLocationsNotExists
            return false
        }

        guard movableLocations.contains(endPoint) else {
            // TODO: Log BoardError.moveRuleViolated(possibleEndPoints: movableLocations)
            return false
        }

        guard let endPointPiece = self[endPoint] else { return true }
        return piece.color != endPointPiece.color
    }

    /// 지정된 위치에 있는 체스말을 없앤다. 대상 체스말이 이동할 체스말과 다른 색상임을 확인하고 사용해야한다.
    private func captureEnemyPiece(at location: Board.Location) {
        self[location] = nil
    }

    /// 지정된 체스말을 시작점에서 목적지로 이동시킨다.
    private func move(
        _ piece: Piece,
        from startPoint: Board.Location,
        to endPoint: Board.Location
    ) {
        self[startPoint] = nil
        self[endPoint] = piece
    }

    // MARK: - 점수 계산

    /// black, white 양 진영의 현재 점수를 반환한다.
    func currentPoints() -> (black: Int, white: Int) {
        let existingPieces = status
            .flatMap { $0.compactMap { $0 } }
        return reducePoints(from: existingPieces)
    }

    /// 체스판에 존재하는 ``Piece``를 이용해 black, white 양 진영의 점수를 계산하여 반환한다.
    private func reducePoints(
        from existingPieces: [Piece]
    ) -> (black: Int, white: Int) {
        let points = (
            black: Board.Configuration.totalAvailablePoints,
            white: Board.Configuration.totalAvailablePoints
        )
        return existingPieces.reduce(points) { partialResult, piece in
            switch piece.color {
            case .black:
                return (
                    black: partialResult.black,
                    white: partialResult.white - piece.point
                )

            case .white:
                return (
                    black: partialResult.black - piece.point,
                    white: partialResult.white
                )
            }
        }
    }
}

extension Board {

    /// 체스판의 환경변수를 정의한 타입.
    enum Configuration {
        typealias Size = (rank: Int, file: Int)

        /// 체스판의 크기
        static let size = Size(rank: 8, file: 8)
        /// 진영별 얻을 수 있는 총 점수
        static let totalAvailablePoints = Pawn.point * Pawn.maxCount
    }

    /// 체스판 내 위치를 나타내는 타입.
    struct Location: Equatable {
        /// 행(Row)
        var rank: Int
        /// 열(Column)
        var file: Int
    }
}

extension Board.Location {

    static func + (lhs: Self, rhs: MoveRule) -> Self {
        return Self(rank: lhs.rank + rhs.rank, file: lhs.file + rhs.file)
    }

    static func - (lhs: Self, rhs: MoveRule) -> Self {
        return Self(rank: lhs.rank - rhs.rank, file: lhs.file - rhs.file)
    }

    /// 해당 위치가 체스판 안에 존재하는지 여부를 반환한다.
    var isValid: Bool {
        return (1...Board.Configuration.size.rank).contains(self.rank) &&
        (1...Board.Configuration.size.file).contains(self.file)
    }
}
