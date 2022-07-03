//
//  HomeScreenViewController.swift
//  Unburned
//
//  Created by RossoVanyard  on 01.07.22.
//

import Foundation
import UIKit

protocol HomeScreenViewControllerProtocol {
    // injects dependancies via protocol injection
    var viewModel: HomeScreenViewModelProtocol {get set}
    func registerCells()
}

protocol HomeScreenVCDelegate{
    func setUserName(name: String)
}


class HomeScreenViewController: BaseUIViewController, HomeScreenViewControllerProtocol, HomeScreenDisplayProtocol, HomeScreenVCDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var viewModel: HomeScreenViewModelProtocol
    
  
    
    init(viewModel: HomeScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
        self.viewModel.delegate = self
        self.scrollView.backgroundColor = .white
        self.mountNameLabel()
        self.mountFiltrCollectionView()
        self.mountRecipesLabel()
        self.mountRecipesCollectionView()
        self.registerCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNameLabelConstraints()
        self.setupFilterCollectionView()
        self.setupRecipesLabelConstraints()
        self.setupRecipesCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setHeight(uiViews: self.scrollView.subviews, constant: 0)
    }
    
    func registerCells() {
        self.filtrCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        self.recipesCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    var nameLabel: HeaderOneLabel = {
        let label = HeaderOneLabel(frame: CGRect(), text: "hi")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var nameLabelConstraints: [NSLayoutConstraint]?
    
    func mountNameLabel() {
        self.scrollView.addSubview(self.nameLabel)
    }
    
    func setupNameLabelConstraints() {
        if let constraints = self.nameLabelConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
    
        self.nameLabelConstraints = [
            nameLabel.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            nameLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 100)
        ]
    
        if let constraints = self.nameLabelConstraints {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    lazy var filtrCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isScrollEnabled = true
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var filterCollectionViewConstraints: [NSLayoutConstraint]?
    
    func mountFiltrCollectionView(){
        self.scrollView.addSubview(filtrCollectionView)
    }
   
    
    func setupFilterCollectionView() {
        if let constraints = self.filterCollectionViewConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
    
        self.filterCollectionViewConstraints  = [
            self.filtrCollectionView.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor),
            self.filtrCollectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.filtrCollectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            self.filtrCollectionView.heightAnchor.constraint(equalToConstant: 70)
        ]
    
        if let constraints = self.filterCollectionViewConstraints {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    
    
    var recipesLabel: HeaderOneLabel = {
        let label = HeaderOneLabel(frame: CGRect(), text: "Deine Rezepte")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var recipesLabelConstraints: [NSLayoutConstraint]?
    
    func mountRecipesLabel() {
        self.scrollView.addSubview(self.recipesLabel)
    }
    
    func setupRecipesLabelConstraints() {
        if let constraints = self.recipesLabelConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
    
        self.recipesLabelConstraints = [
            recipesLabel.topAnchor.constraint(equalTo: self.filtrCollectionView.bottomAnchor),
            recipesLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            recipesLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            recipesLabel.heightAnchor.constraint(equalToConstant: 60)
        ]
    
        if let constraints = self.recipesLabelConstraints {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    
    
    
    
    lazy var recipesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isScrollEnabled = true
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var recipesCollectionViewConstraints: [NSLayoutConstraint]?
    
    func mountRecipesCollectionView(){
        self.scrollView.addSubview(self.recipesCollectionView)
    }
    
    func setupRecipesCollectionView() {
        if let constraints = self.recipesCollectionViewConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
    
        self.recipesCollectionViewConstraints  = [
            self.recipesCollectionView.topAnchor.constraint(equalTo: self.recipesLabel.bottomAnchor),
            self.recipesCollectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.recipesCollectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            self.recipesCollectionView.heightAnchor.constraint(equalToConstant: 250)
        ]
    
        if let constraints = self.recipesCollectionViewConstraints {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    func setUserName(name: String) {
        self.nameLabel.text = "Hello, \(name)"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
            case self.filtrCollectionView:
                return 4
            case self.recipesCollectionView:
                return 4
            default:
                return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) 
        cell.backgroundColor = .red
        switch collectionView {
            case self.filtrCollectionView:
                return cell
            case self.recipesCollectionView:
                return cell
            default:
                return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
            case self.filtrCollectionView:
            return CGSize(width: self.filtrCollectionView.bounds.size.width / 3.5, height: self.filtrCollectionView.bounds.size.height * 0.9)
            case self.recipesCollectionView:
            return CGSize(width: self.recipesCollectionView.bounds.size.width / 1.2, height: self.recipesCollectionView.bounds.size.height * 0.85)
            default:
                return CGSize(width: 0.0, height: 0.0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presentRecipe()
    }
    
    func presentRecipe(){
        let vc = RecipeViewController()
        if #available(iOS 13.0, *) {
            vc.modalPresentationStyle = .overFullScreen
        } else {
            // Fallback on earlier versions
        }
        self.present(vc, animated: true, completion: nil)
    }
    
}
