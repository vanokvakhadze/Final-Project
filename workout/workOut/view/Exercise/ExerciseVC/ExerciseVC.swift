//
//  ExerciseVC.swift
//  workout
//
//  Created by vano Kvakhadze on 11.07.24.
//

import UIKit
import SDWebImage

class ExerciseVC: UIViewController, ExerciseViewModelDelegate {
    
    var exercise: exerciseViewModel
    
    private let safeArea = UIView.customView()
    
    private let bodyPartImage = UIImageView()
    
    private let exerciseTitle = UILabel.customLabel()
    
    private let exerciseTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    init(exercise: exerciseViewModel) {
        self.exercise = exercise
        super.init(nibName: nil, bundle: nil)
        exercise.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backColor3")
        setImage()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           pauseAllGIFs()
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "")
        navigationController?.navigationBar.tintColor = .systemGray5
        navigationItem.largeTitleDisplayMode = .always
        setupCustomNavTitle()
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
    
    
    func setImage(){
        safeArea.addSubview(bodyPartImage)
        safeArea.addSubview(exerciseTitle)
        
        bodyPartImage.image = UIImage(named: exercise.bodyPart)
        bodyPartImage.translatesAutoresizingMaskIntoConstraints = false
        bodyPartImage.clipsToBounds = true
        bodyPartImage.layer.cornerRadius = 20
        
        exerciseTitle.text = "Exercises"
        exerciseTitle.font = .boldSystemFont(ofSize: 20)
       
        
        
        
        
        
        NSLayoutConstraint.activate([
            bodyPartImage.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            bodyPartImage.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 15),
            bodyPartImage.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 40),
            bodyPartImage.heightAnchor.constraint(equalToConstant: 210),
            exerciseTitle.topAnchor.constraint(equalTo: bodyPartImage.bottomAnchor, constant: 20),
            exerciseTitle.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: 15)
        ])
    }
    
    func setUpTableView(){
        safeArea.addSubview(exerciseTable)
        exerciseTable.topAnchor.constraint(equalTo: exerciseTitle.bottomAnchor, constant: 15).isActive = true
        exerciseTable.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        exerciseTable.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        exerciseTable.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 20).isActive = true
        exerciseTable.dataSource = self
        exerciseTable.delegate = self
        exerciseTable.register(ExerciseCell.self, forCellReuseIdentifier: "exercise")
        exerciseTable.clipsToBounds = true
        exerciseTable.layer.cornerRadius = 15
        exerciseTable.separatorStyle = .none
        exerciseTable.backgroundColor = UIColor(named: "backColor3")
    }
   
       func pauseAllGIFs() {
           for visibleCell in  exerciseTable.visibleCells {
               if let gifCell = visibleCell as? ExerciseCell {
                   gifCell.muscleGif.stopAnimating()
                   gifCell.muscleGif.isPlaying = false
               }
           }
       }

        
       
        private func setupCustomNavTitle() {
            let navTitle = UILabel()
            navTitle.text = exercise.bodyPart.capitalized
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
        
    func updateView(exercise: [Exercise]) {
        DispatchQueue.main.async {
            self.exerciseTable.reloadData()
        }
    }
    
    func navigateToDetails(with viewModel: ExerciseDetailsViewModel) {
        let detailsVC = exerciseDetailsVC(viewModel: viewModel)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
   

    
}


