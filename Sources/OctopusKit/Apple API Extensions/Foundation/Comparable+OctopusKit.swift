//
//  Comparable+OctopusKit.swift
//  OctopusKit
//
//  Created by ShinryakuTako@invadingoctopus.io on 2018/05/06.
//  Copyright © 2020 Invading Octopus. Licensed under Apache License v2.0 (see LICENSE.txt)
//

// TODO: Eliminate code duplication for clamped(to:) etc.?
// CHECK: Should we check for empty ranges in clamped(to:) etc.?

import Foundation

public extension Comparable {
    
    // NOTE: An extension to the `Comparable` protocol applies to `Int`, `Float`, `Double`, etc.
    
    /// Returns a value which is equal to this value limited to the specified range.
    @inlinable
    func clamped(to range: ClosedRange<Self>) -> Self {
        // CREDIT: https://stackoverflow.com/a/43769799/1948215
        // NOTE: This does not need `upperBound - 1` as for `Range` because 0...10 must include 10.
        min(max(self, range.lowerBound), range.upperBound)
    }
    
    /// Limits this value to the specified range.
    @inlinable
    mutating func clamp(to range: ClosedRange<Self>) {
        self = self.clamped(to: range)
    }
}

public extension Comparable where Self: BinaryInteger {
    
    /// Returns a value which is equal to this value limited to the specified range.
    @inlinable
    func clamped(to range: Range<Self>) -> Self {
        // CREDIT: https://stackoverflow.com/a/43769799/1948215
        // NOTE: We cannot implement this for floating point because the upper bound of `0 ..< 8.5 - 1` would be 7.5 not 8.4
        min(max(self, range.lowerBound), range.upperBound - 1) // ❕ Because the upperBound of `0 ..< 10` woud be 10
    }
    
    /// Limits this value to the specified range.
    @inlinable
    mutating func clamp(to range: Range<Self>) {
        self = self.clamped(to: range)
    }
}
