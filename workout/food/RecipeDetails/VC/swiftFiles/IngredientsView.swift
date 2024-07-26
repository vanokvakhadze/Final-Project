//
//  IngredientsView.swift
//  workout
//
//  Created by vano Kvakhadze on 26.07.24.
//

import SwiftUI

struct IngredientsView: View {
    
    var details: Recipe
    
    var body: some View {
        ScrollView{
            ForEach(details.ingredients, id: \.foodId) { value in
                HStack{
                    Spacer()
                        .frame(width: 15)
                    Text(value.text)
                        .font(.custom("Sofia ", size: 14))
                        .bold()
                        .padding(.bottom, 10)
                   
                    
                    Spacer()
                    
                    OnlineImages(photo: value.image ?? "")
                        .frame(width: 80,  height: 60)
                        .scaledToFill()
                        .cornerRadius(10)
                    
                    
                    Spacer()
                        .frame(width: 10)
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                .background(Color(UIColor.tertiarySystemGroupedBackground))
                .cornerRadius(20)
               
            }
        }
        .padding(.horizontal, 20)
    }
}
