//
//  AddReminderViewController.swift
//  Event Time
//
//  Created by Alexander Hall on 12/17/19.
//  Copyright © 2019 Hall Inc. All rights reserved.
//

import UIKit

class AddReminderViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.delegate = self
        }
    }
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField.text!)
        textField.resignFirstResponder()
        return true
    }
}
