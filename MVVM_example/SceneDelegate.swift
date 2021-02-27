//
//  SceneDelegate.swift
//  MVVM_example
//
//  Created by Rusell on 26.02.2021.
//

import UIKit
import Swinject
import SwinjectStoryboard

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var container = Container()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.registerDependencies()
        self.injectDependencies()
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        
        let swinjectStoryboard = SwinjectStoryboard.create(name: "Main", bundle: nil, container: self.container)
        window?.rootViewController = swinjectStoryboard.instantiateInitialViewController()
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

