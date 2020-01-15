//
//  AddReminderViewController.swift
//  Event Time
//
//  Created by Alexander Hall on 12/17/19.
//  Copyright © 2019 Hall Inc. All rights reserved.
//

import UIKit

class AddReminderViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.delegate = self
        }
    }
    
    // called whenever the value of the data picker stops scrolling and changes
    @IBAction func datePicker(_ sender: UIDatePicker) {
        print("Changed!")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField.text!)
        textField.resignFirstResponder()
        return true
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToRemindersView" {
            if let reminderTableVC = segue.destination as? RemindersTableViewController {
                reminderTableVC.stringDate = datePicker.date.description
            }
        }
    }*/
}
