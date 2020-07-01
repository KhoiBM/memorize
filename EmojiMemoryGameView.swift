//
//  ContentView.swift
//  Memorize
//
//  Created by Bui Minh Khoi on 6/24/20.
//  Copyright © 2020 Bui Minh Khoi. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        HStack(){
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }.aspectRatio(2/3, contentMode:.fit)
            }
        }
 
//            .padding([.horizontal],100)
            .padding()
//            .foregroundColor(.clear)
           
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
      static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}
struct CardView: View {
    var card : MemoryGame<String>.Card
    
    var body: some View{
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body (for  size:  CGSize)  -> some View  {
        ZStack {
            if card.isFaceUp {
                
//                LinearGradient(
//                    gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
//                    startPoint: .init(x: 0, y: 0),
//                    endPoint: .init(x: 0, y: 0.6)
//                ).mask(RoundedRectangle(cornerRadius: cornerRadio).fill(Color.white))
               RoundedRectangle(cornerRadius: cornerRadio).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadio).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            }else{
                RoundedRectangle(cornerRadius: cornerRadio).fill(LinearGradient(
                    gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                    startPoint: .init(x: 0, y: 0),
                    endPoint: .init(x: 0, y: 0.6)
                ))
            }
        }
        .font(Font.system(size: fontSize(for: size)))
//        .foregroundColor(.black)
      
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    // MARK: - Drawing Constants
    let  cornerRadio: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) *  fontScaleFactor
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
