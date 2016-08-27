//
//  NotesViewController.swift
//  Type
//
//  Created by Łukasz Kasperek on 27.08.2016.
//  Copyright © 2016 Lukasz Kasperek. All rights reserved.
//

import UIKit

final class NotesViewController: UIViewController {
    
    var viewModel: NotesViewModel!
    weak var flowDelegate: (FlowCoordinator & UnwindHandler)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        precondition(viewModel != nil)
    }
}
