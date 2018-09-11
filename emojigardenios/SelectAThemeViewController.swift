//
//  SelectAThemeViewController.swift
//  emojigardenios
//
//  Created by Anne Cahalan on 9/6/18.
//  Copyright © 2018 Anne Cahalan. All rights reserved.
//

import UIKit

class SelectAThemeViewController: UIViewController {
    
    @IBOutlet var forrestThemeButton: UIButton!
    @IBOutlet var seaThemeButton: UIButton!
    @IBOutlet var spaceThemeButton: UIButton!
    
    @IBOutlet var numberOfRowsLabel: UILabel!
    @IBOutlet var numberOfColumnsLabel: UILabel!
    @IBOutlet var numberOfRowsStepper: UIStepper!
    @IBOutlet var numberOfColumnsStepper: UIStepper!
    
    @IBAction func themeButtonPressed(sender: UIButton) {
        performSegue(withIdentifier: "MakeSomeArt", sender: sender)
    }
    
    @IBAction func stepperValueChanged(sender: UIStepper) {
        switch sender {
        case numberOfRowsStepper:
            let value = Int(numberOfRowsStepper.value)
            numberOfRowsLabel.text = "\(value)"
        case numberOfColumnsStepper:
            let value = Int(numberOfColumnsStepper.value)
            numberOfColumnsLabel.text = "\(value)"
        default:
            print("Unknown stepper sending values?")
        }
    }
    
    override func viewDidLoad() {
        setDefaultValues()
    }
    
    private func setDefaultValues() {
        numberOfColumnsLabel.text = "4"
        numberOfColumnsStepper.value = 4
        
        numberOfRowsLabel.text = "4"
        numberOfRowsStepper.value = 4
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ViewController
        let senderButton = sender as? UIButton
        
        switch senderButton {
        case forrestThemeButton:
            destination?.theme = .forrestTheme
        case seaThemeButton:
            destination?.theme = .seaTheme
        case spaceThemeButton:
            destination?.theme = .spaceTheme
        default:
            print("unrecognized button selected")
        }
    }

}
