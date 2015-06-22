//
//  HomeEventHandler.swift
//  ModularHome
//
//  Created by Brice Pollock on 6/13/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import Foundation


@objc protocol HomeEventInterface {
    func launchNextFeature()
}

extension HomePresenter: HomeEventInterface {
    func launchNextFeature() {
        flowController?.launchNextFeature()
    }
}