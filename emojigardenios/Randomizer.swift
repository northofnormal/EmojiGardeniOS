//
//  Randomizer.swift
//  emojigardenios
//
//  Created by Anne Cahalan on 9/6/18.
//  Copyright © 2018 Anne Cahalan. All rights reserved.
//

import Foundation

class Randomizer {
    
    func generateComponentRow(componentArrays: [[String]]) -> String  {
        let generatedRow = generateARow(componentArrays: componentArrays)
        let generatedRowItems = generateRowItems(array: generatedRow)
        
        let generatedString = generatedRowItems.joined(separator: " ")
        
        return generatedString
    }
    
    
    private func generateARow(componentArrays: [[String]]) -> [[String]] {

        var newArray: [[String]] = Array()
        
        for _ in 1...4 {
            newArray.append(componentArrays.randomElement()!)
        }
        
        return newArray
    }
    
    private func generateRowItems(array: [[String]]) -> [String] {
        var itemsArray: [String] = Array()
        
        for _ in 1...4 {
            let itemCategory = array.randomElement()!
            itemsArray.append(itemCategory.randomElement()!)
        }
        
        return itemsArray
    }
}
