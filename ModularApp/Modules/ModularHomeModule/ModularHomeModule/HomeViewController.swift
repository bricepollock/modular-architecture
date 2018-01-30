//
//  HomeViewController.swift
//  ModularHome
//
//  Created by Brice Pollock on 6/13/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import Foundation

class HomeViewController: UIViewController {
    var presenter: HomePresenter?
    var eventHandler: HomeEventInterface?
    var viewModel: HomeViewModel?

    // MARK: Life Cycle
    
    class func createInstance(_ flowController: FlowController) -> HomeViewController {
        let moduleStoryboard = UIStoryboard(name: "HomeViewController", bundle: Bundle(for: HomeViewController.self))
        let newViewControllerInstance = moduleStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        newViewControllerInstance.presenter = HomePresenter(flowController: flowController)
        return newViewControllerInstance
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = presenter?.viewModel
        eventHandler = presenter
        loadViewData()
        self.view.backgroundColor = UIColor.green
    }
    
    // MARK: Static View Data Access
    
    func loadViewData() {
    }
    
    @IBAction func didTapNextFeatureButton(_ sender: AnyObject) {
        eventHandler?.launchNextFeature()
    }
}
