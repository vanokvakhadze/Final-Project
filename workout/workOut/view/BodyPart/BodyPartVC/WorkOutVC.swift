//
//  WorkOutVC.swift
//  workout
//
//  Created by vano Kvakhadze on 09.07.24.
//

import UIKit

class WorkOutVC: UIViewController, ViewModelDelegate {
    
    var viewModel: WorkoutViewModel
    var selectedIndex = 0
    
    private let safeArea = UIView.customView()
    
    private let bodyPartTitle = UILabel.customLabel()
    
    let collection: UICollectionView = {
        let collectionFlow = UICollectionViewFlowLayout()
        collectionFlow.minimumLineSpacing = 20
        collectionFlow.minimumInteritemSpacing = 20
        collectionFlow.scrollDirection = .vertical
        collectionFlow.itemSize = CGSize(width: 170, height: 170)
        let collections = UICollectionView(frame: CGRect(x: 0, y: 0, width: 327, height: 192), collectionViewLayout: collectionFlow)
        collections.translatesAutoresizingMaskIntoConstraints = false
        collections.backgroundColor = .none
        return collections
    }()
    
    init() {
        self.viewModel = WorkoutViewModel()
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpUI()
        
    }
    
    func setUpUI(){
        view.addSubview(safeArea)
        
        let safeView = view.safeAreaLayoutGuide
        safeArea.topAnchor.constraint(equalTo: safeView.topAnchor).isActive = true
        safeArea.leadingAnchor.constraint(equalTo: safeView.leadingAnchor).isActive = true
        safeArea.trailingAnchor.constraint(equalTo: safeView.trailingAnchor).isActive = true
        safeArea.bottomAnchor.constraint(equalTo: safeView.bottomAnchor).isActive = true
        
        addHeader()
        addCollection()
        
    }
    
    func addHeader(){
        safeArea.addSubview(bodyPartTitle)
        bodyPartTitle.text = "BodyPart Muscles"
        bodyPartTitle.font = .boldSystemFont(ofSize: 22)
        
        
        NSLayoutConstraint.activate([
            bodyPartTitle.topAnchor.constraint(equalTo: safeArea.topAnchor),
            bodyPartTitle.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20)])
    }

    func addCollection(){
        safeArea.addSubview(collection)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: bodyPartTitle.bottomAnchor, constant: 25),
            collection.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15),
            collection.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15),
            collection.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -25)
        ])
        collection.register(BodyPartCell.self, forCellWithReuseIdentifier: "muscle")
        collection.dataSource = self
        collection.delegate = self
        
    }

    
    
    
    func fetchBodyPart(muscles: [String]) {
        viewModel.bodyPart = muscles
        DispatchQueue.main.async {
            self.collection.reloadData()
        }
    }
    
    func navigationToExerciseVC(with viewModel: exerciseViewModel) {
        let VC = ExerciseVC(exercise: viewModel)
        navigationController?.pushViewController(VC, animated: true)
    }
    
}

#Preview{
    WorkOutVC()
}
