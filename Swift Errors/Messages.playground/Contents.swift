//: Playground - noun: a place where people can play

import Foundation

enum WifiCommand: UInt {
    case Connect = 0x01, Disconnect, DiscoveryStart, DiscoveryEnd
}

enum WifiStatus: UInt {
    case DisconnectedNotConfigured = 0x01
    case Disconnected = 0x02
    case Connecting = 0x03
    case Connected = 0x04
    case ConnectedServerNotReachable = 0x05
    case ScanningForNetworks = 0x06

    case Error = 0x80
    case IncorrectPassphrase = 0x81
    case NetworkNotFound = 0x82
    case WeakSignal = 0x83
    case UnsupportedAuthType = 0x84
}

struct WifiCommandRequest {
    let command: WifiCommand
    let scanDuration: UInt

    func dictionaries() -> [[String: AnyObject]] {
        return [["command" : self.command.rawValue,
                 "payload" : self.scanDuration]]
    }
}


struct WifiStatusResponse {
    let status: WifiStatus?
    init(dictionaries: [[String: AnyObject]]) {
        let rawStatus = dictionaries.first.flatMap{$0["status"]}.flatMap{$0 as? UInt}
        if let rawStatus = rawStatus {
            self.status = WifiStatus(rawValue: rawStatus)
        } else {
            self.status = nil
        }
    }
}


