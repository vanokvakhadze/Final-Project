//
//  MuscleList.swift
//  workout
//
//  Created by vano Kvakhadze on 19.07.24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MuscleList: View {
    
    @ObservedObject var viewModel: PlaningViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading){
                
                
                Text("Muscles")
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.leading, 15)
                
                ScrollView(.horizontal){
                    HStack{
                        ForEach(viewModel.uniqueExercises(for: viewModel.currentDay), id: \.id) { exercise in
                            
                            VStack{
                                Image(uiImage: UIImage(named: exercise.bodyPart)!)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .scaledToFill()
                                    .cornerRadius(60)
                                
                                Text(exercise.bodyPart)
                            }
                            .frame(width: 100, height: 120)
                            .background(Color.init(uiColor: .systemBackground))
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke( LinearGradient(gradient: Gradient(colors: [ Color(uiColor: .bodyPartBorder),  Color(UIColor.bodyPartBorder2)]), startPoint: .top, endPoint: .bottom), lineWidth: 2.3)
                            )
                            
                        } .padding(.horizontal, 10)
                        
                    }
                    
                }
                .frame(width: geometry.size.width * 0.95 )
                .frame(height: 130)
               // .background(Color(hex: 0x5c0c0c0))
                .background(Color.init(uiColor: .tertiarySystemGroupedBackground))
                .cornerRadius(10)
                .shadow(color: .gray, radius: 1)
                .padding(.leading, 10)
                
                Spacer()
                    .frame(height: 15)
                
                HStack{
                    Text("Exercise")
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    Button( action: {
                        
                        viewModel.completeAllExercisesForCurrentDay()
                        
                    }){
                        Text("Complete all")
                            .font(.system(size: 12))
                            .foregroundStyle(.white)
                    }
                    .frame(width: 90, height: 23)
                    .background(LinearGradient(gradient: Gradient(colors: [ Color(hex: 0x55f3c0),  Color(hex: 0x554af0)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    .shadow(color: .white, radius: 2)
                    
                    Spacer()
                        .frame(width: 10)
                }
                ScrollView{
                    Spacer()
                        .frame(height: 10)
                    ForEach(viewModel.allExercises(for: viewModel.currentDay), id: \.id) { exercise in
                        NavigationLink(value: exercise){
                            getList(exercise: exercise)
                            
                        }
                    }
                    Spacer()
                        .frame(height: 20)
                    
                    VStack(spacing: 14){
                        progressView
                        NextButton(viewModel: viewModel)
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 10)
            }
            
            
        }
    }
    
    func getList(exercise: Exercise) -> some View {
        return  ZStack(alignment: .topTrailing) {
            HStack {
                
                Details(exercise: exercise, content: {
                    
                    WebImage(url: URL(string: exercise.gifUrl))
                        .resizable()
                        .indicator(.activity)
                        .frame(width: 90, height: 90)
                        .scaledToFill()
                        .cornerRadius(8)
                        .shadow(color: Color(hex: 0x3c493f), radius: 4)
                        .padding(.vertical, 5)
                        .padding(.trailing, 10)
                    
                })
                
                Spacer()
                    .frame(width: 10)
                
                
            }
            .frame(maxWidth:  .infinity)
            .frame(height: 100)
            .background(LinearGradient(gradient: Gradient(colors: [ Color(UIColor.exercise1),  Color(uiColor: .exerciseRow2)]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
            
            ZStack{
                
                Button(action: {
                    viewModel.toggleExerciseCompletion(exercise)
                }) {
                    Image(systemName: viewModel.completed.contains(exercise.id) ? "checkmark.circle" : "circle")
                        .foregroundColor( viewModel.completed.contains(exercise.id) ? .green : .white)
                    
                }
                
                .padding(.top, 12)
                .padding(.trailing, 12)
                .buttonStyle(PlainButtonStyle())
                
            }
            
        }
    }
    
    
    
    var progressView: some View {
        let percent: Double =  Double(viewModel.completed.count) / Double(viewModel.currentDayExerciseCount) * 100
        return HStack{
            Spacer()
                .frame(width: 10)
            
            VStack(alignment: .leading){
                
                Text("Progress this day")
                    .bold()
                    .padding(.top, -15)
                    
                
                Spacer()
                    .frame(height: 10)
                
                Text(viewModel.completed.count == 0 ? "Haven't completed yet" : " \(viewModel.completed.count)/ \(viewModel.currentDayExerciseCount) is completed")
                    .padding(.leading, 5)
                    .font(.system(size: 14))
                
            }
            Spacer()
            
            
            ProgressBar(width: 60, height: 60, totalPercent: 100, completedPercent: percent)
            Spacer()
                .frame(width: 20)
            
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 90)
        .background(LinearGradient(gradient: Gradient(colors: [ Color(UIColor.progres),  Color(uiColor: .progresColor1)]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(10)
        .padding(.horizontal, 5)
        
    }
}

//#Preview{
//    MuscleList(viewModel: PlaningViewModel())
//}


struct ExerciseDetails: UIViewControllerRepresentable {
    let exercise: Exercise
    
    func makeUIViewController(context: Context) -> exerciseDetailsVC {
        let viewModel = ExerciseDetailsViewModel(details: exercise)
        return exerciseDetailsVC(viewModel: viewModel)
    }
    
    func updateUIViewController(_ uiViewController: exerciseDetailsVC, context: Context) {}
}





