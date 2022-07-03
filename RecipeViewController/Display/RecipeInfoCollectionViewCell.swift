//
//  RecipeInfoCollectionViewCell.swift
//  Unburned
//
//  Created by Roland Vanhöfen on 03.07.22.
//

import Foundation
import UIKit

class RecipeInfoCollectionViewCell: BaseUICollectionViewCell {
    
    var info: Info? {
        didSet{
            switch info?.type {
                case .Time:
                    guard let time = info?.time else {return}
                    self.label.text = "\(time) Min"
                case .Cost:
                    guard let cost = info?.cost else {return}
                    self.label.text = "\(cost) Min"
                case .Prep:
                    guard let prep = info?.prep else {return}
                    self.label.text = prep == true ? "yes" : "no"
                default:
                    self.label.text = ""
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.mountImageView()
        self.mountLabel()
        self.setupImageView()
        self.setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
