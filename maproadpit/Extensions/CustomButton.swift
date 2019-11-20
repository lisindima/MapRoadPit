//
//  CustomButton.swift
//  maproadpit
//
//  Created by Дмитрий Лисин on 20.11.2019.
//  Copyright © 2019 Дмитрий Лисин. All rights reserved.
//

import SwiftUI

struct CustomButton : View {
    var label: String
    var action: () -> Void
    var loading: Bool = false
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(label)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }
        .padding()
        .background(Color.blue)
        .cornerRadius(8)
    }
}
