//
//  LoginViewModel.swift
//   Unburned
//
//  Created by RossoVanyard  on 13.05.22.
//

import Foundation

class Login_viewModel: NSObject{
    let lvm : LoginViewModelDelegate
    public init(lvm: LoginViewModelDelegate) {
        self.lvm = lvm
        super.init()
        
    }
}


