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
    
    var reminder: ReminderObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        datePicker.locale = Locale.current
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // disable save button if text field is empty
        saveButton.isEnabled = !reminderInputTextField.text!.isEmpty
    }
    
    // called whenever the value of the data picker stops scrolling and changes
    @IBAction func datePicker(_ sender: UIDatePicker) {
        
        // disable save button if they try to pick a date before current date
        if NSDate().earlierDate(datePicker.date) == datePicker.date {
            saveButton.isEnabled = false
        } else if textField.text!.isEmpty == false {
            saveButton.isEnabled = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField.text!)
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender as? UIBarButtonItem == saveButton {
            let center = UNUserNotificationCenter.current()
            let content = UNMutableNotificationContent()
            content.title = datePicker.date.description
            content.body = textField.text!
            content.sound = .default
            content.userInfo = ["value":"Data with local notification"]
            let fireDate = Calendar.current.dateComponents([.day,.month,.year,.hour,.minute,.second], from: datePicker.date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: fireDate, repeats: false)
            let request = UNNotificationRequest(identifier: textField.text!, content: content, trigger: trigger)
            center.add(request, withCompletionHandler: { (error) in
                if error != nil {
                    print("Error = \(error?.localizedDescription ?? "error local notification")")
                }
            })
            
            reminder = ReminderObject(title: textField.text!, date: datePicker.date)
            
            self.dismiss(animated: true, completion: nil)
        }
       // if segue.identifier == "unwindToRemindersView" {
         //   if let reminderTableVC = segue.destination as? RemindersTableViewController {
                //reminderTableVC.dateArray.append(21)
                //reminderTableVC.tableView.reloadData()
     //tableView.insertRowsAtIndexPath([indexPath], withRowAnimation: .Bottom)
                print("Segued!")
      //      }
    //    }
    }
}
