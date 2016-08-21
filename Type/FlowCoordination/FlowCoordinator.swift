//
//  FlowCoordinator.swift
//  Type
//
//  Created by Łukasz Kasperek on 21.08.2016.
//  Copyright © 2016 Lukasz Kasperek. All rights reserved.
//

import UIKit

protocol FlowCoordinator: class {
    var navigationController: UINavigationController { get }
    func start() -> Void
}
