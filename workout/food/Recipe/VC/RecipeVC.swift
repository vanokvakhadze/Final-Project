//
//  RecipeVC.swift
//  workout
//
//  Created by vano Kvakhadze on 22.07.24.
//

import UIKit
import Lottie

class RecipeVC: UIViewController {
    
    var viewModel: RecipeViewModel
    
    let animationView: LottieAnimationView = .init()
    
    var safeArea = UIView.customView()
    var dietField = CustomTextField(fieldType: .none)
    var healthField = CustomTextField(fieldType: .none)
    var dishTypeField = CustomTextField(fieldType: .none)
    var countryField = CustomTextField(fieldType: .none)
    
    var placeholderImage = UIImage(systemName: "chevron.down")
    
    var dietPicker = UIPickerView()
    var healthPicker = UIPickerView()
    var dishPicker = UIPickerView()
    var countryPicker = UIPickerView()
    
    var getButton = UIButton.customButton(width: 200, height: 35)
    
    var mealCollection: UICollectionView = {
        let collectionFlow = UICollectionViewFlowLayout()
        collectionFlow.minimumLineSpacing = 20
        collectionFlow.minimumInteritemSpacing = 20
        collectionFlow.scrollDirection = .vertical
        collectionFlow.itemSize = CGSize(width: 160, height: 205)
        let collections = UICollectionView(frame: CGRect(x: 0, y: 0, width: 327, height: 192), collectionViewLayout: collectionFlow)
        collections.translatesAutoresizingMaskIntoConstraints = false
        collections.backgroundColor = .none
        return collections
    }()
    
    
    
    init(recipe: RecipeViewModel) {
        self.viewModel = recipe
        super.init(nibName: nil, bundle: nil)
        recipe.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        addSafeArea()
        setUpTextFields()
        addGetButton()
        addCollection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "")
        navigationController?.navigationBar.tintColor = .exerciseText
        setupCustomNavTitle()
    }
    
    
    func addSafeArea(){
        view.addSubview(safeArea)
        let safeZone = view.safeAreaLayoutGuide
        safeArea.topAnchor.constraint(equalTo: safeZone.topAnchor).isActive = true
        safeArea.leadingAnchor.constraint(equalTo: safeZone.leadingAnchor).isActive = true
        safeArea.trailingAnchor.constraint(equalTo: safeZone.trailingAnchor).isActive = true
        safeArea.bottomAnchor.constraint(equalTo: safeZone.bottomAnchor).isActive = true
        
    }
    
    
    func setUpTextFields(){
        safeArea.addSubview(dietField)
        safeArea.addSubview(countryField)
        safeArea.addSubview(dishTypeField)
        safeArea.addSubview(healthField)
        
        dietField.setPlaceholder(with: viewModel.diet.first!, andRightImage: placeholderImage!)
        countryField.setPlaceholder(with: viewModel.country.first!, andRightImage: placeholderImage!)
        dishTypeField.setPlaceholder(with: viewModel.dishType.first!, andRightImage: placeholderImage!)
        healthField.setPlaceholder(with: viewModel.health.first!, andRightImage: placeholderImage!)
        
        viewModel.selectedDiet = viewModel.diet.first
        viewModel.selectedCountry = viewModel.country.first
        viewModel.selectedDishType = viewModel.dishType.first
        viewModel.selectedHealth = viewModel.health.first
        
        NSLayoutConstraint.activate([
            dietField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            dietField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant:  10),
            dietField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            dietField.heightAnchor.constraint(equalToConstant: 40),
            
            countryField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            countryField.leadingAnchor.constraint(equalTo: dietField.trailingAnchor, constant:  10),
            countryField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            countryField.heightAnchor.constraint(equalToConstant: 40),
            
            dishTypeField.topAnchor.constraint(equalTo: dietField.bottomAnchor, constant: 10),
            dishTypeField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant:  10),
            dishTypeField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            dishTypeField.heightAnchor.constraint(equalToConstant: 40),
            
            healthField.topAnchor.constraint(equalTo: dietField.bottomAnchor, constant: 10),
            healthField.leadingAnchor.constraint(equalTo: dishTypeField.trailingAnchor, constant:  10),
            healthField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            healthField.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        createPicker()
    }
    
    func createPicker(){
        
        dietField.setPickerView(dietPicker, target: self)
        countryField.setPickerView(countryPicker, target: self)
        dishTypeField.setPickerView(dishPicker, target: self)
        healthField.setPickerView(healthPicker, target: self)
        
        dietPicker.tag = 1
        countryPicker.tag = 2
        dishPicker.tag = 3
        healthPicker.tag = 4
    }
    
    func addGetButton(){
        
        safeArea.addSubview(getButton)
        getButton.setTitle("Get Recipe", for: .normal)
        getButton.layer.shadowColor = UIColor.systemBlue.cgColor
        getButton.layer.shadowOpacity = 0.5
        getButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        getButton.layer.shadowRadius = 4
        getButton.layer.masksToBounds = false
        
        
        
        getButton.addAction(UIAction(handler: { _ in
            self.buttonTapped()}), for: .touchUpInside)
        
        getButton.backgroundColor = .systemBlue
        
   
        NSLayoutConstraint.activate([
            getButton.topAnchor.constraint(equalTo: healthField.bottomAnchor, constant: 20),
            getButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
          
        ])
        
       
    }
    
    func buttonTapped(){
        if viewModel.hasPlayedAnimation {
            buttonAnimate()
            fetchData()
        }
        else {
            buttonAnimate()
            SetUpAnimation()
        }
    }
    
    func buttonAnimate(){
        UIView.animate(withDuration: 0.2, animations: {
            self.getButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.2, animations: {
            self.getButton.transform = .identity
          })
        }
        
    }
    
    func fetchData(){
        viewModel.fetchRecipes { result in
            switch result {
            case .success(_ ):
                DispatchQueue.main.async {
                    self.mealCollection.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Error fetching recipes: \(error)")
                }
            }
        }
    }
    
    func addCollection(){
        safeArea.addSubview(mealCollection)
        NSLayoutConstraint.activate([
            mealCollection.topAnchor.constraint(equalTo: getButton.bottomAnchor, constant: 25),
            mealCollection.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15),
            mealCollection.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15),
            mealCollection.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -25)
        ])
        mealCollection.register(RecipeCell.self, forCellWithReuseIdentifier: "food")
        mealCollection.dataSource = self
        mealCollection.delegate = self
        
    }
    
    func SetUpAnimation(){
      
        animationView.loopMode = .playOnce
        view.addSubview(animationView)
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        
        LottieAnimation.loadedFrom(url: URL(string: "https://lottie.host/0b46ef67-ab25-411f-a74f-f9f1f96636ff/Cq363apILj.json")!) { [weak self ] animation in
            guard let self = self else { return }
            let animationDuration = animation!.duration
            let desiredDuration: TimeInterval = 5.0
            let speedMultiplier = animationDuration / desiredDuration
            self.animationView.animationSpeed = speedMultiplier
            self.animationView.animation = animation
            self.animationView.play() { (finished) in
                if finished {
                    self.viewModel.hasPlayedAnimation = true
                    self.animationView.removeFromSuperview()
                    self.fetchData()
                }
            }
                
            }
        }
    
    private func setupCustomNavTitle() {
        let navTitle = UILabel()
        navTitle.text = "Recipe"
        navTitle.font = UIFont.boldSystemFont(ofSize: 22)
        navTitle.translatesAutoresizingMaskIntoConstraints = false

        let titleView = UIView()
        titleView.addSubview(navTitle)
        self.navigationItem.titleView = titleView

        NSLayoutConstraint.activate([
            navTitle.centerXAnchor.constraint(equalTo: titleView.centerXAnchor),
            navTitle.centerYAnchor.constraint(equalTo: titleView.centerYAnchor)
        ])
    }
    
    
    
    
}
#Preview{
    RecipeVC(recipe: RecipeViewModel(foodType: "Breakfast"))
}


extension RecipeVC: RecipeDelegate {
    
    func navigationToRecipeDetails(with viewModel: RecipeDetailViewModel) {
        let VC = RecipeDetails(details: viewModel)
        navigationController?.present(VC, animated: true)
    }
    
    func updateCollection(recipe: Food) {
        
        DispatchQueue.main.async {
            self.mealCollection.reloadData()
        }
        
    }
}

