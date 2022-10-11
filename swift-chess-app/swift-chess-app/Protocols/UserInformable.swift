//
//  UserInformable.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

protocol UserInformable {
    
    var id: String { get }
    
    var name: String { get }
    
    var color: Color { get }
    
    var state: UserState { get }
    
    var pieces: [Piece] { get set }
}
