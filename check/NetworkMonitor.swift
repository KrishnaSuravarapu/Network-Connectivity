//
//  NetworkMonitor.swift
//  check
//
//  Created by Krishna on 23/01/23.
//

import Foundation
import Network
import UIKit

extension NWInterface.InterfaceType: CaseIterable {
    public static var allCases: [NWInterface.InterfaceType] = [
        .other,
        .wifi,
        .cellular,
        .loopback,
        .wiredEthernet
    ]
}

final class NetworkMonitor {
    static let shared = NetworkMonitor()

    private let queue = DispatchQueue(label: "NetworkConnectivityMonitor")
    private let monitor: NWPathMonitor

    private(set) var isConnected = false
    private(set) var isExpensive = false
    private(set) var currentConnectionType: NWInterface.InterfaceType?

    private init() {
        monitor = NWPathMonitor()
    }

    func startMonitoring(textField: UITextField!) {
        monitor.pathUpdateHandler = { [weak self] path in
            if(path.status == .satisfied){
                textField.text = "Connected"
                NSLog("[Krishna] Network is Connected")
            } else {
                textField.text = "Disconnected"
                NSLog("[Krishna] Network is Disconnected")
            }
        }
        monitor.start(queue: queue)
    }

    func stopMonitoring() {
        monitor.cancel()
    }
}
