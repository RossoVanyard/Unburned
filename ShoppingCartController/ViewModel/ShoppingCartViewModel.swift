//
//  ShoppingCartViewModel.swift
//  Unburned
//
//  Created by RossoVanyard  on 02.07.22.
//

import Foundation


protocol ShoppingCartViewModelProtocol {
    var model: ShoppingCartModelProtocol {get set}
    
}

class ShoppingCartViewModel: ShoppingCartViewModelProtocol {
    var model: ShoppingCartModelProtocol
    
    init(model: ShoppingCartModelProtocol){
        self.model = model
    }
    
}
