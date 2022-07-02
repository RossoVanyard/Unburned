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

protocol LoginVCProtocol {
    // injects dependancies via protocol injection
    var viewModel: LoginViewModelProtocol {get set}
    func initHomeScreenViewController()
    func selectorChanged()
}


class LoginViewController: BaseUIViewController, LoginVCProtocol, LoginDisplayProtocol, LoginDisplayDelegate  {
    
    
    
    
    
    //MARK: MVVM
    var viewModel: LoginViewModelProtocol
    
    
    
    //MARK: Display
    var logo: UIImageView?
    var logoConstrains: [NSLayoutConstraint]?
    
    var segementControl: LoginRegisterSegmentControl?
    var segmentControlConstrains: [NSLayoutConstraint]?
    
    var loginPanel: LoginPanel?
    var loginPanelConstrains: [NSLayoutConstraint]?
    
    
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init() //# or NIB name here if you'll use xib file
        self.viewModel.delegate = self
        self.mountLogo()
        self.mountSegmentControl()
        self.mountLoginPanel()
        self.mountButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let logo = self.logo else { return }
        self.scrollView.addSubview(logo)
        guard let segementControl = self.segementControl else {return}
        self.scrollView.addSubview(segementControl)
        guard let loginPanel = self.loginPanel else { return }
        self.scrollView.addSubview(loginPanel)
        guard let loginRegisterButton = self.loginRegisterButton else { return }
        self.scrollView.addSubview(loginRegisterButton)
        
        self.selectorChanged()
        
    }
    
    func selectorChanged() {
        print("te")
        self.setupLogo()
        self.setupSegmentControl()
        self.setupLoginPanel()
        self.setupButton()
        self.loginPanel?.changeInputContainerLayout()
        self.updateLayout()
    }
    
    func updateLayout(){
        self.scrollView.layoutIfNeeded()
        self.viewDidLayoutSubviews()
    }
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.setHeight(uiViews: self.scrollView.subviews, constant: UIScreen.main.bounds.height * 0.05 * CGFloat((self.scrollView.subviews.count)))
    }
    
    
    //MARK: logo protocol
    func mountLogo() {
        self.logo = UIImageView(image: UIImage(named: "example"))
        self.logo?.translatesAutoresizingMaskIntoConstraints = false
        self.logo?.backgroundColor = .red
    }
    
    func setupLogo() {
        guard let logo = self.logo else { return }
        if let constraints = self.logoConstrains {
            NSLayoutConstraint.deactivate(constraints)
        }
        
        self.logoConstrains = [
            logo.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: UIScreen.main.bounds.height * 0.05),
            logo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logo.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75),
            logo.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75)
            ]
        if let constraints = self.logoConstrains {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    //MARK: segment Control
    func mountSegmentControl(){
        self.segementControl = LoginRegisterSegmentControl(items: ["Login","Register"], delegate: self.viewModel)
        self.segementControl?.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupSegmentControl(){
        guard let logo = self.logo else { return }
        guard let segementControl = self.segementControl else { return }
        

        if let constraints = self.segmentControlConstrains {
            NSLayoutConstraint.deactivate(constraints)
        }
    
        self.segmentControlConstrains = [
            segementControl.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: UIScreen.main.bounds.height * 0.05),
            segementControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            segementControl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75),
            segementControl.heightAnchor.constraint(equalToConstant: 50)
        ]
    
        if let constraints = self.segmentControlConstrains {
            NSLayoutConstraint.activate(constraints)
        }
    }
      
    
    
    
    
    

    //MARK: login panel protocol
    func mountLoginPanel(){
        self.loginPanel = LoginPanel(frame: CGRect(), delegate: self.viewModel)
        self.loginPanel?.translatesAutoresizingMaskIntoConstraints = false
        self.loginPanel?.vcDelegate = self
    }
    
    func setupLoginPanel(){
        guard let segmentControl = self.segementControl else { return }
        guard let loginPanel = self.loginPanel else { return }
        

        if let constraints = self.loginPanelConstrains {
            NSLayoutConstraint.deactivate(constraints)
        }
    
        self.loginPanelConstrains = [
            loginPanel.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: UIScreen.main.bounds.height * 0.05),
            loginPanel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginPanel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75),
            loginPanel.heightAnchor.constraint(equalToConstant: self.viewModel.state == .Login ? 100 : 200)
        ]
    
        if let constraints = self.loginPanelConstrains {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    var loginRegisterButton: LoginRegisterButton?
    
    var loginRegisterButtonConstrains: [NSLayoutConstraint]?
    
    func mountButton() {
        self.loginRegisterButton = LoginRegisterButton(frame: CGRect(), delegate: self.viewModel)
        self.loginRegisterButton?.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupButton() {
        
        guard let loginRegisterButton = self.loginRegisterButton else { return }
        
        if let constraints = self.loginRegisterButtonConstrains {
            NSLayoutConstraint.deactivate(constraints)
        }
    
        self.loginRegisterButtonConstrains = [
            loginRegisterButton.topAnchor.constraint(equalTo: self.loginPanel!.bottomAnchor, constant: UIScreen.main.bounds.height * 0.05),
            loginRegisterButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginRegisterButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75),
            loginRegisterButton.heightAnchor.constraint(equalToConstant: 50)
        ]
    
        if let constraints = self.loginRegisterButtonConstrains {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    func initHomeScreenViewController(){
        let bottomNavigationController = BottomNavigationController()
        if #available(iOS 13.0, *) {
            bottomNavigationController.modalPresentationStyle = .overFullScreen
        } else {
            // Fallback on earlier versions
        }
        self.present(bottomNavigationController, animated: true, completion: nil)
    }
    
    
}
