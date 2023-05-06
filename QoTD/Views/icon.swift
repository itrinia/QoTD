//
//  icon.swift
//  QoTD
//
//  Created by MacBook Pro on 06/05/23.
//

import SwiftUI

enum IconPosition {
    case leading, trailing
}

struct icon: View {
    var icon: String
    var text: String
    var position: IconPosition
    var foregroundColor: Color = .white
    var action: () -> Void
    
    let pastelPink = Color(UIColor(red: 0.529, green: 0.808, blue: 0.922, alpha: 1.0))
    
    var backgroundColor: Color {
        pastelPink
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if position == .leading {
                    Image(systemName: icon)
                        .font(.title)
                        .foregroundColor(foregroundColor)
                    Text(text)
                        .font(.headline)
                        .foregroundColor(foregroundColor)
                } else {
                    Text(text)
                        .font(.headline)
                        .foregroundColor(foregroundColor)
                    Image(systemName: icon)
                        .font(.title)
                        .foregroundColor(foregroundColor)
                }
            }
        }
        .padding(10)
        .background(backgroundColor)
        .cornerRadius(8)
        
    }
}

struct icon_Previews: PreviewProvider {
    static var previews: some View {
        icon(icon: "pencil", text: "Edit", position: .leading) {
            print("Button Tapped")
        }
    }
}
