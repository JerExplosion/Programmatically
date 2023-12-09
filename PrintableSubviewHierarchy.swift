//
//  PrintableSubviewHierarchy.swift
//  GVOSCollection
//
//  Created by Yan Ren on 11/27/23.
//

import UIKit

extension ZTGGViewController {
    func subviewsPrint(of inputView: UIView) -> [UIView] {
        var viewCollection = [UIView]()
        
        func recursivePrinter(currLevel: Int, inputView: UIView) {
            if currLevel == 0 {
                viewCollection.append(inputView)
                print("\(inputView.classForCoder)")
            }
            let spacer = String(repeating: String(repeating: " ", count: 4), count: currLevel + 1)
            
            for subview in inputView.subviews {
                print(spacer + "|--> \(subview.classForCoder)")
                viewCollection.append(subview)
                guard !subview.subviews.isEmpty else { continue }
                recursivePrinter(currLevel: currLevel + 1, inputView: subview)
            }
        }
        recursivePrinter(currLevel: 0, inputView: inputView)
        return viewCollection
    }
}

// MARK: - de-integrate into separate functions

func recursivePrinter(currLevel: Int, inputView: UIView, viewCollection: inout [UIView]) {
    if currLevel == 0 {
        viewCollection.append(inputView)
        print("\(inputView.classForCoder)")
    }

    let spacer = String(repeating: String(repeating: " ", count: 4), count: currLevel + 1)

    for subview in inputView.subviews {
        print(spacer + "|--> \(subview.classForCoder)")
        viewCollection.append(subview)
        guard !subview.subviews.isEmpty else { continue }
        recursivePrinter(currLevel: currLevel + 1, inputView: subview, viewCollection: &viewCollection)
    }
}

func subviewsPrint(of inputView: UIView) -> [UIView] {
    var viewCollection = [UIView]()
    recursivePrinter(currLevel: 0, inputView: inputView, viewCollection: &viewCollection)
    return viewCollection
}
