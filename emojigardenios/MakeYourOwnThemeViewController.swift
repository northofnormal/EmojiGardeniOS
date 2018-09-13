//
//  MakeYourOwnThemeViewController.swift
//  emojigardenios
//
//  Created by Anne Cahalan on 9/11/18.
//  Copyright © 2018 Anne Cahalan. All rights reserved.
//

import IGColorPicker
import UIKit

class MakeYourOwnThemeViewController: UIViewController {
    
    @IBOutlet var contextField: UITextField!
    @IBOutlet var friendsField: UITextField!
    @IBOutlet var flairField: UITextField!
    @IBOutlet var colorPickerView: ColorPickerView!
    
    var userGeneratedTheme: Theme?
    var selectedColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorPickerView.delegate = self
        colorPickerView.layoutDelegate = self
    }

    @IBAction func goBackButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func generateSceneButtonPressed() {
        let contextArray = convertToArray(contextField.text)
        let friendsArray = convertToArray(friendsField.text)
        let flairArray = convertToArray(flairField.text)
        
        userGeneratedTheme = Theme(context: contextArray, friends: friendsArray, flair: flairArray, backgroundColor: selectedColor ?? UIColor.white)
    }
    
    private func convertToArray(_ string: String?) -> [String] {
        guard let newArray = string?.components(separatedBy: ",") else {
            return [""]
        }
        
        return newArray
    }
    
    // restrict keyboard and/or entry to emoji
    // dismiss keyboard
    // set up rows/columns UI
    // set up rows/columns logic

}

extension MakeYourOwnThemeViewController: ColorPickerViewDelegate {
    
    func colorPickerView(_ colorPickerView: ColorPickerView, didSelectItemAt indexPath: IndexPath) {
        selectedColor = colorPickerView.colors[indexPath.item]
        view.backgroundColor = selectedColor
    }

}

extension MakeYourOwnThemeViewController: ColorPickerViewDelegateFlowLayout {
    
    func colorPickerView(_ colorPickerView: ColorPickerView, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: 40)
    }
    
    func colorPickerView(_ colorPickerView: ColorPickerView, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func colorPickerView(_ colorPickerView: ColorPickerView, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func colorPickerView(_ colorPickerView: ColorPickerView, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}