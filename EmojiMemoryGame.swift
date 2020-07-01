//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Bui Minh Khoi on 6/25/20.
//  Copyright © 2020 Bui Minh Khoi. All rights reserved.
//

import SwiftUI
//func createCardContent(pairIndex: Int) -> String {
//return "🍎"
//}

class EmojiMemoryGame: ObservableObject{
    @Published private var model:MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String>{
        let emojis = ["🍎","🍏","🍓"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
  
    //MARK - Access to the Model
    var cards : Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose (card: MemoryGame<String>.Card){
//        objectWillChange.send()
        model.choose(card: card)
    }
}
