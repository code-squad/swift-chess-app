//
//  PieceTests.swift
//  SwiftChessAppTests
//
//  Created by taehyeon.lee on 2022/10/04.
//

import XCTest

final class PieceTests: XCTestCase {

    // MARK: - Bishop
    func test_Bishop_availablePositions_빈보드() {
        let bishop = BlackBishop()
        XCTAssertEqual(bishop.availablePositions(from: .init(x: .D, y: .five), on: [:]), [
            .init(x: .E, y: .six),
            .init(x: .E, y: .four),
            .init(x: .F, y: .seven),
            .init(x: .F, y: .three),
            .init(x: .G, y: .eight),
            .init(x: .G, y: .two),
            .init(x: .H, y: .one),
            .init(x: .C, y: .six),
            .init(x: .C, y: .four),
            .init(x: .B, y: .seven),
            .init(x: .B, y: .three),
            .init(x: .A, y: .eight),
            .init(x: .A, y: .two)
        ])
    }
    func test_Bishop_availablePositions_장애물() {
        let bishop = BlackBishop()
        let availablePositions = bishop.availablePositions(from: .init(x: .D, y: .five), on: [
            .init(x: .F, y: .seven): BlackPawn(),
            .init(x: .G, y: .two): BlackPawn(),
            .init(x: .C, y: .six): BlackPawn(),
            .init(x: .B, y: .three): BlackPawn(),
        ])
        XCTAssertEqual(availablePositions, [
            .init(x: .E, y: .six),
            .init(x: .E, y: .four),
            .init(x: .F, y: .three),
            .init(x: .C, y: .four),
        ])
    }
    func test_Bishop_availablePositions_장애물_상대편() {
        let bishop = BlackBishop()
        let availablePositions = bishop.availablePositions(from: .init(x: .D, y: .five), on: [
            .init(x: .F, y: .seven): WhitePawn(),
            .init(x: .G, y: .two): WhitePawn(),
            .init(x: .C, y: .six): WhitePawn(),
            .init(x: .B, y: .three): WhitePawn(),
        ])
        XCTAssertEqual(availablePositions, [
            .init(x: .E, y: .six),
            .init(x: .E, y: .four),
            .init(x: .F, y: .seven),
            .init(x: .F, y: .three),
            .init(x: .G, y: .two),
            .init(x: .C, y: .six),
            .init(x: .C, y: .four),
            .init(x: .B, y: .three)
        ])
    }

    // MARK: - Knight
    func test_Knight_availablePositions_빈보드() {
        let knight = BlackKnight()
        XCTAssertEqual(knight.availablePositions(from: .init(x: .D, y: .four), on: [:]), [
            .init(x: .F, y: .five),
            .init(x: .F, y: .three),
            .init(x: .B, y: .five),
            .init(x: .B, y: .three),
            .init(x: .E, y: .six),
            .init(x: .C, y: .six),
            .init(x: .E, y: .two),
            .init(x: .C, y: .two),
        ])
    }
    func test_Knight_availablePositions_장애물() {
        let knight = BlackKnight()
        let availablePositions = knight.availablePositions(from: .init(x: .D, y: .four), on: [
            .init(x: .D, y: .five): BlackPawn(),
            .init(x: .B, y: .three): BlackPawn(),
            .init(x: .E, y: .two): WhitePawn()
        ])
        XCTAssertEqual(availablePositions, [
            .init(x: .F, y: .five),
            .init(x: .F, y: .three),
            .init(x: .B, y: .five),
            .init(x: .E, y: .two),
            .init(x: .C, y: .two),
        ])
    }

    // MARK: - Rook
    func test_Rook_availablePositions_빈보드() {
        let rook = BlackRook()
        XCTAssertEqual(rook.availablePositions(from: .init(x: .D, y: .five), on: [:]), [
            .init(x: .E, y: .five),
            .init(x: .F, y: .five),
            .init(x: .G, y: .five),
            .init(x: .H, y: .five),
            .init(x: .C, y: .five),
            .init(x: .B, y: .five),
            .init(x: .A, y: .five),
            .init(x: .D, y: .six),
            .init(x: .D, y: .seven),
            .init(x: .D, y: .eight),
            .init(x: .D, y: .four),
            .init(x: .D, y: .three),
            .init(x: .D, y: .two),
            .init(x: .D, y: .one),
        ])
    }
    func test_Rook_availablePositions_장애물() {
        let rook = BlackRook()
        let availablePositions = rook.availablePositions(from: .init(x: .D, y: .five), on: [
            .init(x: .D, y: .seven): BlackPawn(),
            .init(x: .G, y: .five): BlackPawn(),
            .init(x: .A, y: .five): WhitePawn()
        ])
        XCTAssertEqual(availablePositions, [
            .init(x: .E, y: .five),
            .init(x: .F, y: .five),
            .init(x: .C, y: .five),
            .init(x: .B, y: .five),
            .init(x: .A, y: .five),
            .init(x: .D, y: .six),
            .init(x: .D, y: .four),
            .init(x: .D, y: .three),
            .init(x: .D, y: .two),
            .init(x: .D, y: .one),
        ])
    }

    // MARK: - Queen
    func test_Queen_availablePositions_빈보드() {
        let queen = BlackQueen()
        XCTAssertEqual(queen.availablePositions(from: .init(x: .D, y: .four), on: [:]), [
            .init(x: .E, y: .four),
            .init(x: .F, y: .four),
            .init(x: .G, y: .four),
            .init(x: .H, y: .four),
            .init(x: .C, y: .four),
            .init(x: .B, y: .four),
            .init(x: .A, y: .four),
            .init(x: .D, y: .five),
            .init(x: .D, y: .six),
            .init(x: .D, y: .seven),
            .init(x: .D, y: .eight),
            .init(x: .D, y: .three),
            .init(x: .D, y: .two),
            .init(x: .D, y: .one),
            .init(x: .E, y: .five),
            .init(x: .E, y: .three),
            .init(x: .F, y: .six),
            .init(x: .F, y: .two),
            .init(x: .G, y: .seven),
            .init(x: .G, y: .one),
            .init(x: .H, y: .eight),
            .init(x: .C, y: .five),
            .init(x: .C, y: .three),
            .init(x: .B, y: .six),
            .init(x: .B, y: .two),
            .init(x: .A, y: .seven),
            .init(x: .A, y: .one),
        ])
    }
    func test_Queen_availablePositions_장애물() {
        let queen = BlackQueen()
        let availablePositions = queen.availablePositions(from: .init(x: .D, y: .four), on: [
            .init(x: .G, y: .four): BlackPawn(),
            .init(x: .B, y: .six): BlackPawn(),
            .init(x: .D, y: .two): WhitePawn()
        ])
        XCTAssertEqual(availablePositions, [
            .init(x: .E, y: .four),
            .init(x: .F, y: .four),
            .init(x: .C, y: .four),
            .init(x: .B, y: .four),
            .init(x: .A, y: .four),
            .init(x: .D, y: .five),
            .init(x: .D, y: .six),
            .init(x: .D, y: .seven),
            .init(x: .D, y: .eight),
            .init(x: .D, y: .three),
            .init(x: .D, y: .two),
            .init(x: .E, y: .five),
            .init(x: .E, y: .three),
            .init(x: .F, y: .six),
            .init(x: .F, y: .two),
            .init(x: .G, y: .seven),
            .init(x: .G, y: .one),
            .init(x: .H, y: .eight),
            .init(x: .C, y: .five),
            .init(x: .C, y: .three),
            .init(x: .B, y: .two),
            .init(x: .A, y: .one),
        ])
    }
}
