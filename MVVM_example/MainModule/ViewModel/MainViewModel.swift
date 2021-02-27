//
//  MainViewModel.swift
//  MVVM_example
//
//  Created by Rusell on 26.02.2021.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> ())? { get set }
    func startFetch()
}

final class MainViewModel: MainViewModelProtocol {
    
    public var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
    
    func startFetch() {
        updateViewData?(.loading(ViewData.Data(icon: nil,
                                               title: nil,
                                               description: nil,
                                               numberPhone: nil)))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.success(ViewData.Data(icon: "checked",
                                                         title: "Success",
                                                         description: "Good",
                                                         numberPhone: nil)))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
            self?.updateViewData?(.success(ViewData.Data(icon: "delete-sign",
                                                         title: "Error",
                                                         description: "Not User",
                                                         numberPhone: nil)))
        }
    }
}
