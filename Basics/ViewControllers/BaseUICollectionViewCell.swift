//
//  BaseUICollectionViewCell.swift
//  Unburned
//
//  Created by Roland Vanhöfen on 03.07.22.
//

import Foundation
import UIKit
class BaseUICollectionViewCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    var imageViewConstraints: [NSLayoutConstraint]?
    
    func mountImageView() {
        self.addSubview(imageView)
    }
    
    func setupImageView(){
        if let constraints = self.imageViewConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
        if self.imageView.image != nil {
            self.imageViewConstraints = [
                self.imageView.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/3),
                self.imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/3),
                self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
                self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ]
        } else {
            self.imageViewConstraints = [
                self.imageView.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/3),
                self.imageView.heightAnchor.constraint(equalToConstant: 0),
                self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
                self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ]
        }
        
        
        if let constraints = self.imageViewConstraints {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    var label: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "test"
        label.textAlignment = .center
        return label
    }()
    
    var labelConstraints: [NSLayoutConstraint]?
    
    func mountLabel() {
        self.addSubview(label)
    }
    
    
    func setupLabel(){
        if let constraints = self.labelConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
        
        if self.imageView.image != nil {
            self.labelConstraints = [
                self.label.widthAnchor.constraint(equalTo: self.widthAnchor),
                self.label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                self.label.topAnchor.constraint(equalTo: self.imageView.bottomAnchor),
                self.label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ]
        } else {
            self.labelConstraints = [
                self.label.widthAnchor.constraint(equalTo: self.widthAnchor),
                self.label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                self.label.topAnchor.constraint(equalTo: self.topAnchor),
                self.label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ]
        }
        
        if let constraints = self.labelConstraints {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    
    
}
