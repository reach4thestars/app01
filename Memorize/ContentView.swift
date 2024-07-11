//
//  ContentView.swift
//  Memorize
//
//  Created by lluu on 7/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()

        }
            .foregroundColor(.orange)
            .padding()
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        if isFaceUp {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            }
        }
        else {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.orange)
        }
        
    }
}
