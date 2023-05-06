//
//  bg.swift
//  QoTD
//
//  Created by MacBook Pro on 06/05/23.
//

import SwiftUI

struct bg: View {
    // A binding variable to hold the selected color
    @Binding var selectedColor: Color
    // An array of preset colors
    private let colors: [Color] = [
        Color(UIColor(red: 1.0, green: 0.41, blue: 0.38, alpha: 1.0)), // pastel red
        Color(UIColor(red: 0.99, green: 0.99, blue: 0.59, alpha: 1.0)), //pastel yellow
        Color(UIColor(red: 0.98, green: 0.78, blue: 0.6, alpha: 1.0)), // pastel orange
        Color(UIColor(red: 0.980, green: 0.855, blue: 0.886, alpha: 1.0)), //pastel pink
        Color(UIColor(red: 0.53, green: 0.81, blue: 0.92, alpha: 1.0)), // pastel blue
        Color(UIColor(red: 0.76, green: 0.69, blue: 0.88, alpha: 1.0)), // pastel purple
        Color(UIColor(red: 0.525, green: 0.525, blue: 0.686, alpha: 1.0)), // indigo
        Color(UIColor(red: 0.47, green: 0.87, blue: 0.47, alpha: 1.0)), // pastel green
        Color(UIColor(red: 0.24, green: 0.71, blue: 0.54, alpha: 1.0)), // pastel mint
        Color(UIColor(red: 0.855, green: 0.722, blue: 0.580, alpha: 1.0)) //pastel brown
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                // A loop to iterate through the color array
                ForEach(colors, id:\.self) { color in
                    Circle()
                        .foregroundColor(color)
                        .frame(width: 45, height: 45)
                        .opacity(color == selectedColor ? 0.5 : 1.0)
                        .scaleEffect(color == selectedColor ? 1.2 : 1.0)
                        .onTapGesture {
                            // Update the selected color binding variable
                            selectedColor = color
                        }
                }
            }
            .padding()
        }
    }
}

struct bg_Previews: PreviewProvider {
    static var previews: some View {
        bg(selectedColor: .constant(Color(UIColor(red: 1.0, green: 0.41, blue: 0.38, alpha: 1.0))))
    }
}
