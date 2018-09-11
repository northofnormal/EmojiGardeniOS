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
    var numberOfRows = 3
    var lengthOfRows = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = theme?.backgroundColor
        generateScene()
    }
    
    func generateScene() {
        guard let selectedTheme = theme else { return }
        let componentsArray = [selectedTheme.contextArray, selectedTheme.friendsArray, selectedTheme.snacksArray]
        
        var generatedThing: [String] = Array()
        
        for _ in 1...numberOfRows {
            let string = randomizer.generateComponentRow(componentArrays: componentsArray, length: lengthOfRows)
            generatedThing.append(string)
        }
        
        displayLabel.text = generatedThing[0]
        
        for i in 1...generatedThing.count - 1 {
            let displayText = generatedThing[i]
            
            let labelHeight = Int(displayLabel.frame.size.height)
            let calculatedY = Int(displayLabel.frame.maxY) + (labelHeight * (i - 1))
            
            let newLabel = createANewLabelAt(y: calculatedY)
            newLabel.text = displayText
            
            view.addSubview(newLabel)
        }
    }
    
    @IBAction func tryAgainButtonPressed() {
        dismiss(animated: true)
    }
    
    func createANewLabelAt(y: Int) -> UILabel {
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
    
    func addALabel(under label: UILabel) -> UILabel {
        let rect = CGRect(x: label.frame.origin.x, y: label.frame.origin.y + label.frame.height, width: view.frame.size.width - 40, height: label.frame.height)
        
        let newLabel = UILabel(frame: rect)
        newLabel.font = UIFont.systemFont(ofSize: 50.0)
        newLabel.numberOfLines = 1
        newLabel.minimumScaleFactor = 0.25
        newLabel.textAlignment = .center
        newLabel.lineBreakMode = .byCharWrapping
        newLabel.adjustsFontSizeToFitWidth = true
        
        return newLabel
    }

}



// customize height & width of the display
// create-your-own themes

