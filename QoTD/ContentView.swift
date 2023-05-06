//
//  ContentView.swift
//  QoTD
//
//  Created by MacBook Pro on 06/05/23.
//

import SwiftUI

struct ContentView: View {
    // Declare @State property wrappers to store the facts array, currentFact, showSuccessAlert, and backgroundColor
    @State private var facts:[String] = []
    @State private var currentFact: String = ""
    @State private var showSuccessAlert = false
    @State private var backgroundColor =  Color(UIColor(red: 1.0, green: 0.41, blue: 0.38, alpha: 1.0))
    var body: some View {
        GeometryReader { reader in
            VStack {
                // Display a text with a headline font
                Text("Boost Your Day with Quotivate!")
                    .font(.headline)
                // Render a quoteCard with the currentFact and backgroundColor bindings
                quoteCard(fact: $currentFact, backgroundColor: $backgroundColor)
                    .frame(width: reader.size.width - 40, height: reader.size.height/2)
                    .padding([.horizontal,.vertical],20)
                // Render a color picker with the backgroundColor binding
                HStack {
                    bg(selectedColor: $backgroundColor)
                }
                .background(.thinMaterial)
                .cornerRadius(20)
                .padding(.horizontal)
                // Display an icon button with the text "Next Quote"
                HStack(spacing:10){
                    icon(icon: "arrowshape.turn.up.right.circle", text: "Next Quote", position: .trailing) {
                        updateQuotes()
                    }
                }
                .padding()
            } .onAppear {
                // Call loadFacts() and updateQuotes() when the view appears
                loadFacts()
                updateQuotes()
            }
        }
    }
    
    // Function to randomly select a fact from the facts array and set it to the currentFact variable
    private func updateQuotes() {
        self.currentFact = self.facts.randomElement() ?? "No Quotes for today"
    }
    
    // Function to load quotes from the facts.json file
    private func loadFacts(){
        if let url = Bundle.main.url(forResource: "facts", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonFacts = try decoder.decode([String].self, from: data)
                self.facts = jsonFacts
            } catch {
                print("Error in loading quotes: \(error)")
            }
        }
    }
}

// Preview struct for ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
