//
//  Chess.swift
//  ChessGame
//
//  Created by JunHeeJo on 9/27/22.
//

import Foundation

class Chess {
    var status: Status = .ready
    
    func start() {
        status = .inProgress
    }
}
