//
//  UIViewExtensions.swift
//  Event Time
//
//  Created by Alexander Hall on 12/15/19.
//  Copyright © 2019 Hall Inc. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addConstraints(to view: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
