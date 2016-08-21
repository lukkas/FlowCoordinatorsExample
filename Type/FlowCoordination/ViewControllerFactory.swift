//
//  ViewControllerFactory.swift
//  Type
//
//  Created by Łukasz Kasperek on 21.08.2016.
//  Copyright © 2016 Lukasz Kasperek. All rights reserved.
//

import UIKit

struct ViewControllerFactory {
    
    enum Storyboard: String {
        case Note
    }
    
    private static func storyboard(_ stoyboard: Storyboard) -> UIStoryboard {
        return UIStoryboard(name: stoyboard.rawValue, bundle: nil)
    }
    
    static func searchViewController() -> NoteViewController {
        return storyboard(.Note).instantiateViewController(withIdentifier: "NoteViewController") as! NoteViewController
    }
}
