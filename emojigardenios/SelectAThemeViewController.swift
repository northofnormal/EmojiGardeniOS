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
    
    @IBAction func themeButtonPressed(sender: UIButton) {
        performSegue(withIdentifier: "MakeSomeArt", sender: sender)
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
