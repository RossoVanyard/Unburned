//
//  LoginPanel.swift
//   Unburned
//
//  Created by RossoVanyard  on 13.05.22.
//

import Foundation
import UIKit


class LoginPanel: UIView, UITextViewDelegate, UITextFieldDelegate {
    
   
    //constraints for height
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    var nameTextFieldHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    var checkPasswordTextFieldHeightAnchor: NSLayoutConstraint?
    
    var vcDelegate: LoginDisplayDelegate?
    var delegate: LoginViewModelProtocol
    
    init(frame: CGRect, delegate: LoginViewModelProtocol) {
        self.delegate = delegate
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupInputsContainerView()
        self.setupInputsContainerViewInputs()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Segement Control -------------------------------
    
    
    
    
    func changeInputContainerLayout(){
        
        //change height of inputContainerView
        inputsContainerViewHeightAnchor?.constant = delegate.state == .Login ? 100 : 200
        
        //change height of nameTextField
        nameTextFieldHeightAnchor?.isActive = false
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: delegate.state == .Login ? 0 : 1/4)
        nameTextFieldHeightAnchor?.isActive = true
            
        emailTextFieldHeightAnchor?.isActive = false
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: delegate.state == .Login ? 1/2 : 1/4)
        emailTextFieldHeightAnchor?.isActive = true
        
        passwordTextFieldHeightAnchor?.isActive = false
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: delegate.state == .Login ? 1/2 : 1/4)
        passwordTextFieldHeightAnchor?.isActive = true
        
        checkPasswordTextFieldHeightAnchor?.isActive = false
        checkPasswordTextFieldHeightAnchor = checkPasswordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: delegate.state == .Login ?  0 : 1/4)
        checkPasswordTextFieldHeightAnchor?.isActive = true
    }

    
    //inputsContainer ---------------------------------
    
    let inputsContainerView: UIView = {
           let view = UIView()
           view.backgroundColor = .white
           view.layer.borderColor =  UIColor(red: 25/255, green: 41/255, blue: 61/255, alpha: 1).cgColor
           view.layer.borderWidth = 2
           view.translatesAutoresizingMaskIntoConstraints = false
           view.layer.cornerRadius = 5
           view.layer.masksToBounds = true
           return view
       }()
    
    var inputsContainerViewConstraints: [NSLayoutConstraint]?
       
    func setupInputsContainerView(){
        self.addSubview(inputsContainerView)
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSperatorView)
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSperatorView)
        inputsContainerView.addSubview(passwordTextField)
        inputsContainerView.addSubview(passwordSperatorView)
        inputsContainerView.addSubview(checkPasswordTextField)
           
        if let constraints = self.inputsContainerViewConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
        self.inputsContainerViewConstraints = [
            inputsContainerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            inputsContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            inputsContainerView.widthAnchor.constraint(equalTo: self.widthAnchor),
            inputsContainerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ]
          
        if let constraints = self.inputsContainerViewConstraints {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    //inputsConteiner - input ------------------------------------------
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = NSLocalizedString("Name", comment: "")
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.spellCheckingType = .no
        tf.delegate = self
        tf.tag = 0
        return tf
    }()
    
    let nameSperatorView: UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor(red: 25/255, green: 41/255, blue: 61/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = NSLocalizedString("Email", comment: "")
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocapitalizationType = .none
        tf.spellCheckingType = .no
        tf.keyboardType = UIKeyboardType.emailAddress
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.spellCheckingType = .no
        tf.delegate = self
        tf.tag = 1
        return tf
    }()
    
    let emailSperatorView: UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor(red: 25/255, green: 41/255, blue: 61/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = NSLocalizedString("password", comment: "")
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.delegate = self
        tf.tag = 2
        return tf
    }()
    
    let passwordSperatorView: UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor(red: 25/255, green: 41/255, blue: 61/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var checkPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = NSLocalizedString("checkPassword", comment: "")
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.delegate = self
        tf.tag = 3
        return tf
    }()
    
    func setupInputsContainerViewInputs(){
      
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: delegate.state == .Login ? 0 : 1/4)
        nameTextFieldHeightAnchor?.isActive = true
       
        nameSperatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        nameSperatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSperatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameSperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameSperatorView.topAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: delegate.state == .Login ? 1/2 : 1/4)
        emailTextFieldHeightAnchor?.isActive = true
        
        
        emailSperatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailSperatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSperatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailSperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailSperatorView.topAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: delegate.state == .Login ? 1/2 : 1/4)
        passwordTextFieldHeightAnchor?.isActive = true
       
        
        passwordSperatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        passwordSperatorView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor).isActive = true
        passwordSperatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordSperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        checkPasswordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        checkPasswordTextField.topAnchor.constraint(equalTo: passwordSperatorView.topAnchor).isActive = true
        checkPasswordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        checkPasswordTextFieldHeightAnchor = checkPasswordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: delegate.state == .Login ? 0 : 1/4)
        checkPasswordTextFieldHeightAnchor?.isActive = true
       
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text else { return false}
        switch textField.tag{
        case 0:
            print("name")
            
            self.delegate.model.name = text
        case 1:
            print("email")
            self.delegate.model.email = text
        case 2:
            print("password")
            self.delegate.model.password = text
        case 3:
            print("checkPassword")
            self.delegate.model.passwordCheck = text
        default:
            print("")
        }
        
        return true
    }
    
    
    
    
    func clearData(){
        self.emailTextField.text = ""
        self.nameTextField.text = ""
        self.passwordTextField.text = ""
        self.checkPasswordTextField.text = ""
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
            for v in subviews {
                let ptInSub = v.convert(point, from: v.superview)
                if v.bounds.contains(ptInSub) {
                    return true
                }
            }
            return false
        }
}

class MagicUITextField: UITextField {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
            for v in subviews {
                let ptInSub = v.convert(point, from: v.superview?.superview)
                if v.bounds.contains(ptInSub) {
                    return true
                }
            }
            return false
        }
}

class MagicUILabel: UILabel {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
            for v in subviews {
                let ptInSub = v.convert(point, from: v.superview)
                if v.bounds.contains(ptInSub) {
                    return true
                }
            }
            return false
        }
}

class MagicUIView: UIView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
            for v in subviews {
                let ptInSub = v.convert(point, from: v.superview)
                if v.bounds.contains(ptInSub) {
                    return true
                }
            }
            return false
        }
}

class MagicUITextView: UITextView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
            for v in subviews {
                let ptInSub = v.convert(point, from: v.superview)
                if v.bounds.contains(ptInSub) {
                    return true
                }
            }
            return false
        }
}

