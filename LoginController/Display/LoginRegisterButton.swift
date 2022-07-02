//
//  LoginRegisterButton.swift
//  Unburned
//
//  Created by RossoVanyard  on 01.07.22.
//

import Foundation
import UIKit


class LoginRegisterButton: UIButton {
    
    var delegate: LoginViewModelProtocol
    
    init(frame: CGRect, delegate: LoginViewModelProtocol) {
        self.delegate = delegate
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(self, action: #selector(loginRegister), for: .touchUpInside)
        self.backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func loginRegister(){
        self.delegate.loginRegister()
    }
    
}
