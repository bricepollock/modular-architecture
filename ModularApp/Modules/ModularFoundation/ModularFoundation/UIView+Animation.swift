//
//  UIView+Animation.swift
//  ModularFoundation
//
//  Created by Brice Pollock on 6/13/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func animateFadIn() {
        self.alpha = 0.0
        UIView.animateWithDuration(0.3, animations: {
            self.alpha = 1.0
        })
    }
}
