//
//  HomeScreenViewController.swift
//  Unburned
//
//  Created by Roland Vanhöfen on 01.07.22.
//

import Foundation

protocol HomeScreenViewControllerProtocol {
    // injects dependancies via protocol injection
    var viewModel: HomeScreenViewModelProtocol {get set}
}


class HomeScreenViewController: BaseUIViewController, HomeScreenViewControllerProtocol {
    var viewModel: HomeScreenViewModelProtocol
    
    init(viewModel: HomeScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
