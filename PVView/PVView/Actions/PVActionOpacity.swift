//
//  PVActionOpacity.swift
//  ParallaxView
//
//  Created by Toan Nguyen on 5/10/19.
//  Copyright © 2019 TNT. All rights reserved.
//

import Foundation
import UIKit

public class PVActionFade: PVAction {
    public let fromOpacity: Double
    public let toOpacity: Double
    public init(from fromOpacity: Double = 1,
                to toOpacity: Double = 1) {
        self.fromOpacity = fromOpacity
        self.toOpacity = toOpacity
        super.init()
    }
    
    override public func step(_ progress: Double, target: UIView) {
        let currentOpacity = fromOpacity + (toOpacity - fromOpacity) * progress
        target.layer.opacity = Float(currentOpacity)
    }
    
    public func reverse() -> PVActionFade {
        return PVActionFade(from: toOpacity, to: fromOpacity)
    }
    
    public func continueFade(to newOpacity: Double) -> PVActionFade {
        return PVActionFade(from: toOpacity, to: newOpacity)
    }
}
