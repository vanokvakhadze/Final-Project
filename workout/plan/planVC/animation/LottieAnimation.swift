//
//  LottieAnimation.swift
//  workout
//
//  Created by vano Kvakhadze on 26.07.24.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    var url: URL
    var completion: () -> Void
    
    func makeUIView(context: Context) ->  UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView()
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        
        LottieAnimation.loadedFrom(url: url) {  animation in
            let animationDuration = animation!.duration
            let desiredDuration: TimeInterval = 2.5
            let speedMultiplier = animationDuration / desiredDuration
            animationView.animationSpeed = speedMultiplier
            animationView.animation = animation
            animationView.play() { (finished) in
                if finished {
                    animationView.removeFromSuperview()
                    completion()
                }
            }
            
        }
        
        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        return view
        
    }
    
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
}

//#Preview {
//    LottieAnimation()
//}
