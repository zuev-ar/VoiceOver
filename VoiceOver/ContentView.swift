//
//  ContentView.swift
//  VoiceOver
//
//  Created by Arkasha Zuev on 21.07.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedPicture = Int.random(in: 0...3)
    @State private var estimate = 25.0
    @State private var rating = 3
    
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let lables = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    var body: some View {
        Slider(value: $estimate, in: 0...50)
            .padding()
            .accessibility(value: Text("\(estimate)"))
        
        Stepper("Rate our service: \(rating)/5", value: $rating, in: 1...5)
            .accessibility(value: Text("\(rating) out of 5"))
        
        Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                self.selectedPicture = Int.random(in: 0...3)
            }
            .accessibility(label: Text(lables[selectedPicture]))
            .accessibility(addTraits: .isButton)
            .accessibility(removeTraits: .isImage)
        
        Image(decorative: "character")
            .accessibility(hidden: true)
        
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibility(label: Text("Your score is 1000"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
