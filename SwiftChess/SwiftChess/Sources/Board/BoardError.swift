//
//  BoardError.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/01.
//

import Foundation

enum BoardError: Equatable {
    /// 유효하지 않은 rank를 전달함
    case invalidRank(Int)
    /// 이동을 시도하였으나 시작점에 체스말이 없음
    case pieceNotExistsAtStartPoint(Board.Location)
    /// 이동 가능한 위치가 존재하지 않음
    case movableLocationsNotExists
    /// 이동 시 시작점과 도착점이 동일할 수 없음
    case startEndPointShouldNotBeIdentical
    /// 이동 규칙에 따라 해당 체스말은 지정한 도착점로 이동할 수 없음
    case moveRuleViolated(possibleEndPoints: [Board.Location])
    /// 도착점에 동일한 색상의 체스말이 이미 존재하여 이동할 수 없음
    case identicalColoredPieceAlreadyExists(endPoint: Board.Location)
}

extension BoardError: LocalizedError {

    var errorDescription: String? {
        switch self {
        case let .invalidRank(rank):
            return """
            유효하지 않은 rank를 입력했습니다. 입력한 Rank: \(rank)"
            입력 가능한 범위 \(Board.Location.Rank.minimumRawValue ?? 0) ~ \(Board.Location.Rank.maximumRawValue ?? 0)
            """

        case let .pieceNotExistsAtStartPoint(startPoint):
            return "시작점에 체스말이 없습니다. 입력한 시작점: \(startPoint)"

        case .movableLocationsNotExists:
            return "현재 지점에서 이동 가능한 위치가 존재하지 않습니다."

        case .startEndPointShouldNotBeIdentical:
            return "시작점과 도착점이 동일합니다. 입력을 다시 확인해주세요."

        case let .moveRuleViolated(possibleEndPoints):
            return "지정한 체스말의 이동규칙으로는 지정한 도착점으로 이동할 수 없습니다. 이동할 수 있는 곳은 \(possibleEndPoints)입니다."

        case let .identicalColoredPieceAlreadyExists(endPoint):
            return "도착점에 동일한 색상의 체스말이 이미 존재하여 이동할 수 없습니다. 입력한 도착점: \(endPoint)"
        }
    }
}
