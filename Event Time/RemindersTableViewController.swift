//
//  ViewController.swift
//  Event Time
//
//  Created by Alexander Hall on 12/13/19.
//  Copyright © 2019 Hall Inc. All rights reserved.
//

import UIKit

class RemindersTableViewController: UITableViewController {

    // model
    //var dateArray = [String]()
    var dateArray = [1,2,3,4,5]
    
    //var stringDate: String = ""
    
    /*
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    } */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellName", for: indexPath)
        cell.textLabel!.text = String(dateArray[indexPath.row])
        //dateArray[indexPath.row] = stringDate
        //cell.textLabel!.text = dateArray[indexPath.row] + "test"
        //cell.detailTextLabel!.text = "Remind me at: " + dateArray[indexPath.row]
        
        return cell
    }
    
    // allow swipe to delete for table rows
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dateArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToReminderSetter" {
            if let addReminderVC = segue.destination as? AddReminderViewController {
                addReminderVC.textField.becomeFirstResponder()
            }
        }
    }
    
}

