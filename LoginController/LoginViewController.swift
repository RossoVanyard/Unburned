//
//  LoginViewController.swift
//   Unburned
//
//  Created by RossoVanyard  on 13.05.22.
//

import Foundation
import UIKit


//MARK: Header Comment
//This VC displays the login panel and forms the rootViewController. It is responsible for
//facilitating the login process. It makes use of protocols/ interfaces for the purpose of
//dependancy injection.



//TODO: change Logo


class Login_viewController: UIViewController, LoginDisplayDelegate{
    //MARK: MVVM
    let viewModel: LoginViewModel
   
    
    //MARK: Protocol variables
    var logo: UIImageView?
    var logoConstrains: [NSLayoutConstraint]?
    var loginPanel: LoginPanel?
    var loginPanelConstrains: [NSLayoutConstraint]?
    
    
    init(loginViewModel: LoginViewModel) {
        self.viewModel = loginViewModel
        super.init(nibName: nil, bundle: nil) //# or NIB name here if you'll use xib file
        self.mountLogo()
        self.mountLoginPanel()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLogo()
        self.setupLoginPanel()
        self.view.backgroundColor = .blue
        
    }
    
    
    //MARK: logo protocol
    func mountLogo() {
        self.logo = UIImageView(image: UIImage(named: "example"))
        self.logo?.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupLogo() {
        guard let logo = self.logo else { return }
        self.view.addSubview(logo)
        logo.backgroundColor = .red
        
        if let constraints = self.logoConstrains {
            NSLayoutConstraint.deactivate(constraints)
        }
        
        self.logoConstrains = [
            self.logo!.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height * 0.05),
            self.logo!.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.logo!.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75),
            self.logo!.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75)
            ]
        if let constraints = self.logoConstrains {
            NSLayoutConstraint.activate(constraints)
        }
    }

    //MARK: login panel protocol
    func mountLoginPanel(){
        self.loginPanel = LoginPanel()
        self.loginPanel?.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupLoginPanel(){
        guard let logo = self.logo else { return }
        guard let loginPanel = self.loginPanel else { return }
        self.view.addSubview(loginPanel)

        if let constraints = self.loginPanelConstrains {
            NSLayoutConstraint.deactivate(constraints)
        }
    
        self.loginPanelConstrains = [
            self.loginPanel!.topAnchor.constraint(equalTo: self.logo!.bottomAnchor, constant: UIScreen.main.bounds.height * 0.05),
            self.loginPanel!.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.loginPanel!.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75),
            self.loginPanel!.heightAnchor.constraint(equalToConstant: self.loginPanel!.heigthNonCollapsed)
        ]
    
        if let constraints = self.loginPanelConstrains {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
   
    
    
    
}
