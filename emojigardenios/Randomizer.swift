//
//  Randomizer.swift
//  emojigardenios
//
//  Created by Anne Cahalan on 9/6/18.
//  Copyright © 2018 Anne Cahalan. All rights reserved.
//

import Foundation

class Randomizer {
    
    func generateComponentRow(componentArrays: [[String]], length: Int) -> String  {
        let generatedRow = generateARow(componentArrays: componentArrays, length: length)
        let generatedRowItems = generateRowItems(array: generatedRow, length: length)
        
        let generatedString = generatedRowItems.joined(separator: " ")
        
        return generatedString
    }
    
    
    private func generateARow(componentArrays: [[String]], length: Int) -> [[String]] {

        var newArray: [[String]] = Array()
        
        for _ in 1...length {
            newArray.append(componentArrays.randomElement()!)
        }
        
        return newArray
    }
    
    private func generateRowItems(array: [[String]], length: Int) -> [String] {
        var itemsArray: [String] = Array()
        
        for _ in 1...length {
            let itemCategory = array.randomElement()!
            itemsArray.append(itemCategory.randomElement()!)
        }
        
        return itemsArray
    }
}
