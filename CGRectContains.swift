//
//  CGRectContains.swift
//  GVOSCollection
//
//  Created by Yan Ren on 9/29/23.
//

import UIKit

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
    var alternativeMaxX: CGFloat {
        return self.origin.x + self.size.width
    }
    var alternativeMaxY: CGFloat {
        return self.origin.y + self.size.height
    }
}

extension CGRect {
    func containsPoint(point: CGPoint) -> Bool {
        let x = point.x
        let y = point.y
        
        return minX < x && x < maxX && minY < y && y < maxY
    }
    
    func containsRect(rect: CGRect) -> Bool {
        return rect.minX > minX && rect.maxX < maxX && rect.minY > minY && rect.maxY < maxY
    }
}
