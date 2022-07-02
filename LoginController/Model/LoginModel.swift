//
//  Login_Model.swift
//   Unburned
//
//  Created by RossoVanyard  on 13.05.22.
//

import Foundation

protocol LoginModelProtocol {
    var name: String {get set}
    var email: String {get set}
    var password: String {get set}
    var passwordCheck: String {get set}
    var termsAccepted: Bool {get set}
    var state: LoginState {get set}
    var delegate: LoginViewModelDelegate? {get set}
    
    func register()
    func login()
    func loginRegister()
    func check4Login(email: String?, password: String?, completion: @escaping (_ error: NSError?,_ success: Bool) -> ())
    func check4Register(email: String?, userName: String?, password: String?, repeatedPassword: String?, completion: @escaping (_ error: NSError?,_ success: Bool) -> ())
}

class LoginModel: LoginModelProtocol {
    
    var delegate: LoginViewModelDelegate? //responsible for communication
    
    var name: String = ""
    var email: String = ""
    var password: String = ""
    var passwordCheck: String = ""
    var termsAccepted: Bool = false
    var state: LoginState = .Register //loginRegisterControl State
    
    init(){}
    
    func loginRegister() {
        if self.state == .Login {
            self.check4Login(email: self.email, password: self.password) { error, success in
                if success {
                    self.login()
                } else {
                    print(error)
                }
            }
        } else {
            self.check4Register(email: self.email, userName: self.name, password: self.password, repeatedPassword: self.passwordCheck) { error, success in
                if success {
                    self.register()
                } else {
                    print(error)
                }
            }
        }
    }
    
    func login() {
        self.delegate?.go2HomeScreen()
    }
    
    func register() {
        
    }
    
    func check4Login(email: String?, password: String?, completion: @escaping (_ error: NSError?,_ success: Bool) -> ()){
  
        let email = email?.lowercased()
       
        print(email)
        print(password)
       
        guard let validEmail = email?.contains("@") else {
            let err = NSError()
            completion(err,false)
            return
        }

        if(email == nil || email == "" || !validEmail){
            let err = NSError()

            completion(err, false)
        } else {
            if password != nil{
         
                completion(nil,true)
            } else {
             
                let err = NSError()
                completion(err,false)
                return
            }
        }
    }
    
    func loginApi() -> Bool{
        return true
    }
    
    
    
    func check4Register(email: String?, userName: String?, password: String?, repeatedPassword: String?, completion: @escaping (_ error: NSError?,_ success: Bool) -> ()){
        
        let email = email?.lowercased()
       
        let decimalCharacters = CharacterSet.decimalDigits
        let decimalRange = password?.rangeOfCharacter(from: decimalCharacters)
       
        print(email)
        print(userName)
        print(password)
        print(repeatedPassword)
        
        guard let validEmail = email?.contains("@") else {
            let err = NSError()
            completion(err,false)
            return
        }
        
        if(userName == nil || userName == ""){
            let err = NSError()
            completion(err, false)
        }else if(email == nil || email == "" || !validEmail){
            let err = NSError()
            completion(err, false)
            completion(err, false)
        }else if(password != repeatedPassword){
            let err = NSError()
            completion(err, false)
            completion(err, false)
        } else {
            if password != nil{
                if((decimalRange != nil) && (password!.count >= 6)){
                    completion(nil, true)
                } else {
                    let err = NSError()
                    completion(err, false)
                }
            }
        }
    }
}




