//
//  Details.swift
//  workout
//
//  Created by vano Kvakhadze on 20.07.24.
//

import SwiftUI

struct Details<Content:View>: View {
    var exercise: Exercise
    var content: Content
    
    init(exercise: Exercise, @ViewBuilder content: () -> Content) {
        self.exercise = exercise
        self.content = content()
    }
    
    var body: some View {
        
        content
        
        VStack(spacing: 10){
            Spacer()
                .frame(height: 5)
            
            Text(exercise.name)
                .lineLimit(1)
                .bold()
                .padding(.trailing, 30)
                .foregroundColor(Color.init(uiColor: .exerciseText))
                
            
            HStack{
                VStack (alignment: .leading, spacing: 10){
                    HStack{
                        SwiftCustomImage(systemName: "repeat", width: 18, height: 18, CustomColor: Color(uiColor: .exerciseImg))
                        
                        Text(exercise.bodyPart == "cardio" ? "1-2" : "2-4 set")
                            .font(.system(size: 12))
                            .foregroundColor(Color.init(uiColor: .exerciseText))
                        
                    }
                    
                    
                    HStack{
                        SwiftCustomImage(systemName: "figure.mind.and.body", width: 20, height: 20, CustomColor: Color(uiColor: .exerciseImg))
                        Text(exercise.bodyPart == "cardio" ? "10 min" : "2 min")
                            .font(.system(size: 12))
                            .foregroundColor(Color.init(uiColor: .exerciseText))
                    }
                    
                }
                
                Spacer()
                
                VStack (alignment: .trailing, spacing: 10){
                    HStack{
                        
                        Text(exercise.bodyPart)
                            .frame(width: 80, height: 18)
                            .foregroundStyle(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(.lightGray),  Color(.black)]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(5)
                           .font(.system(size: 12))
                           .foregroundColor(Color.init(uiColor: .tertiarySystemGroupedBackground))
                    }
                    
                    if exercise.bodyPart == "cardio" {
                        HStack{
                            SwiftCustomImage(systemName: "stopwatch", width: 18, height: 18, CustomColor: Color(uiColor: .exerciseImg))
                            
                            Text("30 min")
                                .font(.system(size: 12))
                                .foregroundColor(Color.init(uiColor: .exerciseText))
                                
                        }
                    }
                }
            }
        }
        .frame(width: 240)
    }
}

