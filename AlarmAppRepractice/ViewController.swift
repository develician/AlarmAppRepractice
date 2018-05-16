//
//  ViewController.swift
//  AlarmAppRepractice
//
//  Created by 최동호 on 2018. 2. 19..
//  Copyright © 2018년 최동호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }

    var df: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            if let list = UIApplication.shared.scheduledLocalNotifications {
                let target = list[indexPath.row]
                UIApplication.shared.cancelLocalNotification(target)
                 tableView.reloadData()
            }
        default:
            break
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UIApplication.shared.scheduledLocalNotifications?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        if let list = UIApplication.shared.scheduledLocalNotifications {
            let target = list[indexPath.row]
            cell.textLabel?.text = target.alertBody
            cell.detailTextLabel?.text = df.string(for: target.fireDate)
        }
        
        return cell
    }
    
    
}
