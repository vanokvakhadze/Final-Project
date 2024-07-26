//
//  PlaningView.swift
//  workout
//
//  Created by vano Kvakhadze on 15.07.24.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlaningView: View {
    @State private var showAnimation = false
    @ObservedObject  var viewModel: PlaningViewModel
    
    var body: some View {
        NavigationStack{
            
            ZStack{
                Color.init(uiColor: .systemBackground)
                    .ignoresSafeArea(.all)
                VStack {
                    
                    Spacer()
                    
                    if viewModel.accepted == false  {
                        ZStack{
                            Button(action: {
                                showAnimation = true
                                    
                            }){
                                Text("Challenge accept")
                                    .bold()
                                    .foregroundStyle(.white)
                            }
                            .frame(width: showAnimation ? 0 : 280)
                            .frame(height: showAnimation ? 0 : 60)
                            .background(Color.init(uiColor: .acceptButton))
                            .cornerRadius(20)
                            .shadow(color: .blue, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            

                            
                            
                            if showAnimation {
                                
                                LottieView(url: URL(string: "https://lottie.host/0e60a99e-6196-4d78-ae74-6588c394a89a/AYHASEtmPk.json")!) {
                                    showAnimation = false
                                    viewModel.accepted = true
                                    
                                    
                                }
                            }
                        }
                        
                        Spacer()
                        
                    } else {
                        
                        
                        Spacer()
                            .frame(height: 15)
                        
                        MuscleList(viewModel: viewModel)
                        
                        Spacer()
                            .frame(height: 10)
                        
                        
                        
                        
                    }
                }
                .navigationTitle(viewModel.accepted ? "Day \(viewModel.currentDay)" : "3 day's challenge")
                .navigationBarTitleDisplayMode(.automatic)
                .onAppear {
                    viewModel.fetchExercise()
                }
                
                .navigationDestination(for: Exercise.self)  { item in
                    ExerciseDetails(exercise: item)
                }
            }
            
        }
        
    }
    
}

#Preview {
    PlaningView(viewModel: PlaningViewModel())
}







