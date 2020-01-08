//
//  ViewController.swift
//  Event Time
//
//  Created by Alexander Hall on 12/13/19.
//  Copyright © 2019 Hall Inc. All rights reserved.
//

import UIKit

class RemindersTableViewController: UITableViewController {

    let dateArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellName", for: indexPath)
        cell.textLabel!.text = dateArray[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToReminderSetter" {
            if let reminderVC = segue.destination as? AddReminderViewController {
                reminderVC.textField.becomeFirstResponder()
            }
        }
    }
    
}

