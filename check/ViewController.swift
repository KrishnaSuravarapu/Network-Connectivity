//
//  ViewController.swift
//  check
//
//  Created by Krishna on 23/01/23.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet var connectionStatus: UITextField!
    override func viewDidLoad() {
        NSLog("[Krishna] view load")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkMonitor.shared.startMonitoring(textField: connectionStatus)
    }
}

