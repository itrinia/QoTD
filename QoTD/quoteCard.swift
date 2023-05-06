//
//  quoteCard.swift
//  QoTD
//
//  Created by MacBook Pro on 06/05/23.
//

import SwiftUI

struct quoteCard: View {
    @Binding var fact:String // A binding property that stores the text to be displayed in the quote card
    @Binding var backgroundColor: Color // A binding property that stores the background color of the quote card
    @State private var isColorPickerShown = false // A state property that determines whether the color picker sheet should be shown
    var body: some View {
        ZStack{ // A container that overlays its child views, in this case a RoundedRectangle and a VStack
            RoundedRectangle(cornerRadius: 10) // A shape view that draws a rounded rectangle
                .foregroundColor(backgroundColor) // Set the color of the rounded rectangle
            VStack(alignment: .leading) { // A container that stacks views vertically
                Text(fact) // A text view that displays the quote
                    .font(.headline) // Set the font of the text view
                    .foregroundColor(backgroundColor == .black ? .white : .black) // Set the text color of the text view based on the background color
                    .padding() // Add padding to the text view
            }
        }
        .onLongPressGesture { // Add a gesture recognizer to the ZStack that triggers when the user long presses on the quote card
            self.isColorPickerShown.toggle() // Toggle the state property to show/hide the color picker sheet
        }
        .sheet(isPresented: $isColorPickerShown) { // Present a sheet when the isColorPickerShown state property is true
            ColorPicker("Select a background color", selection: self.$backgroundColor) // A color picker view that allows the user to select a new background color for the quote card
                .onDisappear { // A closure that is executed when the color picker sheet is dismissed
                    self.isColorPickerShown = false // Set the isColorPickerShown state property to false to hide the color picker sheet
                }
        }
    }
}

