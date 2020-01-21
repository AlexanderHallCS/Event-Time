//
//  ReminderObject.swift
//  Event Time
//
//  Created by Alexander Hall on 1/19/20.
//  Copyright © 2020 Hall Inc. All rights reserved.
//

import UserNotifications
import UIKit

class ReminderObject: NSObject, NSCoding {
    
    var title: String
    var date: Date
  //  var notification: UNNotification
    
    // Archive Paths for Persistent Data
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("reminders")
    
    struct PropertyKey {
        static let titleKey = "title"
        static let dateKey = "date"
       // static let notificationKey = "notification"
    }
    
    init(title: String, date: Date) {
        self.title = title
        self.date = date
        print("called1")
       // self.notification = notification
        
        super.init()
    }
    
    deinit {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [title])
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(title, forKey: PropertyKey.titleKey)
        coder.encode(date, forKey: PropertyKey.dateKey)
       // coder.encode(notification, forKey: PropertyKey.notificationKey)
    }
    
    // optional initializer to be called to use default values 
    required convenience init?(coder: NSCoder) {
        let title = coder.decodeObject(forKey: PropertyKey.titleKey) as! String
        let date = coder.decodeObject(forKey: PropertyKey.dateKey) as! Date
       // let notification = coder.decodeObject(forKey: PropertyKey.notificationKey) as! UNNotification
        print("called2!")
        //self.init(title: title, date: date, notification: notification)
        self.init(title: title, date: date)
    }
    
    
    
}
