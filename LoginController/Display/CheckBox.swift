//
//  CheckBox.swift
//   Unburned
//
//  Created by RossoVanyard  on 14.05.22.
//

import Foundation
import UIKit

class CheckBox: UIButton, CheckBox_protocol {
    var checkedImage: UIImage = UIImage(named: "CheckBoxCheckedColor")!
    var uncheckedImage: UIImage = UIImage(named: "CheckBoxUncheckedColor")!
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(uncheckedImage, for: UIControl.State.normal)
        self.imageView?.contentMode = .scaleAspectFill
        self.addTarget(self, action:#selector(buttonClicked), for: UIControl.Event.touchUpInside)
        self.imageView?.image = UIImage(named: "deleteIcon")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            
        }
    }
}

