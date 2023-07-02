//
//  FindAViewWithATag.swift
//  GVOSCollection
//
//  Created by Yan Ren on 12/6/23.
//

import UIKit

extension UIView {
    func findViewViaTag(targetTag: Int, within targetView: UIView) -> UIView? {
        if targetView.tag == targetTag { return targetView }
        
        guard !targetView.subviews.isEmpty else {
            return nil
        }
        for subview in targetView.subviews {
            if subview.tag == targetTag {
                return subview
            }
            if let viewWithTag = findViewViaTag(targetTag: targetTag, within: subview) {
                return viewWithTag
            }
        }
        return nil
    }
    // Time Complexity - O(N)
    // Space Complexity - O(N)
}
