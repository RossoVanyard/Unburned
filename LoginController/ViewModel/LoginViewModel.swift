//
//  LoginViewModel.swift
//   Unburned
//
//  Created by RossoVanyard  on 13.05.22.
//

//MARK: Header Comment
//DI is facilitated via a protocol/delegate. The model functions and variables a protocol functions and variables.


import Foundation

protocol LoginViewModelProtocol {
    var model: LoginModelProtocol {get set}
    var delegate: LoginVCProtocol? {get set}
    var state: LoginState {get set}
    func loginRegister()
    func loginRegisterStateChanged()
}

protocol LoginViewModelDelegate {
    //delegate for Communication
    func go2HomeScreen()
    
}

enum LoginState {
    case Login
    case Register
}



class LoginViewModel: LoginViewModelProtocol, LoginViewModelDelegate {
    var state: LoginState
    var model: LoginModelProtocol
    var delegate: LoginVCProtocol? //responsible for communication
    
    
    
    init(model: LoginModelProtocol, state: LoginState) {
        self.model = model
        self.state = state
        self.model.delegate = self
    }
    
    func loginRegister() {
        self.model.loginRegister()
    }
    
    func loginRegisterStateChanged(){
        self.state = self.state == .Login ? .Register : .Login
        self.model.state = self.state 
        self.delegate?.selectorChanged()
    }
    
    func go2HomeScreen(){
        self.delegate?.initHomeScreenViewController()
    }
}


