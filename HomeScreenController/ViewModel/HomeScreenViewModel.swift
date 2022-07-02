//
//  HomeScreenViewModel.swift
//  Unburned
//
//  Created by Roland Vanhöfen on 01.07.22.
//

import Foundation
protocol HomeScreenViewModelProtocol {
    var model: HomeScreenModelProtocol {get set}
    
}

class HomeScreenViewModel: HomeScreenViewModelProtocol {
    var model: HomeScreenModelProtocol
    
    init(model: HomeScreenModelProtocol) {
        self.model = model
    }
}
