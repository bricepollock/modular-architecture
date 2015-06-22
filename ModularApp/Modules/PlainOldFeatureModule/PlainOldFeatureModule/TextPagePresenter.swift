//
//  TextPagePresenter.swift
//  PlainOldFeatureModule
//
//  Created by Brice Pollock on 6/13/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import Foundation

class TextPagePresenter: NSObject {
    let interactor: Interactor
    let viewModel: TextPageViewModel
    let viewData: TextPageViewData
    weak var flowController: FlowController?
    
    init(flowController: FlowController, featureUUID: String, interactor: Interactor = Interactor(), viewModel: TextPageViewModel = TextPageViewModel()) {
        self.flowController = flowController
        self.interactor = interactor
        self.viewModel = viewModel
        self.viewData = TextPageViewData(descriptionText: "Loaded Text Page with UUID: \(featureUUID)")
        super.init()
    }
}