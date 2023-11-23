//
//  CGGeometry.swift
//  GVOSCollection
//
//  Created by Yan Ren on 2/15/23.
//

import UIKit

extension CGRect {
    func intertwined(with anotherRect: CGRect) -> Bool {
        let anoX = anotherRect.origin.x, anoY = anotherRect.origin.y
        let anoWidth = anotherRect.size.width, anoHeight = anotherRect.size.height
        
        var pointsCollection = [CGPoint]()
        
        pointsCollection.append(anotherRect.origin)/// 左上角
        pointsCollection.append(CGPoint(x: anoX, y: anoY + anoHeight)) /// 左下角
        pointsCollection.append(CGPoint(x: anoX + anoWidth, y: anoY)) /// 右上角
        pointsCollection.append(CGPoint(x: anoX + anoWidth, y: anoY + anoHeight)) /// 右下角
        
        /// check if any one of anotherRect's four points in the collection,
        /// satisfy the condition where it is inside of the initial rectangle's x & y ranges.
        return pointsCollection.reduce(false) { $0 ||
               $1.x >= self.origin.x
            && $1.x <= self.origin.x + self.size.width
            && $1.y >= self.origin.y
            && $1.y <= self.origin.y + self.size.height }
    }
}


final class CGGeometryImitated {
    struct CGPointImitated {
        var x: Double
        var y: Double
        
        init(x: CGFloat, y: CGFloat) {
            self.x = x
            self.y = y
        }
    }
    struct CGSizeImitated {
        var width: CGFloat
        var height: CGFloat
        
        init(width: CGFloat, height: CGFloat) {
            self.width = width
            self.height = height
        }
    }
    
    struct CGRectImitated {
        var origin: CGPointImitated
        var size: CGSizeImitated
        
        init(origin: CGPointImitated, size: CGSizeImitated) {
            self.origin = origin
            self.size = size
        }
    }
}

