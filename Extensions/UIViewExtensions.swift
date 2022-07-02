//
//  UIViewExtensions.swift
//  Unburned
//
//  Created by Roland Vanhöfen on 01.07.22.
//

import Foundation
import UIKit

extension UIView{
    
    
    //get height from a subview
    func getHeight()-> CGFloat{
        var height: CGFloat = 0
        if self.subviews.count > 1 {
            for view in self.subviews {
                height = height + view.bounds.size.height
            }
        } else {
            return self.frame.height
        }
        
        return height
    }
    
}
