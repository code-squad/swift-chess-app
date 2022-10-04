//
//  Error.swift
//  swift-chess-app
//
//  Created by USER on 2022/09/26.
//

import Foundation

enum Error {
    case invalidFormat, invalidPosition, notFindPawn
    
    var errorCode: Int {
        switch self {
        case .invalidFormat:            return 1001
        case .invalidPosition:          return 1002
        case .notFindPawn:              return 1003
        }
    }
    
    var message: String {
        switch self {
        case .invalidFormat:            return "입력을 확인해주세요."
        case .invalidPosition:          return "해당 위치로는 이동할 수 없습니다."
        case .notFindPawn:              return "해당 위치에 Pawn이 존재하지 않습니다."
        }
    }
}
