//
//  Team.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/10/11.
//

import Foundation

enum Color {
    case white
    case black
}

protocol TeamSelectable {
    var color: Color { get }
}
