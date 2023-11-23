//
//  HitTestImplementation.swift
//  GVOSCollection
//
//  Created by Yan Ren on 11/21/23.
//

import UIKit

extension UIView {
    func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if isHidden || !isUserInteractionEnabled || alpha < 0.01 {
            return nil
        }
        guard self.point(inside: point, with: event) else { return nil }
        
        for subview in subviews.reversed() {
            let convertedPoint = subview.convert(point, from: self)
            if let hittestTarget = subview.hitTest(convertedPoint, with: event) {
                return hittestTarget
            }
        }
        return self
    }
}
