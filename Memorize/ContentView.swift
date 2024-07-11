//
//  ContentView.swift
//  Memorize
//
//  Created by lluu on 7/12/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻","🕷️","🎃","🐝","👻","🕷️","🎃","🐝" ,"👻","🕷️","🎃","🐝","👻","🕷️","🎃","🐝"  ]
    @State var cardCount = 6
    var body: some View {
        
        VStack {
            cards
            Spacer()
            cardCountAdjuster
        }
        .padding()
        
    }
    
    var cards: some View {
        //MARK: Cards
        ScrollView {
            LazyVGrid(columns:[GridItem(.adaptive(minimum: 100))]) {
                ForEach(0..<cardCount, id:\.self) { index in
                    CardView(content: emojis[index])
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
        
        .foregroundColor(.orange)
    }
    
    var cardCountAdjuster: some View {
        HStack {
            // Remove Card
            cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
            Spacer()
            //Add Card
            cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")

        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        },label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.stroke(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1:0)
    
            base.fill()
                .opacity(isFaceUp ? 0:1)
            
        }
        .onTapGesture {
            print("Tapped")
            isFaceUp.toggle()
        }
    }
}
