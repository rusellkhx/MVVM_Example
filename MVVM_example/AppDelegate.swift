//
//  AppDelegate.swift
//  MVVM_example
//
//  Created by Rusell on 26.02.2021.
//

import UIKit
import Swinject
import SwinjectStoryboard

@available(iOS 12.0, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var container = Container()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.registerDependencies()
        self.injectDependencies()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        
        let swinjectStoryboard = SwinjectStoryboard.create(name: "Main", bundle: nil, container: self.container)
        window.rootViewController = swinjectStoryboard.instantiateInitialViewController()
        return true
    }
    
    private func registerDependencies() {
        self.container.register(MainViewModelProtocol.self, factory: { resolver in
            return MainViewModel()
        })
    }
    
    private func injectDependencies() {
        self.container.storyboardInitCompleted(MainViewController.self) { (resolver, viewController) in
            viewController.viewModel = resolver.resolve(MainViewModelProtocol.self)
        }
    }
}

