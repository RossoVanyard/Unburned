//
//  HeaderOneLabel.swift
//  Unburned
//
//  Created by RossoVanyard on 02.07.22.
//

import Foundation
import UIKit

protocol HeaderOneLabelProtocol {
    var text: String {get set}
}

class HeaderOneLabel: UIView, HeaderOneLabelProtocol{
    var text: String {
        didSet{
            self.label.text = self.text
        }
    }
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Theme.lightGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var backgroundViewConstrains: [NSLayoutConstraint]?
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
        return label
    }()
    
    var labelConstraints: [NSLayoutConstraint]?
    
  
    
    
    init(frame: CGRect, text: String) {
        self.text = text
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.label.text = text
        self.label.sizeToFit()
        self.addSubview(self.backgroundView)
        self.addSubview(self.label)
        self.setupUILabelConstraints()
        self.setupBackgroundViewConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupBackgroundViewConstraints(){
        if let constraints = self.backgroundViewConstrains {
            NSLayoutConstraint.deactivate(constraints)
        }
        self.backgroundViewConstrains = [
            self.backgroundView.topAnchor.constraint(equalTo: self.label.centerYAnchor),
            self.backgroundView.leftAnchor.constraint(equalTo: self.label.centerXAnchor, constant: -self.label.bounds.size.width/2.5),
            self.backgroundView.bottomAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 3),
            self.backgroundView.rightAnchor.constraint(equalTo: self.label.rightAnchor, constant: 3)
        ]
        
        if let constraints = self.backgroundViewConstrains {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    func setupUILabelConstraints(){
        if let constraints = self.labelConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
        self.labelConstraints = [
            self.label.topAnchor.constraint(equalTo: self.centerYAnchor),
            self.label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: UIScreen.main.bounds.width * 0.1)
        ]
        
        if let constraints = self.labelConstraints {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    
}

class HeaderTwoLabel: HeaderOneLabel{
    override init(frame: CGRect, text: String) {
        super.init(frame: frame, text: text)
        self.label.font = UIFont.boldSystemFont(ofSize: 16.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
