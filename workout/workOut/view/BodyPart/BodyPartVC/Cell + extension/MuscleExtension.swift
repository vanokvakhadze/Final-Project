//
//  MuscleExtension.swift
//  workout
//
//  Created by vano Kvakhadze on 11.07.24.
//

import Foundation
import UIKit

extension WorkOutVC:  UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.bodyPartCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "muscle", for: indexPath) as! BodyPartCell
        let item = viewModel.bodyPart[indexPath.row]
        cell.updateCells(image: item, muscles: item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.fetchExercise(for: indexPath.row)
    }
}
