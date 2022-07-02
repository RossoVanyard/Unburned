//
//  HomeScreenViewModel.swift
//  Unburned
//
//  Created by RossoVanyard  on 01.07.22.
//

import Foundation
protocol HomeScreenViewModelProtocol {
    var model: HomeScreenModelProtocol {get set}
    var delegate: HomeScreenVCDelegate? {get set}
    var userName: String? {get set}
}

protocol HomeScreenViewModelDelegete{
    func setName(userName: String)
}

class HomeScreenViewModel: HomeScreenViewModelProtocol, HomeScreenViewModelDelegete {
    
    
    var userName: String? 
    var model: HomeScreenModelProtocol
    
    var delegate: HomeScreenVCDelegate?{
        didSet{
            self.delegate?.setUserName(name: userName!)
        }
    }
    
    init(model: HomeScreenModelProtocol) {
        self.model = model
        self.model.delegate = self
    }
    
    
    func setName(userName: String) {
        self.userName = userName
    }
}
