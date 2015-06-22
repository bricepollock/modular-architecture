//
//  UIView+Layout.swift
//  ModularFoundation
//
//  Created by Brice Pollock on 6/13/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    public func addAndFillWithSubview(subview: UIView) {
        self.addSubview(subview)
        subview.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: subview, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: subview, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: subview, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: subview, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0))
    }
}
