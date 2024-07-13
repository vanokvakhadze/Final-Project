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
    
    private let workOutTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
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
        view.backgroundColor = UIColor(named: "backColor3")
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
        setUpTableView()
        
    }
    
    func addHeader(){
        safeArea.addSubview(bodyPartTitle)
        bodyPartTitle.text = "BodyPart Muscles"
        bodyPartTitle.font = .boldSystemFont(ofSize: 24)
        
        
        NSLayoutConstraint.activate([
            bodyPartTitle.topAnchor.constraint(equalTo: view.topAnchor,constant:   65),
            bodyPartTitle.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20)])
    }
    
    func setUpTableView(){
        safeArea.addSubview(workOutTable)
        workOutTable.topAnchor.constraint(equalTo: bodyPartTitle.bottomAnchor, constant: 20).isActive = true
        workOutTable.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        workOutTable.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        workOutTable.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 20).isActive = true
        workOutTable.dataSource = self
        workOutTable.delegate = self
        workOutTable.register(MuscleCell.self, forCellReuseIdentifier: "muscle")
        workOutTable.backgroundColor = UIColor(named: "backColor3")
        workOutTable.separatorStyle = .none
        workOutTable.clipsToBounds = true
        workOutTable.layer.cornerRadius = 8
    }
    
    
    
    
    func fetchBodyPart(muscles: [String]) {
        viewModel.bodyPart = muscles
        DispatchQueue.main.async {
            self.workOutTable.reloadData()
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
