//
//  RangedRawValueRepresentable.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/02.
//

protocol RangedRawRepresentable: RawRepresentable, CaseIterable {
    static var minimumRawValue: RawValue? { get }
    static var maximumRawValue: RawValue? { get }
    static var minimumCase: Self? { get }
    static var maximumCase: Self? { get }
}

extension RangedRawRepresentable where Self: RawValueInitializable, RawValue: Comparable {

    static var minimumRawValue: RawValue? {
        return allCases.map(\.rawValue).min()
    }

    static var maximumRawValue: RawValue? {
        return allCases.map(\.rawValue).max()
    }

    static var minimumCase: Self? {
        guard let minimumRawValue = minimumRawValue else { return nil }
        return Self(rawValue: minimumRawValue)
    }

    static var maximumCase: Self? {
        guard let maximumRawValue = maximumRawValue else { return nil }
        return Self(rawValue: maximumRawValue)
    }
}
