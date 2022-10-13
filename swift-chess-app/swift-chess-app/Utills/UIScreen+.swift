//
//  UIScreen+.swift
//  swift-chess-app
//
//  Created by USER on 2022/10/10.
//

import UIKit

extension UIScene {
    static var maxSquare: CGSize {
        let maxLength = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        return CGSize(width: maxLength, height: maxLength)
    }
}
