//
//  ViewController.swift
//  Event Time
//
//  Created by Alexander Hall on 12/13/19.
//  Copyright © 2019 Hall Inc. All rights reserved.
//

import UIKit
import UserNotifications

class RemindersTableViewController: UITableViewController {

    // model
    var remindersArray = [ReminderObject]()
    
    let dateFormatter = DateFormatter()
    let locale = NSLocale.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return remindersArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellName", for: indexPath)
        let reminder = remindersArray[indexPath.row]
        cell.textLabel!.text = reminder.title
        cell.detailTextLabel!.text = dateFormatter.string(from: reminder.date)
        
        return cell
    }
    
    // allow swipe to delete for table rows
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [remindersArray[indexPath.row].title])
            remindersArray.remove(at: indexPath.row)
            saveReminders()
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    func saveReminders() {
        let fullPath = ReminderObject.DocumentsDirectory.appendingPathComponent("reminders")
        
        do {
                let data = try NSKeyedArchiver.archivedData(withRootObject: remindersArray, requiringSecureCoding: false)
            try data.write(to: fullPath)
            
        } catch {
            print("Failed to save reminders")
        }
    }
    
    func loadReminders() -> [ReminderObject]? {
        //let data = NSData(contentsOfFile: ReminderObject.DocumentsDirectory.path)
        let dataURL = ReminderObject.DocumentsDirectory
        guard let codedData = try? Data(contentsOf: dataURL) else { return nil }
        let data = try! (NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(codedData) as! [ReminderObject])
        return data
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToReminderSetter" {
            if let addReminderVC = segue.destination as? AddReminderViewController, let reminder = addReminderVC.reminder {
                // add a new reminder
                let newIndexPath = IndexPath(row: remindersArray.count, section: 0)
                remindersArray.append(reminder)
                tableView.insertRows(at: [newIndexPath] , with: .bottom)
                saveReminders()
                tableView.reloadData()
                addReminderVC.textField.becomeFirstResponder()
            }
        }
    }
    
}

