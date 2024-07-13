//
//  exerciseDetailsVC.swift
//  workout
//
//  Created by vano Kvakhadze on 11.07.24.
//

import UIKit

class exerciseDetailsVC: UIViewController {
    
    let viewModel: ExerciseDetailsViewModel
    
    private let exerciseView = UIView.customView()
    private let backgroundImage = UIImageView.customNamedImage(named: "backGR1")
    
    let equipmentImage = UIImageView.customSystemView(imageName: "dumbbell")
    let targetImage = UIImageView.customSystemView(imageName: "arrowshape.forward")
    
    
    private let safeArea = UIView.customView()
    private let gif = GIFImageView()
    private let name = UILabel.customLabel()
    private let target = UILabel.customLabel()
    private let equipment = UILabel.customLabel()
    private let targetValue = UILabel.customLabel()
    private let equipmentValue = UILabel.customLabel()
    
    private let info = UILabel.customLabel()
    private let secondMuscle = UILabel.customLabel()
    
    let muscleCollection: UICollectionView = {
        let collectionFlow = UICollectionViewFlowLayout()
        collectionFlow.minimumLineSpacing = 20
        collectionFlow.minimumInteritemSpacing = 20
        collectionFlow.scrollDirection = .horizontal
        collectionFlow.itemSize = CGSize(width: 120, height: 30)
        collectionFlow.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 5, right: 0)
        
        
        let collection = UICollectionView(frame: CGRect(x: 0, y: 10, width: 400, height: 400), collectionViewLayout: collectionFlow)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .none
        return collection
    }()
    
    private let detailsTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    init(viewModel: ExerciseDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpbackh()
        setUpUI()
        setUpExerciseView()
        addExerciseFeature()
        addInfoText()
        addDetailsTable()
        addSecondMuscle()
        addCollectionView()
        navigationItem.title = viewModel.details.bodyPart
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        playGIFs()
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "")
        navigationController?.navigationBar.tintColor = .systemGray5
        navigationItem.largeTitleDisplayMode = .always
        setupCustomNavTitle()
    }

    
    func playGIFs() {
        gif.startAnimating()
        gif.isPlaying = true
    }
    
    func setUpbackh(){
        view.addSubview(backgroundImage)
        NSLayoutConstraint.activate([
        backgroundImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -100),
        backgroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 150),
        backgroundImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -100),
        backgroundImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 100)
        ])
       
    }

    
    
    func setUpUI(){
        view.addSubview(safeArea)
        let safeView = view.safeAreaLayoutGuide
        safeArea.topAnchor.constraint(equalTo: safeView.topAnchor).isActive = true
        safeArea.leadingAnchor.constraint(equalTo: safeView.leadingAnchor).isActive = true
        safeArea.trailingAnchor.constraint(equalTo: safeView.trailingAnchor).isActive = true
        safeArea.bottomAnchor.constraint(equalTo: safeView.bottomAnchor).isActive = true
       
        
    }
    
    func setUpExerciseView(){
        safeArea.addSubview(exerciseView)
        exerciseView.backgroundColor = .black.withAlphaComponent(0.2)
        NSLayoutConstraint.activate([
        exerciseView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
        exerciseView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
        exerciseView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
        exerciseView.heightAnchor.constraint(equalToConstant: 200)
        ])
        setUpGif()
    }
    
    func setUpGif(){
        exerciseView.addSubview(gif)
        gif.loadGIF(from: URL(string: viewModel.details.gifUrl)!)
        gif.clipsToBounds = true
        gif.layer.cornerRadius = 10
        gif.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gif.centerYAnchor.constraint(equalTo: exerciseView.centerYAnchor),
            gif.leadingAnchor.constraint(equalTo: exerciseView.leadingAnchor, constant: 10),
            gif.widthAnchor.constraint(equalToConstant: 160),
            gif.heightAnchor.constraint(equalToConstant: 160)
            ])
    }
    
    func addExerciseFeature(){
        exerciseView.addSubview(name)
        exerciseView.addSubview(target)
        exerciseView.addSubview(equipment)
        exerciseView.addSubview(equipmentImage)
        exerciseView.addSubview(targetImage)
        exerciseView.addSubview(equipmentValue)
        exerciseView.addSubview(targetValue)
        
        name.text = viewModel.details.name
        name.font = .boldSystemFont(ofSize: 18)
        name.textColor = .systemGroupedBackground
        name.numberOfLines = 0
        name.lineBreakMode = .byWordWrapping
        name.textAlignment = .center
        
        target.text = "Target"
        target.font = .systemFont(ofSize: 15)
        targetValue.text = viewModel.details.target
        targetValue.font = .systemFont(ofSize: 13)
        targetValue.textColor = .systemGray6
        
        equipment.text = "Equipment"
        equipment.font = .systemFont(ofSize: 15)
        equipmentValue.text = viewModel.details.equipment
        equipmentValue.font = .systemFont(ofSize: 13)
        equipmentValue.textColor = .systemGray6
        
        targetImage.tintColor = .green
        equipmentImage.tintColor = .cyan
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: exerciseView.topAnchor, constant: 2),
            name.leadingAnchor.constraint(equalTo: gif.trailingAnchor, constant: 10),
            name.trailingAnchor.constraint(equalTo: exerciseView.trailingAnchor, constant: -10),
            name.bottomAnchor.constraint(equalTo: exerciseView.centerYAnchor, constant: -15),
            
            target.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            target.leadingAnchor.constraint(equalTo: gif.trailingAnchor, constant: 30),
            
            targetImage.topAnchor.constraint(equalTo: target.bottomAnchor),
            targetImage.leadingAnchor.constraint(equalTo: gif.trailingAnchor, constant: 25),
            targetImage.widthAnchor.constraint(equalToConstant: 20),
            targetImage.heightAnchor.constraint(equalToConstant: 20),
            targetValue.centerYAnchor.constraint(equalTo: targetImage.centerYAnchor),
            targetValue.leadingAnchor.constraint(equalTo: targetImage.trailingAnchor, constant: 10),
            
            
            equipment.topAnchor.constraint(equalTo: targetImage.bottomAnchor, constant: 10),
            equipment.leadingAnchor.constraint(equalTo: gif.trailingAnchor, constant: 30),
            
            equipmentImage.topAnchor.constraint(equalTo: equipment.bottomAnchor, constant: 5),
            equipmentImage.leadingAnchor.constraint(equalTo: gif.trailingAnchor, constant: 25),
            equipmentImage.widthAnchor.constraint(equalToConstant: 20),
            equipmentImage.heightAnchor.constraint(equalToConstant: 20),
            equipmentValue.centerYAnchor.constraint(equalTo: equipmentImage.centerYAnchor),
            equipmentValue.leadingAnchor.constraint(equalTo: equipmentImage.trailingAnchor, constant: 10)
        ])
    }
    
    func addInfoText(){
        safeArea.addSubview(info)
        info.text = "Description"
        info.font = .boldSystemFont(ofSize: 16)
       
        
        NSLayoutConstraint.activate([
            info.topAnchor.constraint(equalTo: exerciseView.bottomAnchor, constant: 25),
            info.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15)])
    }
    

    func addDetailsTable(){
        safeArea.addSubview(detailsTable)
        detailsTable.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 15).isActive = true
        detailsTable.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        detailsTable.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        detailsTable.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -175).isActive = true
        detailsTable.dataSource = self
        detailsTable.delegate = self
        detailsTable.register(detailsCell.self, forCellReuseIdentifier: "details")
        detailsTable.clipsToBounds = true
        detailsTable.layer.cornerRadius = 10
        detailsTable.separatorStyle = .none
        detailsTable.backgroundColor = .black.withAlphaComponent(0.3)
       
    }
    
    func addSecondMuscle(){
        safeArea.addSubview(secondMuscle)
        secondMuscle.text = "Secondary Muscles"
        secondMuscle.font = .boldSystemFont(ofSize: 16)
      
        
        NSLayoutConstraint.activate([
            secondMuscle.topAnchor.constraint(equalTo: detailsTable.bottomAnchor, constant: 40),
            secondMuscle.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15)])
    }
    
    func addCollectionView() {
        safeArea.addSubview(muscleCollection)
        NSLayoutConstraint.activate([
            muscleCollection.topAnchor.constraint(equalTo: secondMuscle.bottomAnchor, constant: 10),
            muscleCollection.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            muscleCollection.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            muscleCollection.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        muscleCollection.register(collectionCell.self, forCellWithReuseIdentifier: "PageCell")
        muscleCollection.dataSource = self
       
    }
    
    private func setupCustomNavTitle() {
        let navTitle = UILabel()
        navTitle.text = viewModel.details.bodyPart.capitalized
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

