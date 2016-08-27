//
//  Injectable.swift
//  Type
//
//  Created by Łukasz Kasperek on 27.08.2016.
//  Copyright © 2016 Lukasz Kasperek. All rights reserved.
//

import Foundation

protocol Injectable {
    func injectDependencySet(set: FlowCoordinatorDependencySet) -> Void
}
