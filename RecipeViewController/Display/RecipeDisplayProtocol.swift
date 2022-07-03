//
//  RecipeDisplayProtocol.swift
//  Unburned
//
//  Created by RossoVanyard on 03.07.22.
//

import Foundation
import UIKit

protocol RecipeDisplayProtocol{
    var recipeImageView: RecipeImageView {get set}
    var recipeImageViewConstraints: [NSLayoutConstraint]? {get set}
    func mountRecipeImageView()
    func setupRecipeImageView()
    
    var recipeNameLabel: HeaderOneLabel {get set}
    var recipeNameLabelViewConstraints: [NSLayoutConstraint]? {get set}
    func mountRecipeNameLabel()
    func setupRecipeNameLabel()
    
    var recipeDescriptionLabel: UILabel {get set}
    var recipeDescriptionLabelViewConstraints: [NSLayoutConstraint]? {get set}
    func mountRecipeDescriptionLabel()
    func setupRecipeDescriptionLabel()
    
    var infoCollectionView: UICollectionView {get set} // 3 cells: time, prep, cost
    var infoCollectionViewConstraints: [NSLayoutConstraint]? {get set}
    func mountInfoCollectionView()
    func setupInfosCollectionView()
    
    var ingredientLabel: HeaderTwoLabel {get set}
    var ingredientLabelViewConstraints: [NSLayoutConstraint]? {get set}
    func mountIngredientLabel()
    func setupIngredientLabel()
    
    var ingredientsCollectionView: UICollectionView {get set}
    var ingredientsCollectionViewConstraints: [NSLayoutConstraint]? {get set}
    func mountIngredientsCollectionView()
    func setupIngredientsCollectionView()
    
    
}
