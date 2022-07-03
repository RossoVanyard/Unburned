//
//  ServingButton.swift
//  Unburned
//
//  Created by Roland Vanhöfen on 03.07.22.
//

import Foundation
import UIKit



class ServingButton: UIView {
    
    var delegate: ServingButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupImageView()
        self.setupLabel()
        self.setupButton()
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //cart image
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setupImageView(){
        self.addSubview(self.imageView)
        self.imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.imageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.33).isActive = true
        self.imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.33).isActive = true
        self.imageView.layer.cornerRadius = UIScreen.main.bounds.size.width * 0.8 * 3/8 * 0.33 * 0.5
    }
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "2 Servings"
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    func setupLabel(){
        self.addSubview(self.label)
        self.label.leftAnchor.constraint(equalTo: self.imageView.rightAnchor, constant:  3).isActive = true
        self.label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.label.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true
        self.label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 3).isActive = true
    }
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(addToBasket), for: .touchUpInside)
        return button
    }()
    
    func setupButton(){
        self.addSubview(self.button)
        self.button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.button.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        self.button.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
    }
    
    @objc func addToBasket(){
        self.delegate?.initServingVC()
    }
}
