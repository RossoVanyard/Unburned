//
//  RecipeViewController.swift
//  Unburned
//
//  Created by RossoVanyard on 03.07.22.
//

import Foundation
import UIKit



class RecipeViewController: BaseUIViewController, RecipeDisplayProtocol{
    

    override init() {
        super.init()
        self.mountRecipeImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setHeight(uiViews: self.scrollView.subviews, constant: 0)
    }
    
    var recipeImageView: RecipeImageView = {
        let view = RecipeImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var recipeImageViewConstraints: [NSLayoutConstraint]?
    
    func mountRecipeImageView() {
        self.scrollView.addSubview(recipeImageView)
    }
    
    func setupRecipeImageView(){
        if let constraints = self.recipeImageViewConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
        self.recipeImageViewConstraints = [
            self.recipeImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width),
            self.recipeImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width),
            self.recipeImageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.recipeImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ]
        
        if let constraints = self.recipeImageViewConstraints {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    
    var recipeNameLabel: HeaderOneLabel
    
    var recipeNameLabelViewConstraints: [NSLayoutConstraint]?
    
    func mountRecipeNameLabel() {
        <#code#>
    }
    
    func setupRecipeNameLabel() {
        <#code#>
    }
    
    var recipeDescriptionLabel: UILabel
    
    var recipeDescriptionLabelViewConstraints: [NSLayoutConstraint]?
    
    func mountRecipeDescriptionLabel() {
        <#code#>
    }
    
    func setupRecipeDescriptionLabel() {
        <#code#>
    }
    
    var infoCollectionView: UICollectionView
    
    var infoCollectionViewConstraints: [NSLayoutConstraint]?
    
    func mountInfoCollectionView() {
        <#code#>
    }
    
    func setupInfosCollectionView() {
        <#code#>
    }
    
    var ingredientsCollectionView: UICollectionView
    
    var ingredientsCollectionViewConstraints: [NSLayoutConstraint]?
    
    func mountIngredientsCollectionView() {
        <#code#>
    }
    
    func setupIngredientsCollectionView() {
        <#code#>
    }
}
