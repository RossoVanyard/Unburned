//
//  ButtonPanel.swift
//  Unburned
//
//  Created by Roland Vanhöfen on 03.07.22.
//

import Foundation
import UIKit

protocol ServingButtonDelegate{
    func initServingVC()
}

class ButtonPanel: UIView, ServingButtonDelegate {
    
    
    
    var delegate: RecipeViewControllerDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.mountAddTobasketButton()
        self.setupAddTobasketButton()
        self.mountCookButton()
        self.setupCookButton()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var addTobasketButton: ServingButton = {
        let button = ServingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var addTobasketButtonConstraints: [NSLayoutConstraint]?
    
    func mountAddTobasketButton() {
        self.addSubview(self.addTobasketButton)
        self.addTobasketButton.delegate = self
    }
    
    func setupAddTobasketButton() {
        if let constraints = self.addTobasketButtonConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
    
        self.addTobasketButtonConstraints = [
            addTobasketButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            addTobasketButton.leftAnchor.constraint(equalTo: self.leftAnchor),
            addTobasketButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 3/8),
            addTobasketButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        if let constraints = self.addTobasketButtonConstraints {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    lazy var cookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.backgroundColor = .lightGray
        button.setTitle("Start Cooking", for: .normal)
        button.addTarget(self, action: #selector(startCooking), for: .touchUpInside)
        return button
    }()
    
    var cookButtonConstraints: [NSLayoutConstraint]?
    
    func mountCookButton() {
        self.addSubview(self.cookButton)
    }
    
    func setupCookButton() {
        if let constraints = self.cookButtonConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
    
        self.cookButtonConstraints = [
            cookButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            cookButton.rightAnchor.constraint(equalTo: self.rightAnchor),
            cookButton.leftAnchor.constraint(equalTo: self.addTobasketButton.rightAnchor, constant: 5),
            cookButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        if let constraints = self.cookButtonConstraints {
            NSLayoutConstraint.activate(constraints)
        }
        
    }
    
    @objc func startCooking(){
        self.delegate?.startCooking()
    }
    
    func initServingVC() {
        self.delegate?.initServingVC()
    }
}

