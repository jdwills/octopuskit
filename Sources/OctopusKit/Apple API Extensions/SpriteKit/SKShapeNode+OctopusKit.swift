//
//  SKShapeNode+OctopusKit.swift
//  OctopusKit
//
//  Created by ShinryakuTako@invadingoctopus.io on 2020/05/06.
//  Copyright © 2020 Invading Octopus. Licensed under Apache License v2.0 (see LICENSE.txt)
//

import SpriteKit

public extension SKShapeNode {
    
    // MARK: - Modifiers
    // As in SwiftUI.
    
    /// Returns this shape after setting the color of its fill.
    @inlinable
    final func fillColor(_ color: SKColor) -> Self {
        self.fillColor = color
        return self
    }
    
    /// Returns this shape after setting the color of its stroke.
    @inlinable
    final func strokeColor(_ color: SKColor) -> Self {
        self.strokeColor = color
        return self
    }
    
}
