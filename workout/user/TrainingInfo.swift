//
//  TrainingInfo.swift
//  workout
//
//  Created by vano Kvakhadze on 20.07.24.
//

import SwiftUI

struct TrainingInfo: View {
    
    @ObservedObject var viewModel: PlaningViewModel
   
    var body: some View {
        
            VStack(alignment: .leading, spacing: 15){
                Spacer()
                    .frame(height: 10)
                
                Text("Progress this month")
                    .bold()
                    .padding(.leading, 5)
             
               
                HStack{
                    Spacer()
                        .frame(width: 10)
                    progressView1
                    
                    Spacer()
                    
                    progressView2
                    Spacer()
                        .frame(width: 10)
                }
                
                Spacer()
                    .frame(height: 10)
            }
            .padding(.horizontal, 10)
            .background(.clear)
            .cornerRadius(10)
        
   
        
        
    }
    
    var progressView1: some View {
        let day: Double =  Double(viewModel.accepted ? viewModel.currentDay : 0)
       
        return VStack{
            HStack{
                Spacer()
                    .frame(width: 10)
                
                Text("Days")
                    .bold()
                    .font(.system(size: 14))
                
                
                Spacer()
                    
                
                Text("\(viewModel.accepted ? viewModel.currentDay : 0 )/3")
                   
                    .font(.system(size: 12))
                    .font(.system(size: 10))
                Spacer()
                    .frame(width: 10)
            }
           
            Spacer()
                .frame(height: 15)
            
            dashedProgressView(width: 100, height: 100, totalPercent: 8, completedPercent: day, lineWidth: 3, format: "%.0f %", dashWidth: 10, dashHeight: 5)
                
            
        }
        .frame(width: 145 , height: 155)
        .background(LinearGradient(colors: [Color(uiColor: .progres), Color(.progresColor1)], startPoint: .top, endPoint: .bottom))
        .cornerRadius(10)
        .shadow(color: .init(uiColor: .acceptButton), radius: 3)

    }
    
    var progressView2: some View {
        let percent: Double =  viewModel.nextMonthExercises.count != 0 ?  Double(viewModel.nextMonthExercises.count) / Double(viewModel.monthExerciseCount) * 100 : 0.0 * 3
      
        return VStack{
            HStack{
                Spacer()
                    .frame(width: 10)
                
                Text("Execises")
                    .bold()
                    .tint(.yellow)
                    .font(.system(size: 14))
                
                Spacer()
                
                Text("\(viewModel.nextMonthExercises.count)/\(viewModel.monthExerciseCount)")
                    
                    .font(.system(size: 10))
                Spacer()
                    .frame(width: 10)
            }
            
            Spacer()
                .frame(height: 15)
           
            ProgressBar(width: 100, height: 100, totalPercent: 100, completedPercent: percent)
                
            
        }
        .frame(width: 145 , height: 155)
        .background(LinearGradient(colors: [Color(.progres), Color(.progresColor1)], startPoint: .top, endPoint: .bottom))
        .cornerRadius(10)
        .shadow(color: .init(uiColor: .acceptButton), radius: 3)
    }
}

#Preview {
    TrainingInfo(viewModel: PlaningViewModel())
}

