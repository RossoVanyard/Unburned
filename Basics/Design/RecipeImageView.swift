//
//  RecipeImageView.swift
//  Unburned
//
//  Created by RossoVanyard on 03.07.22.
//

import Foundation
import UIKit

class RecipeImageView: UIView{
    
    let shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.Theme.lightGreen
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupShadowView()
        self.setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupShadowView(){
        self.addSubview(self.shadowView)
        self.shadowView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: UIScreen.main.bounds.size.width * 0.022).isActive = true
        self.shadowView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: UIScreen.main.bounds.size.width * 0.03).isActive = true
        self.shadowView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width * 0.8).isActive = true
        self.shadowView.widthAnchor.constraint(equalToConstant:  UIScreen.main.bounds.size.width * 0.8).isActive = true
        self.shadowView.layer.cornerRadius = UIScreen.main.bounds.size.width * 0.8 * 0.5
    }
    
    func setupImageView(){
        self.addSubview(self.imageView)
        self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width * 0.8).isActive = true
        self.imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width * 0.8).isActive = true
        self.imageView.layer.cornerRadius = UIScreen.main.bounds.size.width * 0.8 * 0.5
    }
}
