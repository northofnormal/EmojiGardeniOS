//
//  GeneratedSceneViewController.swift
//  emojigardenios
//
//  Created by Anne Cahalan on 9/5/18.
//  Copyright © 2018 Anne Cahalan. All rights reserved.
//

import UIKit

class GeneratedSceneViewController: UIViewController {
    
    @IBOutlet var displayLabel: UILabel!
    
    let randomizer = Randomizer()
    
    var theme: Theme?
    var numberOfRows = 4
    var numberOfColumns = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = theme?.backgroundColor
        generateScene()
    }
    
    func generateScene() {
        guard let selectedTheme = theme else { return }
        let componentsArray = [selectedTheme.contextArray, selectedTheme.friendsArray, selectedTheme.flairArray]
        
        let generatedSceneCollection = randomizeSceneCollection(components: componentsArray)
        
        displayLabel.text = generatedSceneCollection[0]
        
        for i in 1...generatedSceneCollection.count - 1 {
            let displayText = generatedSceneCollection[i]
            
            let labelHeight = Int(displayLabel.frame.size.height)
            let calculatedY = Int(displayLabel.frame.maxY) + (labelHeight * (i - 1))
            
            let newLabel = createANewLabelAt(y: calculatedY)
            newLabel.text = displayText
            
            view.addSubview(newLabel)
        }
    }
    
    private func randomizeSceneCollection(components: [[String]]) -> [String] {
        var randomizedCollection: [String] = Array()
        
        for _ in 1...numberOfRows {
            let string = randomizer.generateComponentRow(componentArrays: components, length: numberOfColumns)
            randomizedCollection.append(string)
        }
        
        return randomizedCollection
    }
    
    private func createANewLabelAt(y: Int) -> UILabel {
        let rect = CGRect(x: displayLabel.frame.origin.x, y: CGFloat(y), width: view.frame.size.width - 40, height: displayLabel.frame.size.height)
        
        let newLabel = UILabel(frame: rect)
        newLabel.font = UIFont.systemFont(ofSize: 50.0)
        newLabel.numberOfLines = 1
        newLabel.minimumScaleFactor = 0.25
        newLabel.textAlignment = .center
        newLabel.lineBreakMode = .byCharWrapping
        newLabel.adjustsFontSizeToFitWidth = true
        
        return newLabel
    }
    
    @IBAction func tryAgainButtonPressed() {
        dismiss(animated: true)
    }
}

// screenshot and post to twitter? or post it raw, there's under the limit 
// maybe embed in a view so it can be centered?
// rethink navigation? 
// save your own themes, persistance
// perlin noise to weight the context array?
