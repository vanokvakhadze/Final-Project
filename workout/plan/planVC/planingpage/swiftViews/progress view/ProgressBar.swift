//
//  ProgressBar.swift
//  workout
//
//  Created by vano Kvakhadze on 16.07.24.
//

import SwiftUI

struct ProgressBar: View {
    var width: CGFloat = 100
    var height: CGFloat = 100
    var totalPercent: CGFloat = 100
    var completedPercent: CGFloat = 5
    
    @State private var animatedPercent: CGFloat = 0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10)
                .opacity(0.3)
                .foregroundColor(.white)
            
            Circle()
                .trim(from: 0.0, to: completedPercent / totalPercent)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .foregroundColor(.progresbackGround)
                .rotationEffect(Angle(degrees: 270))
                .animation(.linear(duration: 1.0), value: completedPercent)
            
            Text(String(format: "%.0f %%", min(completedPercent, totalPercent)))
                .font(.system(size: 12))
        }
        .frame(width: width, height: height)
        
    }
}


