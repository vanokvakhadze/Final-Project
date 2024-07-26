//
//  dashedProgressView.swift
//  workout
//
//  Created by vano Kvakhadze on 20.07.24.
//

import SwiftUI

struct dashedProgressView: View {
    var width: CGFloat = 100
    var height: CGFloat = 100
    var totalPercent: CGFloat = 100
    var completedPercent: CGFloat = 25
    var lineWidth: CGFloat = 10
    var format: String = "%.0f %%"
    var dashWidth: CGFloat = 10
    var dashHeight: CGFloat = 5
    
    @State private var animatedPercent: CGFloat = 0
    
    var body: some View {
        ZStack{
            ZStack {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, dash:  [dashWidth,dashHeight]))
                    .foregroundColor(.white)
                
                Circle()
                    .trim(from: 0.0, to: completedPercent / totalPercent)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, dash: [dashWidth,dashHeight]))
                    .foregroundColor(Color(.progresbackGround))
                    .animation(.linear(duration: 1.0), value: completedPercent)
                
            }
            .rotationEffect(.degrees(-90))
            .frame(width: width, height: height)
            
            Text(String(format: format, min(completedPercent, totalPercent)))
                .font(.system(size: 12))
        }
        
        
    }
}

#Preview {
    dashedProgressView()
}
