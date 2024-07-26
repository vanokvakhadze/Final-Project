//
//  NextButton.swift
//  workout
//
//  Created by vano Kvakhadze on 24.07.24.
//

import SwiftUI

struct NextButton: View {
    
    @ObservedObject var viewModel: PlaningViewModel
    
    var body: some View {
        
        Button(action: {
            if viewModel.currentDay == 3 {
                viewModel.showAlert = true
            } else {
                viewModel.moveToNextDay()
            }
        }) {
            ZStack{
                Text(viewModel.currentDay == 3 ? "Next Challenge" : "Next Day Exercise")
                Image(systemName:  !viewModel.allExercisesCompletedForCurrentDay ? "lock.fill" : "")
                    .resizable()
                    .frame(width: 12, height: 15)
                    .foregroundStyle(.black)
                    .padding(.leading, 165)
                    .padding(.bottom, 25)
            }
        }
        .frame(width: 200, height: 50)
        .background(LinearGradient(gradient: Gradient(colors: [ Color(UIColor.systemGreen),  Color(hex: 0x008000)]), startPoint: .leading, endPoint: .trailing).opacity( viewModel.allExercisesCompletedForCurrentDay ? 1.0 : 0.6))
        .cornerRadius(10)
        .foregroundColor(.white)
        .disabled(!viewModel.allExercisesCompletedForCurrentDay)
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Next Challenge"),
                message: Text("Are you ready to move to the next challenge?"),
                primaryButton: .default(Text("Yes")) {
                    viewModel.moveToNextChallenge()
                },
                secondaryButton: .cancel()
            )
        }
    }
}
