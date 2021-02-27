//
//  Builder.swift
//  MVVM_example
//
//  Created by Rusell on 27.02.2021.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        return view
    }
}
