//
//  CommonAncestorView.swift
//  GVOSCollection
//
//  Created by Yan Ren on 4/25/23.
//

import UIKit

/// Extension to check if a view contains another view
extension UIView {
    func contains(_ view: UIView) -> Bool {
        return self == view || subviews.contains { $0.contains(view) }
    }
}

extension UIView {
    func fetchLCA(inputView1: UIView?, inputView2: UIView?) -> UIView? {
        let rootView = self
        
        if rootView === inputView1 || rootView === inputView2 {
            return rootView
        }
        for subview in rootView.subviews {
            if let lowestCommonSuperview = subview.fetchLCA(inputView1: inputView1, inputView2: inputView2) {
                return lowestCommonSuperview
            }
        }
        return nil
    }
}

extension ZTGGViewController {
    func fetchLowestCommonAncestorView(inputView1: UIView, inputView2: UIView) -> UIView? {
        guard inputView1 != inputView2 else { return inputView1.superview }
        
        var view1: UIView? = inputView1
        var visitedViewsOnRoute1 = Set<UIView?>()
        
        while view1 != nil {
            visitedViewsOnRoute1.insert(view1)
            view1 = view1?.superview
        }
        
        var view2: UIView? = inputView2
        while view2 != nil {
            if visitedViewsOnRoute1.contains(view2) {
                return view2
            }
            view2 = view2?.superview
        }

        return nil
    }
}

/// inputView.isDescendant(of: UIView)
