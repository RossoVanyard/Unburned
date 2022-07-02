//
//  BaseVCProtocol.swift
//  Unburned
//
//  Created by Roland Vanhöfen on 19.06.22.
//

import Foundation
import UIKit

protocol BaseVCProtocol: UIScrollViewDelegate {
    var scrollView: UIScrollView {get set}
    func setupScrollView()
    var scrollViewConstraints: [NSLayoutConstraint]? { get }
    func setHeight(uiViews: [UIView], constant: CGFloat)
}


class BaseUIViewController: UIViewController, BaseVCProtocol{
    
    var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil) //# or NIB name here if you'll use xib file
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var scrollViewConstraints: [NSLayoutConstraint]?
    
    func setupScrollView() {
        self.view.addSubview(self.scrollView)
        if let constraints = self.scrollViewConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
        self.scrollViewConstraints = [
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ]
        if let constraints = self.scrollViewConstraints {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    func setHeight(uiViews: [UIView], constant: CGFloat) {
        var height: CGFloat = constant
        for i in 0..<(uiViews.count-1){
            height = height + uiViews[i].bounds.size.height
            
        }
        /*
        for view in uiViews {
            //height = height + view.getHeight()
            height = height + view.bounds.size.height
            print("\(view) has the height \(view.bounds.size.height) which adds up to \(height)")
        }*/
        
        self.scrollView.contentSize  = CGSize(width: UIScreen.main.bounds.size.width, height: height)

    }
}




