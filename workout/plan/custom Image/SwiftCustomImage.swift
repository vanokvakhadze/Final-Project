//
//  SwiftCustomImage.swift
//  workout
//
//  Created by vano Kvakhadze on 19.07.24.
//

import SwiftUI

struct SwiftCustomImage: View {
 
        var systemName: String
        var width: CGFloat
        var height: CGFloat
        var CustomColor: Color
        var body: some View {
            Image(systemName: systemName)
                .resizable()
                .frame(width: width, height: height)
                .scaledToFill()
                .foregroundColor(CustomColor)
            
        }
    

}

