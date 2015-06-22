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
@objc public class HomeModuleViewController: ModuleViewController {
    
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
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.grayColor()
    }
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        flowController.showHomeView() // show module origin view        
    }
    
    // MARK: Module Protocol
    
    public override func handleModuleURL(URLString: ModuleURL, successCallback: ModuleURL? = nil, failureCallback: ModuleURL? = nil) -> Bool {
        switch URLString {
        case .HomeModuleURL:
            return true
        default:
            println("Invalid URL \(URLString)")
            return false
        }
    }
}