//
//  UnwindHandler.swift
//  Type
//
//  Created by Łukasz Kasperek on 27.08.2016.
//  Copyright © 2016 Lukasz Kasperek. All rights reserved.
//

import UIKit

protocol UnwindHandler: class {
    func unwind(fromController controller: UIViewController)
}

extension FlowCoordinator where Self: UnwindHandler {
    
    func unwind(fromController controller: UIViewController) {
        if navigationController.presentedViewController === controller {
            controller.dismiss(animated: true, completion: nil)
        } else {
            navigationController.popViewController(animated: true)
        }
    }
}
