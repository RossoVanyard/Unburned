//
//  login_display_protocol.swift
//   Unburned
//
//  Created by RossoVanyard  on 13.05.22.
//

import Foundation
import UIKit

protocol LoginDisplayProtocol {
    ///implemented by VC which owns the UI Elements
    ///
    ///
    ///
    ///
    
    var logo: UIImageView? { get }
    var logoConstrains: [NSLayoutConstraint]? { get }
    func mountLogo()
    func setupLogo()
    
    var segementControl: LoginRegisterSegmentControl? { get }
    var segmentControlConstrains: [NSLayoutConstraint]? { get }
    func mountSegmentControl()
    func setupSegmentControl()
    
    var loginPanel: LoginPanel? { get }
    var loginPanelConstrains: [NSLayoutConstraint]? { get }
    func mountLoginPanel()
    func setupLoginPanel()
    
    var loginRegisterButton: LoginRegisterButton? {get}
    var loginRegisterButtonConstrains: [NSLayoutConstraint]? { get }
    func mountButton()
    func setupButton()
    
    
}

protocol LoginDisplayDelegate{
    func selectorChanged()
}


protocol CheckBox_protocol{
    var checkedImage: UIImage { get }
    var uncheckedImage: UIImage { get }
    func buttonClicked(sender: UIButton)
}
