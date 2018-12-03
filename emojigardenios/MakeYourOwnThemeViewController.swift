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
    @IBOutlet var numberOfRowsLabel: UILabel!
    @IBOutlet var numberOfColumnsLabel: UILabel!
    @IBOutlet var numberOfRowsStepper: UIStepper!
    @IBOutlet var numberOfColumnsStepper: UIStepper!
    
    var userGeneratedTheme: Theme?
    var selectedColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorPickerView.delegate = self
        colorPickerView.layoutDelegate = self
        contextField.delegate = self
        friendsField.delegate = self
        flairField.delegate = self
        
        setDefaultValues()
    }
    
    private func setDefaultValues() {
        numberOfColumnsLabel.text = "4"
        numberOfColumnsStepper.value = 4
        
        numberOfRowsLabel.text = "4"
        numberOfRowsStepper.value = 4
    }

    @IBAction func goBackButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func generateSceneButtonPressed(sender: UIButton) {
        let contextArray = convertToArray(contextField.text)
        let friendsArray = convertToArray(friendsField.text)
        let flairArray = convertToArray(flairField.text)
        
        userGeneratedTheme = Theme(title: "Generated Theme", context: contextArray, friends: friendsArray, flair: flairArray, backgroundColor: selectedColor ?? UIColor.white)
        
        performSegue(withIdentifier: "GenerateCustomSceneSegue", sender: sender)
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
    
    private func convertToArray(_ string: String?) -> [String] {
        guard let stringToSeparate = string else {
            return [""]
        }
        
        var newArray: [String] = []
        
        stringToSeparate.forEach { character in
            newArray.append("\(character)")
        }
        
        return newArray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? GeneratedSceneViewController
        
        destination?.theme = userGeneratedTheme
        destination?.numberOfRows = Int(numberOfRowsStepper.value)
        destination?.numberOfColumns = Int(numberOfColumnsStepper.value)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

extension MakeYourOwnThemeViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let disallowedSet = NSCharacterSet.symbols.inverted
        let filtered = string.components(separatedBy: disallowedSet).joined()
        
        return string == filtered
    }
    
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
