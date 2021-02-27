//
//  ViewController.swift
//  MVVM_example
//
//  Created by Rusell on 26.02.2021.
//

import UIKit

class MainViewController: UIViewController {

    var viewModel: MainViewModelProtocol!
    private var testView = TestView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //viewModel = MainViewModel()
        
        createView()
        updateView()
    }

    private func createView() {
        testView = TestView()
        testView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        testView.center = view.center
        view.addSubview(testView)
    }

    private func updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.testView.viewData = viewData
        }
    }
    @IBAction func startSimulation(_ sender: Any) {
        viewModel.startFetch()
    }
}

