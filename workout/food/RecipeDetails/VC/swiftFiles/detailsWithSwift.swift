//
//  detailsWithSwift.swift
//  workout
//
//  Created by vano Kvakhadze on 23.07.24.
//

import SwiftUI

struct detailsWithSwift: View {
     var viewModel: RecipeDetailViewModel
    
    var body: some View {
        NavigationView{
            GeometryReader { geometry in
                ZStack{
                    Color(UIColor.ingredient)
                    
                    VStack(spacing: 30){
                        
                        OnlineImages(photo: viewModel.details.images.regular.url)
                            .frame(width: 280)
                            .frame(height: 280)
                            .cornerRadius(140)
                            .shadow(color: .white, radius: 10)
                            .padding(.top, 10)
                            
                        
                        VStack{
                            
                            Spacer()
                                .frame(height: 10)
                            
                            Rectangle()
                                .frame(width: 70, height: 3)
                                .foregroundColor(.gray)
                                .cornerRadius(5)
                            
                            Spacer()
                                .frame(height: 20)
                            
                            ScrollView{
                                VStack(spacing: 25){
                                    VStack(alignment: .leading) {
                                        HStack{
                                            Text(viewModel.details.label)
                                                .font(.custom("Poppins", size: 22))
                                                .fontWeight(.heavy)
                                            
                                            
                                            Spacer()
                                            
                                            Text(viewModel.details.mealType[0])
                                                .font(.custom("Sofia", size: 12))
                                                .frame(width: 85, height: 25)
                                                .background(Color.foodType)
                                                .cornerRadius(8)
                                            
                                        }
                                        .padding(.horizontal, 10)
                                        
                                    }
                                    .frame(width: geometry.size.width - 30)
                                    
                                                                    
                                    HStack(spacing: 20){
                                        
                                        AdditionDetailView(details: viewModel.details)
                                    }
                                    .frame(width: geometry.size.width - 40)
                                    .frame(height: 50)
                                    .background(Color(uiColor: .tertiarySystemGroupedBackground))
                                    .cornerRadius(10)
                                   
     
                                    VStack(alignment: .leading, spacing: 25){
                                        Text("Ingredients")
                                            .fontWeight(.semibold)
                                            .font(.custom("Poppins", size: 18))
                                            .padding(.leading, 20)
                                
                                        
                                        IngredientsView(details: viewModel.details)
                                        
                                    }
                                    
                                }
                            }
                            .padding(.top, 10)
                        }
                        .background(Color(uiColor: .systemBackground))
                        .cornerRadius(30)
                        .frame(maxHeight: .infinity)
                        .ignoresSafeArea(.all)
                        .padding(.horizontal, 10)
                    }
                }
           
            }
        }
        
    }
}


struct imageOfRecipe: View {
    var name: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Image(systemName: name)
            .resizable()
            .frame(width: width, height: height)
            .scaledToFill()
    }
}




struct OnlineImages: View {
    var photo: String
    
    var body: some View {
        ZStack(alignment: .top){
            if let imageURL = URL(string: photo) {
                AsyncImage(url: imageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            
                        
                    }
                }
                
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(8)
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(.gray)
            }
        }
    }
}


