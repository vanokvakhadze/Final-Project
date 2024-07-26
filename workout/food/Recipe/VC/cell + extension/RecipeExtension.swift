//
//  RecipeExtension.swift
//  workout
//
//  Created by vano Kvakhadze on 23.07.24.
//

import Foundation
import UIKit

extension RecipeVC:  UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.recipeCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "food", for: indexPath) as! RecipeCell
        let item = viewModel.recipe?.hits[indexPath.row].recipe
        cell.updateCells(name: item?.label ?? "", image: item?.images.regular.url ?? "", calory: item?.calories ?? 0)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectedFood(for: indexPath.row)
    }
}
