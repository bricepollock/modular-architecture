//
//  FlowController.swift
//  ModularHome
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
    var homeViewController: UIViewController?
    
    // MARK: Show Methods
    func showHomeView() {
        let homeViewController = HomeViewController.createInstance(self)
        if let moduleViewController = moduleViewController {
            homeViewController.launchInContainerViewController(moduleViewController, animated: false)            
        }
        self.homeViewController = homeViewController
    }
    
    // MARK: Helper
    func moduleStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "___PROJECTNAMEASIDENTIFIER___", bundle: NSBundle(forClass: FlowController.self))
    }
    
    // MARK: Dismiss - call the callback handler here or dismiss
    
    func dismiss(presentingViewController: UIViewController) {
        presentingViewController.dismissViewControllerAnimated(true, completion:nil)
        return
    }
    
    // MARK: Routing
    
    func launchNextFeature() {
        SharedModuleRouter.hostApp()?.handleModuleURL(ModuleURL.PlainOldFeatureModuleURL(featureUUID: "as9pd8fnpawef9wnwlmsn"), successCallback: nil, failureCallback: nil)
    }
}