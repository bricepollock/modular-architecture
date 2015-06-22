//
//  ModuleRouter.swift
//  ModularFoundation
//
//  Created by Brice Pollock on 6/13/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import Foundation
import UIKit

public  var SharedModuleRouter: ModuleRouter {
    struct Singleton {
        static let instance = InternalModuleRouter()
    }
    return Singleton.instance
}

public protocol ModuleRouter {
    
    // Register consumers for URLs
    func registerModuleClass(consumer: AnyClass, URLPath: String)
    
    // Host app is basically our delegate
    func registerHostApp(hostApp: ModuleURLObserver)
    
    // Get Module View Controller for an interface
    func moduleForURLPath(URLPath: String) -> ModuleViewController?
    
    func hostApp() -> ModuleURLObserver?
}


class InternalModuleRouter: ModuleRouter {
    private var moduleURLMap = [String: AnyClass]() // URL -> ModuleViewControllerClass
    private var hostAppInternal: ModuleURLObserver?

    // MARK: Host App
    func registerHostApp(hostApp: ModuleURLObserver) {
        self.hostAppInternal = hostApp
    }
    
    func hostApp() -> ModuleURLObserver? {
        return self.hostAppInternal
    }
    
    // MARK: Module URLs
    func registerModuleClass(viewControllerClass: AnyClass, URLPath: String) {
        moduleURLMap[URLPath] = viewControllerClass
    }
    
    func moduleForURLPath(URLPath: String) -> ModuleViewController? {
        if let moduleViewControllerClass = moduleURLMap[URLPath] as? ModuleViewController.Type {
            return moduleViewControllerClass()
        }
        println("Unable find module for URL: \(URLPath)")
        return nil
    }
}