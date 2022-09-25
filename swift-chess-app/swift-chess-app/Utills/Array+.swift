//
//  Array+.swift
//  swift-chess-app
//
//  Created by USER on 2022/09/26.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }

    func partition(where belongsInSecondPartition: (Element) throws -> Bool) rethrows -> ([Element], [Element]) {
        var result = self
        let idx = try result.partition(by: belongsInSecondPartition)
        return (Array(result[..<idx]), Array(result[idx...]))
    }
    
    func split(separator: (Element, Element) -> Bool) -> [[Element]] {
        guard let firstElement = first else {
            return []
        }
        var result: [[Element]] = []
        var buildingGroup: [Element] = [firstElement]
        var lastElement = firstElement
        for idx in 1..<count {
            let element = self[idx]
            if separator(lastElement, element) {
                result.append(buildingGroup)
                buildingGroup = [element]
            } else {
                buildingGroup.append(element)
            }
            lastElement = element
        }
        result.append(buildingGroup)
        return result
    }

    func split<R>(separatorInitializer: (Element) -> R, separator: (R, Element, Element) -> (R, Bool)) -> [[Element]] {
        guard let firstElement = first else {
            return []
        }
        var result: [[Element]] = []
        var buildingGroup: [Element] = [firstElement]
        var lastElement = firstElement
        var separatorState = separatorInitializer(firstElement)
        for idx in 1..<count {
            let element = self[idx]
            let (nextState, shouldSperate) = separator(separatorState, lastElement, element)
            if shouldSperate {
                result.append(buildingGroup)
                separatorState = separatorInitializer(element)
                buildingGroup = [element]
            } else {
                buildingGroup.append(element)
                separatorState = nextState
            }
            lastElement = element
        }
        result.append(buildingGroup)
        return result
    }
    
    func nonEmpty() -> Bool {
        return !isEmpty
    }
}
