//
//  AdditionDetailView.swift
//  workout
//
//  Created by vano Kvakhadze on 26.07.24.
//

import SwiftUI


struct AdditionDetailView: View {
    
    var details: Recipe
    
    var body: some View {
        
        
        VStack{
            imageOfRecipe(name: "globe", width: 17, height: 17)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [ Color(hex: 0xdddddd),  Color(hex: 0x8d97e7)]), startPoint: .top, endPoint: .bottom))
            Text(details.cuisineType[0])
        }
        Rectangle()
            .frame(width: 1, height: 35)
        
        
        VStack{
            imageOfRecipe(name: "flame", width: 17, height: 17)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [ Color(hex: 0xf89b05),  Color(hex: 0xea380e)]), startPoint: .leading, endPoint: .trailing))
            Text("\(details.calories, specifier: "%0.f") cal")
        }
        .padding(.leading, 10)
        
        Rectangle()
            .frame(width: 1, height: 35)
        
        VStack{
            imageOfRecipe(name: "fork.knife", width: 17, height: 17)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [ Color(hex: 0xa3bfa0),  Color(hex: 0x98ff98)]), startPoint: .leading, endPoint: .trailing))
            
            Text(details.dietLabels[0])
        }
        .padding(.leading, 10)
        
    }
    
    
}

