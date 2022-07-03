//
//  RecipeViewController.swift
//  Unburned
//
//  Created by RossoVanyard on 03.07.22.
//

import Foundation
import UIKit

protocol RecipeViewControllerDelegate {
    func initServingVC()
    func startCooking()
}

class RecipeViewController: BaseUIViewController, RecipeDisplayProtocol, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate, RecipeViewControllerDelegate{
    
    
    
    
    
    var infoCellId = "inforCellId"
    var ingredientCellId = "ingredientCellId"
    
    override init() {
        super.init()
        self.mountRecipeImageView()
        self.mountRecipeNameLabel()
        self.mountRecipeDescriptionLabel()
        self.mountInfoCollectionView()
        self.mountIngredientLabel()
        self.mountIngredientsCollectionView()
        self.mountButtonPanel()
        self.registerCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupRecipeImageView()
        self.setupRecipeNameLabel()
        self.setupRecipeDescriptionLabel()
        self.setupInfosCollectionView()
        self.setupIngredientLabel()
        self.setupIngredientsCollectionView()
        self.setupButtonPanel()
        self.updateLayout()
    }
    
    func updateLayout(){
        self.scrollView.layoutIfNeeded()
        self.viewDidLayoutSubviews()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setHeight(uiViews: self.scrollView.subviews, constant: 0)
    }
    
    func initServingVC() {
        print("init Serving VC")
    }
    
    func startCooking() {
        print("go to Cook VC")
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
    
    
    var recipeNameLabel: HeaderOneLabel = {
        let label = HeaderOneLabel(frame: CGRect(), text: "RecipeName")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var recipeNameLabelViewConstraints: [NSLayoutConstraint]?
    
    func mountRecipeNameLabel() {
        self.scrollView.addSubview(self.recipeNameLabel)
    }
    
    func setupRecipeNameLabel() {
        if let constraints = self.recipeNameLabelViewConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
    
        self.recipeNameLabelViewConstraints = [
            recipeNameLabel.topAnchor.constraint(equalTo: self.recipeImageView.bottomAnchor),
            recipeNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            recipeNameLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            recipeNameLabel.heightAnchor.constraint(equalToConstant: 80)
        ]
    
        if let constraints = self.recipeNameLabelViewConstraints {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    var recipeDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Lore ipsum qualquasa e noche e tillo vera sanctium est. na da valasque neda wie amerum de nosta vivo. eselcior nada pe."
        label.sizeToFit()
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    var recipeDescriptionLabelViewConstraints: [NSLayoutConstraint]?
    
    func mountRecipeDescriptionLabel() {
        self.scrollView.addSubview(self.recipeDescriptionLabel)
    }
    
    func setupRecipeDescriptionLabel() {
        if let constraints = self.recipeDescriptionLabelViewConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
    
        self.recipeDescriptionLabelViewConstraints = [
            recipeDescriptionLabel.topAnchor.constraint(equalTo: self.recipeNameLabel.bottomAnchor),
            recipeDescriptionLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            recipeDescriptionLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
        ]
    
        if let constraints = self.recipeDescriptionLabelViewConstraints {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    lazy var infoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isScrollEnabled = false
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var infosPerRow: CGFloat = 3
    
    var infoCollectionViewConstraints: [NSLayoutConstraint]?
    
    func mountInfoCollectionView() {
        self.scrollView.addSubview(self.infoCollectionView)
    }
    
    func setupInfosCollectionView() {
        if let constraints = self.infoCollectionViewConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
    
        self.infoCollectionViewConstraints  = [
            self.infoCollectionView.topAnchor.constraint(equalTo: self.recipeDescriptionLabel.bottomAnchor),
            self.infoCollectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.infoCollectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            self.infoCollectionView.heightAnchor.constraint(equalToConstant: 75)
        ]
    
        if let constraints = self.infoCollectionViewConstraints {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    
    var ingredientLabel: HeaderTwoLabel = {
        let label = HeaderTwoLabel(frame: CGRect(), text: "Ingredients")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var ingredientLabelViewConstraints: [NSLayoutConstraint]?
    
    func mountIngredientLabel() {
        self.scrollView.addSubview(self.ingredientLabel)
    }
    
    func setupIngredientLabel() {
        if let constraints = self.ingredientLabelViewConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
    
        self.ingredientLabelViewConstraints = [
            ingredientLabel.topAnchor.constraint(equalTo: self.infoCollectionView.bottomAnchor),
            ingredientLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            ingredientLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            ingredientLabel.heightAnchor.constraint(equalToConstant: 80)
        ]
    
        if let constraints = self.ingredientLabelViewConstraints {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    
    lazy var ingredientsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = self.ingredientsLineSpacing
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isScrollEnabled = false
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var ingredientsRowHeight: CGFloat = 85
    var ingredientsPerRow: Int = 3
    var ingredientsLineSpacing: CGFloat = 10
    
    var ingredientsCollectionViewConstraints: [NSLayoutConstraint]?
    
    func mountIngredientsCollectionView() {
        self.scrollView.addSubview(self.ingredientsCollectionView)
    }
    
    func setupIngredientsCollectionView() {
        if let constraints = self.ingredientsCollectionViewConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
        let numOfRows = (CGFloat(self.ingredientsCollectionView.numberOfItems(inSection: 0))/CGFloat(self.ingredientsPerRow)).rounded(.up)
        let height: CGFloat =  numOfRows * (ingredientsRowHeight + self.ingredientsLineSpacing)
        
        self.ingredientsCollectionViewConstraints  = [
            self.ingredientsCollectionView.topAnchor.constraint(equalTo: self.ingredientLabel.bottomAnchor),
            self.ingredientsCollectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.ingredientsCollectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            self.ingredientsCollectionView.heightAnchor.constraint(equalToConstant: height)
        ]
    
        if let constraints = self.ingredientsCollectionViewConstraints {
            NSLayoutConstraint.activate(constraints)
        }
    }
    
    func registerCells() {
        self.infoCollectionView.register(RecipeInfoCollectionViewCell.self, forCellWithReuseIdentifier: self.infoCellId)
        self.ingredientsCollectionView.register(IngredientOverviewCollectionViewCell.self, forCellWithReuseIdentifier: self.ingredientCellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
            case self.infoCollectionView:
                return 3
            case self.ingredientsCollectionView:
                return 7
            default:
                return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
            case self.infoCollectionView:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.infoCellId, for: indexPath) as! RecipeInfoCollectionViewCell
                    switch indexPath {
                        case .init(item: 0, section: 0):
                            cell.layer.addBorder(edge: .right, color: UIColor.Theme.lightGreen, thickness: 1)
                        case .init(item: 1, section: 0):
                            print("")
                        case .init(item: 2, section: 0):
                            cell.layer.addBorder(edge: .left, color: UIColor.Theme.lightGreen, thickness: 1)
                        default:
                            print("")
                    }
                return cell
            case self.ingredientsCollectionView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.ingredientCellId, for: indexPath) as! IngredientOverviewCollectionViewCell
                cell.isEssential = true
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) 
                cell.backgroundColor = .red
                return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
            case self.infoCollectionView:
              
                return CGSize(width: (self.infoCollectionView.bounds.size.width/self.infosPerRow), height: self.infoCollectionView.bounds.size.height * 0.9)
            case self.ingredientsCollectionView:
                let ressourceWidth: CGFloat = (self.infoCollectionView.bounds.size.width-(self.ingredientsLineSpacing*CGFloat((self.ingredientsPerRow-1))))
                let width: CGFloat = ressourceWidth/CGFloat(self.ingredientsPerRow)
                return CGSize(width: width, height: self.ingredientsRowHeight)
            default:
                return CGSize(width: 0.0, height: 0.0)
        }
    }
    
    var buttonPanel: ButtonPanel = {
        let view = ButtonPanel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var buttonPanelConstraints: [NSLayoutConstraint]?
    
    func mountButtonPanel() {
        self.scrollView.addSubview(self.buttonPanel)
        self.buttonPanel.delegate = self
    }
    
    func setupButtonPanel() {
        if let constraints = self.buttonPanelConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
    
        self.buttonPanelConstraints = [
            buttonPanel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -5),
            buttonPanel.centerXAnchor.constraint(equalTo: self.ingredientsCollectionView.centerXAnchor),
            buttonPanel.widthAnchor.constraint(equalTo: self.ingredientsCollectionView.widthAnchor),
            buttonPanel.heightAnchor.constraint(equalToConstant: 60)
        ]
        
    
        if let constraints = self.buttonPanelConstraints {
            NSLayoutConstraint.activate(constraints)
        }
    
    }
    
    
}
