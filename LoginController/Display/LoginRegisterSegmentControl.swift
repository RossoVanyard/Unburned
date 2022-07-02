//
//  LoginRegisterSegmentControl.swift
//  Unburned
//
//  Created by Roland Vanhöfen on 01.07.22.
//

import Foundation
import UIKit



class LoginRegisterSegmentControl:  UISegmentedControl {
    
    var delegate: LoginViewModelProtocol
    
    init(items: [Any]?,delegate: LoginViewModelProtocol) {
        self.delegate = delegate
        super.init(items: items)
        self.tintColor = UIColor(red: 25/255, green: 41/255, blue: 61/255, alpha: 1)
        self.backgroundColor = .purple
        self.selectedSegmentIndex = self.delegate.state == .Register ? 1 : 0
        self.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleLoginRegisterChange(){
        self.delegate.loginRegisterStateChanged()
        
    }
}



