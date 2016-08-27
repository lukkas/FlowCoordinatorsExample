//
//  AppCoordinator.swift
//  Type
//
//  Created by Łukasz Kasperek on 21.08.2016.
//  Copyright © 2016 Lukasz Kasperek. All rights reserved.
//

import UIKit

final class AppCoordinator: FlowCoordinator {
    
    let navigationController: UINavigationController
    private var dependencySet: FlowCoordinatorDependencySet {
        return FlowCoordinatorDependencySet()
    }
    private var currentFlowCoordinator: FlowCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let flowCoordinator = NoteFlowCoordinator(navigationController: navigationController)
        currentFlowCoordinator = flowCoordinator
        currentFlowCoordinator?.start()
    }
}
