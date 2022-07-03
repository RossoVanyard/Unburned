//
//  IngredientOverviewCollectionViewCell.swift
//  Unburned
//
//  Created by Roland Vanhöfen on 03.07.22.
//

import Foundation
import UIKit
class IngredientOverviewCollectionViewCell: BaseUICollectionViewCell {
    
    var isEssential: Bool?{
        didSet{
            self.imageView.layer.borderWidth = isEssential == true ? 3 : 0
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.mountImageView()
        self.mountLabel()
        self.mountMeasureLabel()
        self.mountDummyLabel()
        
        
        self.setupImageView()
        self.setupMeasureLabel()
        self.setupLabel()
        self.setupDummyLabel()
        
        if self.imageView.image == nil {
            self.dummyLabel.isHidden = false
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func setupImageView(){
        if let constraints = self.imageViewConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
  
        self.imageViewConstraints = [
            self.imageView.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 5/8),
            self.imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 5/8),
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ]
        
        if let constraints = self.imageViewConstraints {
            NSLayoutConstraint.activate(constraints)
        }
        self.imageView.layer.cornerRadius = self.bounds.size.height * 5/8 * 0.5
        self.imageView.layer.borderColor = UIColor.Theme.lightGreen.cgColor
    }
    
    override func setupLabel(){
        if let constraints = self.labelConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
        self.labelConstraints = [
            self.label.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.label.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.8/8),
            self.label.bottomAnchor.constraint(equalTo: self.measureLabel.topAnchor),
            self.label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ]
        if let constraints = self.labelConstraints {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    
    var dummyLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "T"
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    var dummyLabelConstraints: [NSLayoutConstraint]?
    
    func mountDummyLabel() {
        self.addSubview(dummyLabel)
    }
    
    
    func setupDummyLabel(){
        if let constraints = self.dummyLabelConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
        
       self.dummyLabelConstraints = [
            self.dummyLabel.widthAnchor.constraint(equalTo: self.imageView.widthAnchor),
            self.dummyLabel.heightAnchor.constraint(equalTo: self.imageView.heightAnchor),
            self.dummyLabel.centerXAnchor.constraint(equalTo: self.imageView.centerXAnchor),
            self.dummyLabel.centerYAnchor.constraint(equalTo: self.imageView.centerYAnchor)
        ]
           
        if let constraints = self.dummyLabelConstraints {
            NSLayoutConstraint.activate(constraints)
        }
        self.dummyLabel.layer.cornerRadius = self.bounds.size.height * 5/8 * 0.5
    }
    
    
    var measureLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "300g / 12 Stk."
        label.textAlignment = .center
        label.font = UIFont.italicSystemFont(ofSize: 10)
        return label
    }()
    
    var measureLabelConstraints: [NSLayoutConstraint]?
    
    func mountMeasureLabel() {
        self.addSubview(measureLabel)
    }
    
    
    func setupMeasureLabel(){
        if let constraints = self.measureLabelConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
        
       self.measureLabelConstraints = [
            self.measureLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.measureLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.2/8),
            self.measureLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.measureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ]
           
        if let constraints = self.measureLabelConstraints {
            NSLayoutConstraint.activate(constraints)
        }
        
    }
}
