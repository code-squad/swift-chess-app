//
//  Error.swift
//  swift-chess-app
//
//  Created by USER on 2022/09/26.
//

import Foundation

protocol ChessBoardError: Error {
    var errorCode: Int { get }
    var message: String { get }
}

enum CommandError: ChessBoardError {
    case invalidFormat, invaildPlayer(ChessPieceColor)
    
    var errorCode: Int {
        switch self {
        case .invalidFormat:                return 1001
        case .invaildPlayer(_):             return 1002
        }
    }
    
    var message: String {
        switch self {
        case .invalidFormat:                return "입력을 확인해주세요. (현재위치->이동위치) / (?현재위치)"
        case .invaildPlayer(let color):     return "\(color) 체스말의 차례입니다."
        }
    }
}

enum PieceError: ChessBoardError {
    case invalidPosition, notFindPiece
    
    var errorCode: Int {
        switch self {
        case .invalidPosition:            return 2001
        case .notFindPiece:               return 2002
        }
    }
    
    var message: String {
        switch self {
        case .invalidPosition:            return "해당 위치로는 이동할 수 없습니다."
        case .notFindPiece:               return "해당 위치에 체스말이 존재하지 않습니다."
        }
    }
}
