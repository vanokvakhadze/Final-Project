//
//  SplashScreen.swift
//  workout
//
//  Created by vano Kvakhadze on 26.07.24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            EmptyView()
        }else {
            
            VStack{
                VStack{
                    Image(.logo4)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .cornerRadius(100)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.6)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    self.isActive = true
                    
                }
            }
        }
    }
}
