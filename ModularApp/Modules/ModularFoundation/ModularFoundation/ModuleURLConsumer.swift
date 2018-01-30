//
//  ModuleURLConsumer.swift
//  ModularFoundation
//
//  Created by Brice Pollock on 6/13/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import Foundation

public protocol ModuleURLObserver: class {
    func handleModuleURL(_ URLString: ModuleURL, successCallback: ModuleURL?, failureCallback: ModuleURL?) -> Bool
}

public protocol ModuleURLConsumer: class, ModuleURLObserver {    
    var successCallback: ModuleURL? { get }
    var failureCallback: ModuleURL? { get }
}

open class ModuleViewController: UIViewController, ModuleURLConsumer {
    open var successCallback: ModuleURL?
    open var failureCallback: ModuleURL?
    
    open func handleModuleURL(_ URLString: ModuleURL, successCallback: ModuleURL? = nil, failureCallback: ModuleURL? = nil) -> Bool {
        fatalError("Subclass must implement")
    }
}
