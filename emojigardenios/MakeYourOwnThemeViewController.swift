//
//  MakeYourOwnThemeViewController.swift
//  emojigardenios
//
//  Created by Anne Cahalan on 9/11/18.
//  Copyright © 2018 Anne Cahalan. All rights reserved.
//

import UIKit

class MakeYourOwnThemeViewController: UIViewController {
    
    @IBOutlet var contextField: UITextField!
    @IBOutlet var friendsField: UITextField!
    @IBOutlet var flairField: UITextField!
    
    var userGeneratedTheme: Theme?

    @IBAction func goBackButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func generateSceneButtonPressed() {
        let contextArray = convertToArray(contextField.text)
        let friendsArray = convertToArray(friendsField.text)
        let flairArray = convertToArray(flairField.text)
        
        userGeneratedTheme = Theme(context: contextArray, friends: friendsArray, flair: flairArray, backgroundColor: <#T##UIColor#>)
    }
    
    private func convertToArray(_ string: String?) -> [String] {
        guard let newArray = string?.components(separatedBy: ",") else {
            return [""]
        }
        
        return newArray
    }
    
    // dismiss keyboard
    // set up background color ui

}
