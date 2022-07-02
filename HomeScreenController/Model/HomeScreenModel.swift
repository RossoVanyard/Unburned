//
//  HomeScreenModel.swift
//  Unburned
//
//  Created by Roland Vanhöfen on 01.07.22.
//

import Foundation


protocol HomeScreenModelProtocol {
    var name: String? {get set}
    var delegate: HomeScreenViewModelDelegete? {get set}
}

class HomeScreenModel: HomeScreenModelProtocol {
    
    var delegate: HomeScreenViewModelDelegete?  {
        didSet{
            guard let name = self.name else {return}
            self.delegate?.setName(userName: name)
        }
    }
    
    var name: String?
    
    init(){
        defer {
            self.name = "Roland"
        }
        
    }
}
