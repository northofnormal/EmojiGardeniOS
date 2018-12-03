//
//  Theme.swift
//  emojigardenios
//
//  Created by Anne Cahalan on 9/6/18.
//  Copyright © 2018 Anne Cahalan. All rights reserved.
//

import Foundation
import UIKit

struct Theme {
    
    var title: String
    
    var contextArray: [String]
    var friendsArray: [String]
    var flairArray: [String]

    var backgroundColor: UIColor
    
    init(title: String, context: [String], friends: [String], flair: [String], backgroundColor: UIColor) {
        self.title = title
        self.contextArray = context
        self.friendsArray = friends
        self.flairArray = flair
        self.backgroundColor = backgroundColor
    }
    
}

extension Theme: Equatable { }


let forrestTheme = Theme(title: "Forrest Theme", context: ["🌲", "🌳", "🍂", "🌿"], friends: ["🦔", "🦉", "🐍", "🐿"], flair: ["🌱", "🌰", "🐛", "☘️"], backgroundColor: UIColor(red: 17/255, green: 102/255, blue: 38/255, alpha: 1.0))

let seaTheme = Theme(title: "Sea Theme", context: ["🌊"], friends: ["🐙", "🐡", "🐳", "🐬"], flair: ["🦐", "🐚", "🍾", "⚓️"], backgroundColor: UIColor(red: 25/255, green: 130/255, blue: 196/255, alpha: 1.0))

let spaceTheme = Theme(title: "Space Theme", context: ["🌕", "🌎", "🌌", "🌌"], friends: ["👾", "👽", "👩🏻‍🚀", "👩🏾‍🚀"], flair: ["🚀", "🛰", "🛸", "🥪"], backgroundColor: UIColor(red: 53/255, green: 30/255, blue: 41/255, alpha: 1.0))
