//
//  FlowController.swift
//  ModularPlainOldFeature
//
//  Created by Brice Pollock on 6/13/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import Foundation
import ModularFoundation

/**
*  Manage view controller transistions and view controller state
*/
class FlowController: NSObject {
    weak var moduleViewController: UIViewController?
    var textPageViewController: UIViewController?
    
    // MARK: Show Methods
    func showPlainOldFeatureView(featureUUID: String) {
        let textPageViewController = TextPageViewController.createInstance(flowController: self, featureUUID: featureUUID)
        if let moduleViewController = moduleViewController {
            textPageViewController.launchInContainerViewController(moduleViewController, animated: false)
        }
        self.textPageViewController = textPageViewController
    }
    
    // MARK: Dismiss - call the callback handler here or dismiss
    
    func dismiss() {
        moduleViewController?.dismissViewControllerAnimated(true, completion: nil)
        return
    }
}