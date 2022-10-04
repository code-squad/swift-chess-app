//
//  Board.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

/// 체스판 타입.
protocol Board {
    /// 체스판의 상태. 체스말이 놓여진 상태를 확인할 수 있다.
    var status: [[BoardElementRepresentable]] { get }

    subscript(_ location: BoardLocation) -> BoardElementRepresentable { get set }

    /// 주어진 상태로 체스판을 초기화한다.
    init(
        status: [[BoardElementRepresentable]],
        boardPrinter: BoardPrinter
    )
    /// 지정된 방식으로 체스판을 초기화한다.
    init(boardPrinter: BoardPrinter)

    /// 이동 명령을 통해 체스말을 이동시킨다.
    /// - Parameter moveCommand: 이동 명령 인스턴스. 시작점과 도착점이 포함되어 있다.
    func move(with command: MoveCommand) throws
    /// black, white 양 진영의 현재 점수를 반환한다.
    /// - Returns: 흑백 양 진영의 현재 점수.
    func currentPoints() -> GamePoint
    /// 현재 체스판 상황을 콘솔에 출력한다.
    /// - Returns: 콘솔에 표현할 문자열 형식 체스판 상황.
    @discardableResult
    func display() -> String
}

final class DefaultBoard: Board {

    private(set) var status: [[BoardElementRepresentable]] = []
    private let boardPrinter: BoardPrinter

    subscript(_ location: BoardLocation) -> BoardElementRepresentable {
        get {
            return status[location.rank.index][location.file.index]
        }
        set {
            status[location.rank.index][location.file.index] = newValue
        }
    }

    init(
        status: [[BoardElementRepresentable]],
        boardPrinter: BoardPrinter = .live()
    ) {
        self.status = status
        self.boardPrinter = boardPrinter
    }

    init(
        boardPrinter: BoardPrinter = .live()
    ) {
        self.boardPrinter = boardPrinter
        setInitialState()
    }

    // MARK: - Board 초기화 시 status 구성

    /// 지정된 구성으로 ``DefaultBoard/status``를 초기화한다.
    private func setInitialState() {
        setEmptyState()
        setPieces()
    }

    /// ``Board/status``를 빈 상태로 설정한다. 크기는 ``DefaultBoard/Configuration/size-swift.type.property``를 따른다.
    private func setEmptyState() {
        let emptyRank: [BoardElementRepresentable] = Array(
            repeating: Empty(),
            count: Self.Configuration.size.file
        )
        status = Array(
            repeating: emptyRank,
            count: Self.Configuration.size.rank
        )
    }

    private func setPieces() {
        PieceColor.allCases.forEach(setPieces(for:))
    }

    /// 지정된 색상의 ``Piece``를 배치한다. 색상별 ``Piece``의 위치는 각 ``Piece/initialLocations``를 참고한다.
    /// - Parameter pieceColor: 흑백 진영을 의미하는 체스말 색깔.
    private func setPieces(for pieceColor: PieceColor) {
        let pieces: [Piece] = [
            Pawn(color: pieceColor),
            Bishop(color: pieceColor),
            Knight(color: pieceColor),
            Rook(color: pieceColor),
            Queen(color: pieceColor),
        ]
        pieces.forEach { piece in
            piece.initialLocations.forEach { location in
                self[location] = piece
            }
        }
    }

    // MARK: - 체스말 이동

    func move(with command: MoveCommand) throws {
        try validate(startPoint: command.startPoint, endPoint: command.endPoint)

        guard let piece = self[command.startPoint] as? Piece else {
            throw BoardError.pieceNotExistsAtStartPoint(command.startPoint)
        }

        guard canMove(piece: piece, from: command.startPoint, to: command.endPoint) else {
            throw BoardError.identicalColoredPieceAlreadyExists(endPoint: command.endPoint)
        }

        if self[command.endPoint] is Piece {
            captureEnemyPiece(at: command.endPoint)
        }

        move(piece, from: command.startPoint, to: command.endPoint)
    }

    /// 시작점과 도착점이 체스판 안의 위치를 가리키고 있는지, 그리고 서로 같지 않은지 검증한다.
    /// - Parameters:
    ///   - startPoint: 이동을 시작하는 시작점.
    ///   - endPoint: 이동하고자 하는 도착점.
    private func validate(
        startPoint: BoardLocation,
        endPoint: BoardLocation
    ) throws {
        guard startPoint != endPoint else {
            throw BoardError.startEndPointShouldNotBeIdentical
        }
    }

    /// 주어진 체스말의 시작점에서 도착점으로 이동 가능 여부를 반환한다.
    /// - Parameters:
    ///   - piece: 이동시키고자 하는 체스말.
    ///   - startPoint: 이동을 시작하는 시작점.
    ///   - endPoint: 이동하고자 하는 도착점.
    /// - Returns: 이동 가능 여부. 가능하다면 `true`를 반환한다.
    private func canMove(
        piece: Piece,
        from startPoint: BoardLocation,
        to endPoint: BoardLocation
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

        guard let endPointPiece = self[endPoint] as? Piece else { return true }
        return piece.color != endPointPiece.color
    }

    /// 지정된 위치에 있는 체스말을 없앤다. 대상 체스말이 이동할 체스말과 다른 색상임을 확인하고 사용해야한다.
    /// - Parameter location: 상대방 체스말이 있는 위치.
    private func captureEnemyPiece(at location: BoardLocation) {
        self[location] = Empty()
        _ = boardPrinter.printCurrentPoints(currentPoints())
    }

    /// 지정된 체스말을 시작점에서 도착점으로 이동시킨다.
    /// - Parameters:
    ///   - piece: 이동시키고자 하는 체스말.
    ///   - startPoint: 이동을 시작하는 시작점.
    ///   - endPoint: 이동하고자 하는 도착점.
    private func move(
        _ piece: Piece,
        from startPoint: BoardLocation,
        to endPoint: BoardLocation
    ) {
        self[startPoint] = Empty()
        self[endPoint] = piece
    }

    // MARK: - 점수 계산

    func currentPoints() -> GamePoint {
        let existingPieces = status
            .flatMap { $0.compactMap { $0 as? Piece } }
        return reducePoints(from: existingPieces)
    }

    /// 체스판에 존재하는 ``Piece``를 이용해 ``PieceColor/black``, ``PieceColor/white`` 양 진영의 점수를 계산하여 반환한다.
    /// - Parameter existingPieces: 체스판 위에 존재하는 체스말들.
    /// - Returns: 체스판 위에 존재하는 체스말을 통해 계산된 흑백 양 진영의 현재 점수 튜플.
    private func reducePoints(from existingPieces: [Piece]) -> GamePoint {
        let points = GamePoint(
            black: DefaultBoard.Configuration.totalAvailablePoints,
            white: DefaultBoard.Configuration.totalAvailablePoints
        )
        return existingPieces.reduce(points) { partialResult, piece in
            switch piece.color {
            case .black:
                return GamePoint(
                    black: partialResult.black,
                    white: partialResult.white - piece.point
                )

            case .white:
                return GamePoint(
                    black: partialResult.black - piece.point,
                    white: partialResult.white
                )
            }
        }
    }

    // MARK: - 체스판 표현

    func display() -> String {
        return boardPrinter.printBoard(status)
    }
}

extension DefaultBoard {

    /// 체스판의 환경변수를 정의한 타입.
    enum Configuration {
        typealias Size = (rank: Int, file: Int)

        /// 체스판의 크기
        static let size = Size(rank: 8, file: 8)
        /// 진영별 얻을 수 있는 총 점수
        static let totalAvailablePoints = Pawn.point * Pawn.maxCount
        static let minimumFile: String = "A"
    }
}
