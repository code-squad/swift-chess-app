//
//  ChessMovableDirection.swift
//  swift-chess-app
//
//  Created by USER on 2022/10/04.
//

import Foundation

enum ChessMovableDirection {
    case go, back, left, right, leftBack, leftGo, rightBack, rightGo
    case jumpToOneClock, jumpToTwoClock, jumpToFourClock, jumpToFiveClock,
         jumpToSevenClock, jumpToEightClock, jumpToTenClock, jumpToElevenClock
    
    var toCoordinate: (Int, Int) {
        switch self {
        case .go:                       return (0, 1)
        case .back:                     return (0, -1)
        case .left:                     return (-1, 0)
        case .right:                    return (1, 0)
        case .leftBack:                 return (-1, -1)
        case .leftGo:                   return (-1, 1)
        case .rightBack:                return (1, -1)
        case .rightGo:                  return (1, 1)
        case .jumpToOneClock:           return (1, -2)
        case .jumpToTwoClock:           return (2, -1)
        case .jumpToFourClock:          return (2, 1)
        case .jumpToFiveClock:          return (1, 2)
        case .jumpToSevenClock:         return (-1, 2)
        case .jumpToEightClock:         return (-2, 1)
        case .jumpToTenClock:           return (-2, -1)
        case .jumpToElevenClock:        return (-1, -2)
        }
    }
}
