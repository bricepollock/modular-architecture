//
//  UIViewController+layout.swift
//  ModularFoundation
//
//  Created by Brice Pollock on 6/13/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    public func launchInContainerViewController(_ containerViewController: UIViewController, animated: Bool = true) {
        containerViewController.addChildViewController(self)
        containerViewController.view.addAndFillWithSubview(view)
        didMove(toParentViewController: containerViewController)
        
        if animated == true {
            view.animateFadIn()
        }
    }
}
