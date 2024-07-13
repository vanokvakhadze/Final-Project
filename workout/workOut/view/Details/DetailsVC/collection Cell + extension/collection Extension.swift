//
//  collection Extension.swift
//  workout
//
//  Created by vano Kvakhadze on 13.07.24.
//

import Foundation
import UIKit

extension exerciseDetailsVC:  UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.details.secondaryMuscles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cells = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCell", for: indexPath) as! collectionCell
        let item = viewModel.details.secondaryMuscles[indexPath.row]
        cells.muscles.text = item
        return cells 
    }
}
