//
//  NotesDisplayable.swift
//  Type
//
//  Created by Łukasz Kasperek on 27.08.2016.
//  Copyright © 2016 Lukasz Kasperek. All rights reserved.
//

import Foundation

protocol NotesDisplayable {
    func showNotes() -> Void
}

extension FlowCoordinator where Self: NotesDisplayable, Self: UnwindHandler {
    
    func showNotes() {
        let controller = ViewControllerFactory.notesViewController()
        controller.viewModel = NotesViewModel()
        controller.flowDelegate = self
        navigationController.show(controller, sender: nil)
    }
}
