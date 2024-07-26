//
//  exerciseDetailsVC.swift
//  workout
//
//  Created by vano Kvakhadze on 11.07.24.
//

import UIKit

class exerciseDetailsVC: UIViewController {
    
    let viewModel: ExerciseDetailsViewModel
    
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    
    private let exerciseView = UIView.customView()
    private let backgroundImage = UIImageView.customNamedImage(named: "backGR1")
    
    private let equipmentImage = UIImageView.customSystemView(imageName: "dumbbell")
    private let targetImage = UIImageView.customSystemView(imageName: "arrowshape.forward")
    
    private let gif = GIFImageView()
    private let name = UILabel.customLabel()
    private let target = UILabel.customLabel()
    private let equipment = UILabel.customLabel()
    private let targetValue = UILabel.customLabel()
    private let equipmentValue = UILabel.customLabel()
    
    private let info = UILabel.customLabel()
    private let secondMuscle = UILabel.customLabel()
    
    private let muscleCollection: UICollectionView = {
        let collectionFlow = UICollectionViewFlowLayout()
        collectionFlow.minimumLineSpacing = 20
        collectionFlow.minimumInteritemSpacing = 20
        collectionFlow.scrollDirection = .horizontal
        collectionFlow.itemSize = CGSize(width: 120, height: 30)
        collectionFlow.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 5, right: 0)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionFlow)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .none
        return collection
    }()
    
    private let detailsTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private var detailsTableHeightConstraint: NSLayoutConstraint!
        
    
    
    init(viewModel: ExerciseDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpScrollView()
        setUpContainerView()
        setUpExerciseView()
        addExerciseFeature()
        addInfoText()
        addDetailsTable()
        addSecondMuscle()
        addCollectionView()
        navigationItem.title = viewModel.details.bodyPart
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        playGIFs()
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "")
        navigationController?.navigationBar.tintColor = .exerciseText
        navigationItem.largeTitleDisplayMode = .always
        setupCustomNavTitle()
    }

    func playGIFs() {
        gif.startAnimating()
        gif.isPlaying = true
    }
 
    private func setUpScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setUpContainerView() {
        scrollView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -25)
        ])
    }

    private func setUpExerciseView(){
        containerView.addSubview(exerciseView)
        exerciseView.backgroundColor = .tertiarySystemGroupedBackground
        exerciseView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            exerciseView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            exerciseView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            exerciseView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            exerciseView.heightAnchor.constraint(equalToConstant: 200)
        ])
        setUpGif()
    }
    
    private func setUpGif(){
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
    
    private func addExerciseFeature(){
        exerciseView.addSubview(name)
        exerciseView.addSubview(target)
        exerciseView.addSubview(equipment)
        exerciseView.addSubview(equipmentImage)
        exerciseView.addSubview(targetImage)
        exerciseView.addSubview(equipmentValue)
        exerciseView.addSubview(targetValue)
        
        name.text = viewModel.details.name
        name.font = .boldSystemFont(ofSize: 18)
        name.numberOfLines = 0
        name.lineBreakMode = .byWordWrapping
        name.textAlignment = .center
        
        target.text = "Target"
        target.font = .systemFont(ofSize: 15)
        targetValue.text = viewModel.details.target
        targetValue.font = .systemFont(ofSize: 13)
       
        
        equipment.text = "Equipment"
        equipment.font = .systemFont(ofSize: 15)
        equipmentValue.text = viewModel.details.equipment
        equipmentValue.font = .systemFont(ofSize: 13)
        
        targetImage.tintColor = .systemGreen
        equipmentImage.tintColor = .systemCyan
        
        name.translatesAutoresizingMaskIntoConstraints = false
        target.translatesAutoresizingMaskIntoConstraints = false
        targetValue.translatesAutoresizingMaskIntoConstraints = false
        equipment.translatesAutoresizingMaskIntoConstraints = false
        equipmentValue.translatesAutoresizingMaskIntoConstraints = false
        equipmentImage.translatesAutoresizingMaskIntoConstraints = false
        targetImage.translatesAutoresizingMaskIntoConstraints = false
        
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
    
    private func addInfoText(){
        containerView.addSubview(info)
        info.text = "Description"
        info.font = .boldSystemFont(ofSize: 16)
        info.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            info.topAnchor.constraint(equalTo: exerciseView.bottomAnchor, constant: 25),
            info.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15)
        ])
    }

    private func addDetailsTable(){
        containerView.addSubview(detailsTable)
        detailsTable.dataSource = self
        detailsTable.delegate = self
        detailsTable.register(detailsCell.self, forCellReuseIdentifier: "details")
        detailsTable.clipsToBounds = true
        detailsTable.layer.cornerRadius = 10
        detailsTable.separatorStyle = .none
        
        
        NSLayoutConstraint.activate([
            detailsTable.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 15),
            detailsTable.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            detailsTable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        detailsTableHeightConstraint = detailsTable.heightAnchor.constraint(equalToConstant: 1)
        detailsTableHeightConstraint.isActive = true

        updateDetailsTableHeight()
    }
        
     func updateDetailsTableHeight() {
            detailsTable.layoutIfNeeded()
            let height = detailsTable.contentSize.height
            detailsTableHeightConstraint.constant = height
        }
    
    
    private func addSecondMuscle(){
        containerView.addSubview(secondMuscle)
        secondMuscle.text = "Secondary Muscles"
        secondMuscle.font = .boldSystemFont(ofSize: 16)
        secondMuscle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondMuscle.topAnchor.constraint(equalTo: detailsTable.bottomAnchor, constant: 40),
            secondMuscle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15)
        ])
    }
    
    private func addCollectionView() {
        containerView.addSubview(muscleCollection)
        NSLayoutConstraint.activate([
            muscleCollection.topAnchor.constraint(equalTo: secondMuscle.bottomAnchor, constant: 10),
            muscleCollection.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            muscleCollection.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            muscleCollection.heightAnchor.constraint(equalToConstant: 60),
            muscleCollection.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
           
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
