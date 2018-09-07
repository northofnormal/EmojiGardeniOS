//
//  Theme.swift
//  emojigardenios
//
//  Created by Anne Cahalan on 9/6/18.
//  Copyright © 2018 Anne Cahalan. All rights reserved.
//

import Foundation
import UIKit

enum Theme {
    case forrestTheme
    case seaTheme
    case spaceTheme
    
    var contextArray: [String] {
        switch self {
        case .forrestTheme:
            return ["🌲", "🌳", "🍂", "🌿"]
        case .seaTheme:
            return ["🌊"]
        case .spaceTheme:
            return ["🌕", "🌎", "🌌", "🌌"]
        }
    }
    
    var friendsArray: [String] {
        switch self {
        case .forrestTheme:
            return ["🦔", "🦉", "🐍", "🐿"]
        case .seaTheme:
            return ["🐙", "🐡", "🐳", "🐬"]
        case .spaceTheme:
            return ["👾", "👽", "👩🏻‍🚀", "👩🏾‍🚀"]
        }
    }
    
    var snacksArray: [String] {
        switch self {
        case .forrestTheme:
            return ["🌱", "🌰", "🐛", "☘️"]
        case .seaTheme:
            return ["🦐", "🐚", "🍾", "⚓️"]
        case .spaceTheme:
            return ["🚀", "🛰", "🛸", "🥪"]
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .forrestTheme:
            return UIColor(red: 17/255, green: 102/255, blue: 38/255, alpha: 1.0)
        case .seaTheme:
            return UIColor(red: 25/255, green: 130/255, blue: 196/255, alpha: 1.0)
        case .spaceTheme:
            return UIColor(red: 53/255, green: 30/255, blue: 41/255, alpha: 1.0)
        }
    }
    
}
