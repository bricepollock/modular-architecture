//
//  ApplicationFlowController.swift
//
//  Created by Brice Pollock on 6/13/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import Foundation
import ModularFoundation

@objc class ApplicationFlowController: NSObject, ModuleURLObserver {
    let rootViewController: UINavigationController

    init(window: UIWindow) {
        let launchModuleURL = ModuleURL.HomeModuleURL
        if let homeViewController = SharedModuleRouter.moduleForURLPath(launchModuleURL.path) {
            let mainNavigationController = UINavigationController(rootViewController: homeViewController)
            window.rootViewController = mainNavigationController
            rootViewController = mainNavigationController
            homeViewController.handleModuleURL(launchModuleURL)
        } else {
            print("Unable to launch home view")
            rootViewController = UINavigationController()
        }
        super.init()
    }
    
    func registerAsHost() {
        SharedModuleRouter.registerHostApp(self)
    }
    
    internal func handleModuleURL(moduleURL: ModuleURL, successCallback: ModuleURL? = nil, failureCallback: ModuleURL? = nil) -> Bool {
        switch moduleURL {
        case .HomeModuleURL:
            if let homeViewController = SharedModuleRouter.moduleForURLPath(moduleURL.path) {
                rootViewController.popToRootViewControllerAnimated(true)
                rootViewController.pushViewController(homeViewController, animated: false)
                homeViewController.handleModuleURL(moduleURL)
            }
            return true
            
        case .PlainOldFeatureModuleURL(let featureUUID):
            if let nextModuleViewController = SharedModuleRouter.moduleForURLPath(moduleURL.routingPath) {
                rootViewController.pushViewController(nextModuleViewController, animated: true)
                nextModuleViewController.handleModuleURL(moduleURL)
            }
            return true
        default:
            print("Home Module cannot handle URL: \(moduleURL)")
            return false
        }
    }
}