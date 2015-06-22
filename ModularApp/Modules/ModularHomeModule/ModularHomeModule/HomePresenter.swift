//
//  HomePresenter.swift
//  ModularHome
//
//  Created by Brice Pollock on 6/13/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import Foundation

class HomePresenter: NSObject {
    let interactor: Interactor
    let viewModel: HomeViewModel
    weak var flowController: FlowController?
    
    init(flowController: FlowController, interactor: Interactor = Interactor(), viewModel: HomeViewModel = HomeViewModel()) {
        self.flowController = flowController
        self.interactor = interactor
        self.viewModel = viewModel
        super.init()
    }
}