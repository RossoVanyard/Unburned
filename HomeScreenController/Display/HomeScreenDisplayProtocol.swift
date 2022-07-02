//
//  HomeScreenDisplayProtocol.swift
//  Unburned
//
//  Created by Roland Vanhöfen on 02.07.22.
//

import Foundation
import UIKit

protocol HomeScreenDisplayProtocol {
    ///implemented by VC which owns the UI Elements
    ///
    var nameLabel: HeaderOneLabel {get set}
    var nameLabelConstraints: [NSLayoutConstraint]? {get set}
    func mountNameLabel()
    func setupNameLabelConstraints()
    
    var filtrCollectionView: UICollectionView {get set}
    var filterCollectionViewConstraints: [NSLayoutConstraint]? {get set}
    func mountFiltrCollectionView()
    func setupFilterCollectionView()
    
    var recipesCollectionView: UICollectionView {get set}
    var recipesCollectionViewConstraints: [NSLayoutConstraint]? {get set}
    func mountRecipesCollectionView()
    func setupRecipesCollectionView()
    
    
}
