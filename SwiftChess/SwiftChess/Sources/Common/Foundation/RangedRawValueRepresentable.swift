//
//  RangedRawValueRepresentable.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/02.
//

/// `RawValue`를 범위 형태로 정의한 타입.
protocol RangedRawRepresentable: RawRepresentable, CaseIterable {
    /// 인스턴스 중 최소 RawValue 값.
    static var minimumRawValue: RawValue? { get }
    /// 인스턴스 중 최대 RawValue 값.
    static var maximumRawValue: RawValue? { get }
    /// 인스턴스 중 최소 Case.
    static var minimumCase: Self? { get }
    /// 인스턴스 중 최대 Case.
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
