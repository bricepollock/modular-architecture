//
//  AppDelegate+Routing.swift
//
//  Created by Brice Pollock on 6/13/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import Foundation
import ModularFoundation
import ModularHomeModule
import PlainOldFeatureModule

extension AppDelegate {
    func configureRouting() {
        registerModuleURLs()
        
        // Register Host App
        if let window = window {
            let applicationFlowController = ApplicationFlowController(window: window)
            SharedModuleRouter.registerHostApp(applicationFlowController)
            appFlowController = applicationFlowController
        }
    }
    
    func registerModuleURLs() {
        SharedModuleRouter.registerModuleClass(HomeModuleViewController.self, URLPath: ModuleURL.homeModuleURL.path)
        SharedModuleRouter.registerModuleClass(PlainOldFeatureModuleViewController.self, URLPath: ModuleURL.plainOldFeatureModuleURL(featureUUID: "").routingPath)
    }
}

