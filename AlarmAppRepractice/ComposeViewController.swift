//
//  ComposeViewController.swift
//  AlarmAppRepractice
//
//  Created by 최동호 on 2018. 2. 19..
//  Copyright © 2018년 최동호. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    @IBOutlet weak var inputField: UITextField!
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func save(_ sender: Any) {
        guard let txt = inputField.text, txt.count > 0 else {
            return
        }
        
        let noti = UILocalNotification()
        noti.alertTitle = "알람이 도착했습니다."
        noti.alertBody = txt
        noti.fireDate = datePicker.date
        noti.applicationIconBadgeNumber = UIApplication.shared.applicationIconBadgeNumber + 1
        UIApplication.shared.scheduleLocalNotification(noti)
        
        
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }



}
