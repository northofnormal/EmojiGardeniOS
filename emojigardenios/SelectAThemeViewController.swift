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
    @IBOutlet var makeYourOwnButton: UIButton!
    
    @IBOutlet var numberOfRowsLabel: UILabel!
    @IBOutlet var numberOfColumnsLabel: UILabel!
    @IBOutlet var numberOfRowsStepper: UIStepper!
    @IBOutlet var numberOfColumnsStepper: UIStepper!
    
    @IBAction func themeButtonPressed(sender: UIButton) {
        switch sender {
        case forrestThemeButton, seaThemeButton, spaceThemeButton:
            performSegue(withIdentifier: "MakeSomeArt", sender: sender)
        case makeYourOwnButton:
            performSegue(withIdentifier: "MakeYourOwnThemeSegue", sender: sender)
        default:
            print("Unknown button pressed")
        }
        
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
        guard let senderButton = sender as? UIButton else { return }
        
        switch senderButton {
        case forrestThemeButton, seaThemeButton, spaceThemeButton:
            prepareForThemedSegue(segue: segue, sender: senderButton)
        case makeYourOwnButton:
            print("Making my own theme!")
        default:
            print("Unknown button trying to segue")
        }
    }
    
    private func prepareForThemedSegue(segue: UIStoryboardSegue, sender: UIButton) {
        let destination = segue.destination as? ViewController

        if segue.identifier == "MakeSomeArt" {
            destination?.numberOfRows = Int(numberOfRowsStepper.value)
            destination?.numberOfColumns = Int(numberOfColumnsStepper.value)
            
            switch sender {
            case forrestThemeButton:
                destination?.theme = forrestTheme
            case seaThemeButton:
                destination?.theme = seaTheme
            case spaceThemeButton:
                destination?.theme = spaceTheme
            default:
                print("unrecognized button selected")
            }
        }
    }
}
