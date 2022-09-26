//
//  Board.swift
//  ChessApp
//
//  Created by Jinho Jang on 2022/09/27.
//

protocol Boardable {
    func movePawn(from: String, to: String) -> Bool
}
