//
//  CarAlarmController.swift
//  CarAlarmControl
//
//  Created by Павел Барташов on 20.04.2022.
//

import SwiftUI

protocol RemoteController {
    var canLock: Bool { get }
    var canUnlock: Bool { get }
    var canStartEngine: Bool { get }
    var canStopEngine: Bool { get }
    var canOpenGate: Bool { get }
    
    func perfom(command: Command)
}

enum RemotePhoneNumber {
    static let carAlarm = "carAlarmPhoneNumber"
    static let gate = "gatePhoneNumber"
}

enum Command: String {
    case lock = "lock"
    case unlock = "unlock"
    case engineStart = "engineStart"
    case engineStop = "engineStop"
    case openGate = "openGate"
}

final class CarAlarmController: RemoteController, ObservableObject {
    @Environment(\.openURL) private var openURL

    @AppStorage(RemotePhoneNumber.carAlarm) var carAlarmPhoneNumber: String = ""
    @AppStorage(Command.lock.rawValue) var lockCommand: String = ""
    @AppStorage(Command.unlock.rawValue) var unlockCommand: String = ""
    @AppStorage(Command.engineStart.rawValue) var engineStartCommand: String = ""
    @AppStorage(Command.engineStop.rawValue) var engineStopCommand: String = ""
    @AppStorage(RemotePhoneNumber.gate) var gatePhoneNumber: String = ""

    var needPhoneNumbers: Bool {
        carAlarmPhoneNumber.isEmpty && gatePhoneNumber.isEmpty
    }
    
    var canLock: Bool {
        !lockCommand.isEmpty
    }
    
    var canUnlock: Bool {
        !unlockCommand.isEmpty
    }
    
    var canStartEngine: Bool {
        !engineStartCommand.isEmpty
    }
    
    var canStopEngine: Bool {
        !engineStopCommand.isEmpty
    }
    
    var canOpenGate: Bool {
        !gatePhoneNumber.isEmpty
    }
    
    func perfom(command: Command) {
        switch command {
            case .lock:
                callTo(number: carAlarmPhoneNumber, ussdCode: lockCommand)
            case .unlock:
                callTo(number: carAlarmPhoneNumber, ussdCode: unlockCommand)
            case .engineStart:
                callTo(number: carAlarmPhoneNumber, ussdCode: engineStartCommand)
            case .engineStop:
                callTo(number: carAlarmPhoneNumber, ussdCode: engineStopCommand)
            case .openGate:
                callTo(number: gatePhoneNumber)
        }
    }
    
    private func callTo(number: String?, ussdCode: String? = nil) {
        let encoded = ussdCode?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        if let number = number,
           let url = URL(string: "tel://\(number),\(encoded)") {
            
            openURL(url)
        }
    }
}
