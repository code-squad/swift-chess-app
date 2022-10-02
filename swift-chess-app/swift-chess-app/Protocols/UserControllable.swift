//
//  UserControllable.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

protocol UserControllable {
    
    func enterCommand() -> Action?
}
