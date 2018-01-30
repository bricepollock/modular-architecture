//
//  HomeModuleViewController.swift
//  ModularHome
//
//  Created by Brice Pollock on 6/13/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import Foundation
import ModularFoundation

/**
*  This is the template that all feature modules should follow for creation of the various objects
*/
open class HomeModuleViewController: ModuleViewController {
    
    let flowController: FlowController
    
    // MARK: Life Cycle
    
    public init() {
        flowController = FlowController()
        super.init(nibName: nil, bundle: nil)
        flowController.moduleViewController = self
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        flowController.showHomeView() // show module origin view        
    }
    
    // MARK: Module Protocol
    
    open override func handleModuleURL(_ URLString: ModuleURL, successCallback: ModuleURL? = nil, failureCallback: ModuleURL? = nil) -> Bool {
        switch URLString {
        case .homeModuleURL:
            return true
        default:
            print("Invalid URL \(URLString)")
            return false
        }
    }
}
