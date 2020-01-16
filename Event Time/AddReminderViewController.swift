//
//  AddReminderViewController.swift
//  Event Time
//
//  Created by Alexander Hall on 12/17/19.
//  Copyright © 2019 Hall Inc. All rights reserved.
//

import UIKit

class AddReminderViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var reminderInputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //datePicker.minimumDate = Date()
        //print(Date())
    }
    
    @IBAction func cancelPopOut(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.delegate = self
        }
    }
    
    @IBAction func saveWhatWasTyped(_ sender: UIBarButtonItem) {
        textField.resignFirstResponder()
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // disable save button if text field is empty
        saveButton.isEnabled = !reminderInputTextField.text!.isEmpty
    }
    
    // called whenever the value of the data picker stops scrolling and changes
    @IBAction func datePicker(_ sender: UIDatePicker) {
        
        // disable save button if they try to pick a date before current date
        print(NSDate().earlierDate(datePicker.date))
        print(datePicker.date)
        if NSDate().earlierDate(datePicker.date) == datePicker.date {
            saveButton.isEnabled = false
        } else {
            saveButton.isEnabled = true
        }
        print("Changed!")
        print(sender.date.description)
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
