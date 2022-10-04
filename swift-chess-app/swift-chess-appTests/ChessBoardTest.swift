//
//  ChessBoardTest.swift
//  swift-chess-appTests
//
//  Created by USER on 2022/09/27.
//

import XCTest
@testable import swift_chess_app


class ChessBoardTest: XCTestCase {
    let chessBoard = ChessBoard()
    
    override func setUpWithError() throws {
        let whitePawnPositions = [Position(file: .a, rank: .seven), Position(file: .b, rank: .seven), Position(file: .c, rank: .seven), Position(file: .d, rank: .seven)]
        let blackPawnPositions = [Position(file: .a, rank: .two), Position(file: .b, rank: .two), Position(file: .c, rank: .two), Position(file: .d, rank: .two)]
        chessBoard.createPawns(color: .white, positions: whitePawnPositions)
        chessBoard.createPawns(color: .black, positions: blackPawnPositions)
        
        let whiteRookPositions = [Position(file: .a, rank: .eight), Position(file: .h, rank: .eight)]
        let blackRookPositions = [Position(file: .a, rank: .one), Position(file: .h, rank: .one)]
        chessBoard.createRooks(color: .white, positions: whiteRookPositions)
        chessBoard.createRooks(color: .black, positions: blackRookPositions)
        
        let whiteQueenPositions = [Position(file: .e, rank: .eight)]
        let blackQueenPositions = [Position(file: .e, rank: .one)]
        chessBoard.createQueens(color: .white, positions: whiteQueenPositions)
        chessBoard.createQueens(color: .black, positions: blackQueenPositions)
        
        let whiteBishopPositions = [Position(file: .c, rank: .eight), Position(file: .f, rank: .eight)]
        let blackBishopPositions = [Position(file: .c, rank: .one), Position(file: .f, rank: .eight)]
        chessBoard.createBishops(color: .white, positions: whiteBishopPositions)
        chessBoard.createBishops(color: .black, positions: blackBishopPositions)
        
        let whiteKnightPositions = [Position(file: .b, rank: .eight), Position(file: .g, rank: .eight)]
        let blackKnightPositions = [Position(file: .b, rank: .one), Position(file: .g, rank: .eight)]
        chessBoard.createKnights(color: .white, positions: whiteKnightPositions)
        chessBoard.createKnights(color: .black, positions: blackKnightPositions)
    }
    
    func sss() {
        chessBoard.display()
        XCTAssertTrue(true)
    }
    
    func test_블랙_플레이어_Pawns() {
        //given
        let blackPawnPositions = [Position(file: .a, rank: .two), Position(file: .b, rank: .two), Position(file: .c, rank: .two), Position(file: .d, rank: .two)]
        let blackPawns = blackPawnPositions.map({ Pawn(color: .black, position: $0) })
        //when
        let blackPawnsInBoard = chessBoard.myPieces(color: .black).compactMap({ $0 as? Pawn })
        //then
         XCTAssertEqual(blackPawns, blackPawnsInBoard)
    }

    func test_화이트_플레이어_Pawns() {
        //given
        let whitePawnPositions = [Position(file: .a, rank: .seven), Position(file: .b, rank: .seven), Position(file: .c, rank: .seven), Position(file: .d, rank: .seven)]
        let whitePawns = whitePawnPositions.map({ Pawn(color: .white, position: $0) })
        //when
        let whitePawnsInBoard = chessBoard.myPieces(color: .white).compactMap({ $0 as? Pawn })
        //then
        XCTAssertEqual(whitePawns, whitePawnsInBoard)
    }
    
    func test_블랙_플레이어_Bishops() {
        //given
        let blackBishopPositions = [Position(file: .c, rank: .one), Position(file: .f, rank: .eight)]
        let blackBishops = blackBishopPositions.map({ Bishop(color: .black, position: $0) })
        //when
        let blackBishopsInBoard = chessBoard.myPieces(color: .black).compactMap({ $0 as? Bishop })
        //then
         XCTAssertEqual(blackBishops, blackBishopsInBoard)
    }

    func test_화이트_플레이어_Knights() {
        //given
        let whiteKnightPositions = [Position(file: .b, rank: .eight), Position(file: .g, rank: .eight)]
        let whiteKnights = whiteKnightPositions.map({ Knight(color: .white, position: $0) })
        //when
        let whiteKnightsInBoard = chessBoard.myPieces(color: .white).compactMap({ $0 as? Knight })
        //then
        XCTAssertEqual(whiteKnights, whiteKnightsInBoard)
    }

    func test_해당_위치에_존재하는_WhitePawn_이동_가능한_위치() {
        //given
        let color: ChessPieceColor = .white
        let fromPosition = Position(file: .a, rank: .seven)
        let toPosition = Position(file: .a, rank: .six)
        //when
        let movablePositions = chessBoard.movablePositions(color: color, position: fromPosition)
        //then
        let result = movablePositions.map({ $0 == toPosition }).reduce(false, { $0 || $1 })
        XCTAssertTrue(result)
    }
    
    func test_해당_위치에_존재하는_WhitePawn_이동_불가능한_위치() {
        //given
        let color: ChessPieceColor = .white
        let fromPosition = Position(file: .a, rank: .seven)
        let toPosition = Position(file: .a, rank: .five)
        //when
        let movablePositions = chessBoard.movablePositions(color: color, position: fromPosition)
        //then
        let result = movablePositions.map({ $0 == toPosition }).reduce(false, { $0 || $1 })
        XCTAssertFalse(result)
    }
    
    func test_해당_위치에_존재하는_BlackPawn_이동_가능한_위치() {
        //given
        let color: ChessPieceColor = .black
        let fromPosition = Position(file: .a, rank: .two)
        let toPosition = Position(file: .a, rank: .three)
        //when
        let movablePositions = chessBoard.movablePositions(color: color, position: fromPosition)
        //then
        let result = movablePositions.map({ $0 == toPosition }).reduce(false, { $0 || $1 })
        XCTAssertTrue(result)
    }
    
    func test_해당_위치에_존재하는_BlackPawn_이동_불가능한_위치() {
        //given
        let color: ChessPieceColor = .black
        let fromPosition = Position(file: .a, rank: .two)
        let toPosition = Position(file: .a, rank: .four)
        //when
        let movablePositions = chessBoard.movablePositions(color: color, position: fromPosition)
        //then
        let result = movablePositions.map({ $0 == toPosition }).reduce(false, { $0 || $1 })
        XCTAssertFalse(result)
    }
    
    func test_해당_위치에_존재하는_Rook_이동_가능한_위치() {
        //given
        let color: ChessPieceColor = .white
        let fromPosition = Position(file: .a, rank: .eight)
        let toPosition = Position(file: .h, rank: .eight)
        //when
        let movablePositions = chessBoard.movablePositions(color: color, position: fromPosition)
        //then
        let result = movablePositions.map({ $0 == toPosition }).reduce(false, { $0 || $1 })
        XCTAssertTrue(result)
    }
    
    func test_해당_위치에_존재하는_Rook_이동_불가능한_위치() {
        //given
        let color: ChessPieceColor = .white
        let fromPosition = Position(file: .a, rank: .eight)
        let toPosition = Position(file: .h, rank: .seven)
        //when
        let movablePositions = chessBoard.movablePositions(color: color, position: fromPosition)
        //then
        let result = movablePositions.map({ $0 == toPosition }).reduce(false, { $0 || $1 })
        XCTAssertFalse(result)
    }
    
    func test_해당_위치에_존재하는_Queen_이동_가능한_위치() {
        //given
        let color: ChessPieceColor = .white
        let fromPosition = Position(file: .e, rank: .eight)
        let toPosition = Position(file: .a, rank: .four)
        //when
        let movablePositions = chessBoard.movablePositions(color: color, position: fromPosition)
        //then
        let result = movablePositions.map({ $0 == toPosition }).reduce(false, { $0 || $1 })
        XCTAssertTrue(result)
    }
    
    func test_해당_위치에_존재하는_Queen_이동_불가능한_위치() {
        //given
        let color: ChessPieceColor = .white
        let fromPosition = Position(file: .e, rank: .eight)
        let toPosition = Position(file: .a, rank: .five)
        //when
        let movablePositions = chessBoard.movablePositions(color: color, position: fromPosition)
        //then
        let result = movablePositions.map({ $0 == toPosition }).reduce(false, { $0 || $1 })
        XCTAssertFalse(result)
    }
    
    func test_해당_위치에_존재하는_Bishop_이동_가능한_위치() {
        //given
        let color: ChessPieceColor = .white
        let fromPosition = Position(file: .c, rank: .eight)
        let toPosition = Position(file: .h, rank: .three)
        //when
        let movablePositions = chessBoard.movablePositions(color: color, position: fromPosition)
        //then
        let result = movablePositions.map({ $0 == toPosition }).reduce(false, { $0 || $1 })
        XCTAssertTrue(result)
    }
    
    func test_해당_위치에_존재하는_Bishop_이동_불가능한_위치() {
        //given
        let color: ChessPieceColor = .white
        let fromPosition = Position(file: .c, rank: .eight)
        let toPosition = Position(file: .a, rank: .five)
        //when
        let movablePositions = chessBoard.movablePositions(color: color, position: fromPosition)
        //then
        let result = movablePositions.map({ $0 == toPosition }).reduce(false, { $0 || $1 })
        XCTAssertFalse(result)
    }

    func test_해당_위치에_존재하는_Knight_이동_가능한_위치() {
        //given
        let color: ChessPieceColor = .white
        let fromPosition = Position(file: .b, rank: .eight)
        let toPosition = Position(file: .c, rank: .six)
        //when
        let movablePositions = chessBoard.movablePositions(color: color, position: fromPosition)
        //then
        let result = movablePositions.map({ $0 == toPosition }).reduce(false, { $0 || $1 })
        XCTAssertTrue(result)
    }
    
    func test_해당_위치에_존재하는_Knight_이동_불가능한_위치() {
        //given
        let color: ChessPieceColor = .white
        let fromPosition = Position(file: .b, rank: .eight)
        let toPosition = Position(file: .a, rank: .five)
        //when
        let movablePositions = chessBoard.movablePositions(color: color, position: fromPosition)
        //then
        let result = movablePositions.map({ $0 == toPosition }).reduce(false, { $0 || $1 })
        XCTAssertFalse(result)
    }
    
    func test_Pawn_삭제() {
        //given
        let removePiece = chessBoard.myPieces(color: .black).randomElement()!
        //when
        let result = chessBoard.killChessPiece(removePiece)
        //then
        XCTAssertNil(chessBoard.myPieces(color: .black).first(where: { $0.position == result?.position }))
    }

    func test_상대_Pawn_Hit() {
        //given
        let targetPawn = chessBoard.myPieces(color: .black).randomElement()!
        //when
        let result = chessBoard.checkHitPiece(color: .black, position: targetPawn.position)
        //then
        XCTAssertNotNil(result)
    }
//
    func test_상대_Pawn_Not_Hit() {
        //given
        let hitPosition = Position(file: .a, rank: .three)
        //when
        let result = chessBoard.checkHitPiece(color: .white, position: hitPosition)
        //then
        XCTAssertNil(result)
    }

    func test_Display_Not_Assert() {
        let whitePiece1 = chessBoard.myPieces(color: .white).first!
        let whitePiece2 = chessBoard.myPieces(color: .white).last!
        chessBoard.movePiece(color: .white, from: whitePiece1.position, to: Position(file: .a, rank: .four))
        chessBoard.movePiece(color: .white, from: whitePiece2.position, to: Position(file: .d, rank: .four))

        let blackPiece1 = chessBoard.myPieces(color: .black).first!
        let blackPiece2 = chessBoard.myPieces(color: .black).last!
        chessBoard.movePiece(color: .black, from: blackPiece1.position, to: Position(file: .g, rank: .five))
        chessBoard.movePiece(color: .black, from: blackPiece2.position, to: Position(file: .e, rank: .five))

        chessBoard.display()
    }
}
