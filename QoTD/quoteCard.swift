//
//  quoteCard.swift
//  QoTD
//
//  Created by MacBook Pro on 06/05/23.
//

import SwiftUI

struct quoteCard: View {
    @Binding var fact:String
    @Binding var backgroundColor: Color
    @State private var isColorPickerShown = false
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(backgroundColor)
            VStack(alignment: .leading) {
                Text(fact)
                    .font(.headline)
                    .foregroundColor(backgroundColor == .black ? .white : .black)
                    .padding()
            }
        }
        .onLongPressGesture {
            self.isColorPickerShown.toggle()
        }
        .sheet(isPresented: $isColorPickerShown) {
            ColorPicker("Select a background color", selection: self.$backgroundColor)
                .onDisappear {
                    self.isColorPickerShown = false
                }
        }
    }
}
