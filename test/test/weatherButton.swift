//
//  weatherButton.swift
//  test
//
//  Created by Yugandhar Khair on 9/23/23.
//

import SwiftUI

struct weatherButtonView: View {
    
    var buttonText: String
    var foregroundColor: Color
    var bavkgroundColor: Color
    
    var body: some View {
        Text(buttonText)
            .frame(width: 280, height: 50)
            .background(bavkgroundColor)
            .foregroundColor(foregroundColor)
            .font(.system(size: 20, weight: .bold, design: .default ))
            .cornerRadius(10)
    }
}

