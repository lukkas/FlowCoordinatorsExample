//
//  NoteFlowCoordinator.swift
//  Type
//
//  Created by Łukasz Kasperek on 21.08.2016.
//  Copyright © 2016 Lukasz Kasperek. All rights reserved.
//

import UIKit

final class NoteFlowCoordinator: FlowCoordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showNoteViewController()
    }
}

extension NoteFlowCoordinator: UnwindHandler {}

extension NoteFlowCoordinator: Injectable {
    
    func injectDependencySet(set: FlowCoordinatorDependencySet) {
        
    }
}

private extension NoteFlowCoordinator {
    
    func showNoteViewController() {
        let noteViewController = ViewControllerFactory.noteViewController()
        noteViewController.viewModel = NoteViewModel()
        noteViewController.flowCoordinator = self
        navigationController.show(noteViewController, sender: nil)
    }
}
