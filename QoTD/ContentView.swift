//
//  ContentView.swift
//  QoTD
//
//  Created by MacBook Pro on 06/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var facts:[String] = []
    @State private var currentFact: String = ""
    @State private var showSuccessAlert = false
    @State private var backgroundColor = Color.blue
    var body: some View {
        GeometryReader { reader in
            VStack {
                Text("Boost Your Day, Today!")
                    .font(.headline)
                quoteCard(fact: $currentFact, backgroundColor: $backgroundColor)
                    .frame(width: reader.size.width - 40, height: reader.size.height/2)
                    .padding([.horizontal,.vertical],20)
                HStack {
                    bg(selectedColor: $backgroundColor)
                }
                .background(.thinMaterial)
                .cornerRadius(20)
                .padding(.horizontal)
                HStack(spacing:10){
                    icon(icon: "arrowshape.turn.up.right.circle", text: "Next", position: .trailing) {
                        updateQuotes()
                    }
                }
                .padding()


            } .onAppear {
                loadFacts()
                updateQuotes()
            }
        }
    }
    
    private func updateQuotes() {
        self.currentFact = self.facts.randomElement() ?? "No Quotes for today"
    }
    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
