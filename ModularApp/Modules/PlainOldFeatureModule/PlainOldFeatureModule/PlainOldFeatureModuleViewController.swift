//
//  PlainOldFeatureModuleViewController.swift
//  ModularPlainOldFeature
//
//  Created by Brice Pollock on 6/13/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import Foundation
import ModularFoundation

/**
*  This is the template that all feature modules should follow for creation of the various objects
*/
@objc public class PlainOldFeatureModuleViewController: ModuleViewController {
    
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
        view.backgroundColor = UIColor.whiteColor()

    }
    
    // MARK: Module Protocol
    
    public override func handleModuleURL(URLString: ModuleURL, successCallback: ModuleURL? = nil, failureCallback: ModuleURL? = nil) -> Bool {
        switch URLString {
        case .PlainOldFeatureModuleURL(let featureUUID):
            flowController.showPlainOldFeatureView(featureUUID) // show module origin view
            return true
        default:
            print("Invalid URL \(URLString)")
            return false
        }
    }
}