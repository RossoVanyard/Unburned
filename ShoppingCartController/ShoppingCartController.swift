//
//  ShoppingCartController.swift
//  Unburned
//
//  Created by RossoVanyard on 02.07.22.
//

import Foundation
import UIKit

protocol ShoppingCartViewControllerProtocol {
    // injects dependancies via protocol injection
    var viewModel: ShoppingCartViewModelProtocol {get set}
    
}

class ShoppingCartViewController: BaseUIViewController, ShoppingCartViewControllerProtocol{
    var viewModel: ShoppingCartViewModelProtocol
    
    init(viewModel: ShoppingCartViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
        self.view.backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setHeight(uiViews: self.scrollView.subviews, constant: 0)
    }
}
