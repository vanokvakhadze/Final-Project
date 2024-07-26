//
//  FoodVC.swift
//  workout
//
//  Created by vano Kvakhadze on 09.07.24.
//

import UIKit

class FoodVC: UIViewController, FoodDelegate {
    
    var viewModel: FoodViewModel
    
    private let safeArea = UIView.customView()

    private let titleOfPage = UILabel.customLabel()
    
    private let foodTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    init() {
        self.viewModel = FoodViewModel()
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpTitle()
        setUpUI()
  
  
    }
    
    func setUpUI(){
        view.addSubview(safeArea)
        let safeView = view.safeAreaLayoutGuide
        safeArea.topAnchor.constraint(equalTo: safeView.topAnchor).isActive = true
        safeArea.leadingAnchor.constraint(equalTo: safeView.leadingAnchor).isActive = true
        safeArea.trailingAnchor.constraint(equalTo: safeView.trailingAnchor).isActive = true
        safeArea.bottomAnchor.constraint(equalTo: safeView.bottomAnchor).isActive = true
        
      
        setUpTableView()
        
    }
    
    func setUpTitle(){
        safeArea.addSubview(titleOfPage)
        titleOfPage.text = "Meal Type"
        titleOfPage.font = .boldSystemFont(ofSize: 22)
        
        titleOfPage.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        titleOfPage.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15).isActive = true
    }

    func setUpTableView(){
        safeArea.addSubview(foodTable)
        foodTable.topAnchor.constraint(equalTo: titleOfPage.bottomAnchor, constant: 15).isActive = true
        foodTable.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        foodTable.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        foodTable.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -25).isActive = true
        
        foodTable.dataSource = self
        foodTable.delegate = self
        foodTable.register(FoodCell.self, forCellReuseIdentifier: "food")
        foodTable.backgroundColor = .clear
        foodTable.separatorStyle = .none
        foodTable.clipsToBounds = true
        foodTable.layer.cornerRadius = 8
    }

    
    
    func fetchFoodType(food: [String]) {
        viewModel.foodType = food
        DispatchQueue.main.async {
            self.foodTable.reloadData()
        }
    }
    
    func navigationToExerciseVC(with viewModel: RecipeViewModel) {
        let VC = RecipeVC(recipe: viewModel)
        navigationController?.pushViewController(VC, animated: true)
    }
    
}
#Preview{
    FoodVC()
}
