//
//  ViewController.swift
//  emojigardenios
//
//  Created by Anne Cahalan on 9/5/18.
//  Copyright © 2018 Anne Cahalan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var displayLabel: UILabel!
    
    let randomizer = Randomizer()
    
    var theme: Theme?
    var numberOfRows = 4
    var lengthOfRows = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = theme?.backgroundColor
        generateScene()
    }
    
    func generateScene() {
        guard let selectedTheme = theme else { return }
        let componentsArray = [selectedTheme.contextArray, selectedTheme.friendsArray, selectedTheme.snacksArray]
        
        var generatedThing: [String] = Array()
        
        for i in 1...numberOfRows {
            // do something in here to generate the string with breaks? 
            let string = randomizer.generateComponentRow(componentArrays: componentsArray)
            generatedThing.append(string)
        }
        
//        let string1 = randomizer.generateComponentRow(componentArrays: componentsArray)
//        let string2 = randomizer.generateComponentRow(componentArrays: componentsArray)
//        let string3 = randomizer.generateComponentRow(componentArrays: componentsArray)
//        let string4 = randomizer.generateComponentRow(componentArrays: componentsArray)
        
//        let generatedScene =  "\(string1) \n\(string2) \n\(string3) \n\(string4)"
        
        
        
        displayLabel.text = "\(generatedThing)"
        displayLabel.font = UIFont.boldSystemFont(ofSize: 50)
    }
    
    @IBAction func tryAgainButtonPressed() {
        dismiss(animated: true)
    }

}

// customize height & width of the display
// create-your-own themes

