//
//  CarAlarmController.swift
//  CarAlarmControl
//
//  Created by Павел Барташов on 20.04.2022.
//

import SwiftUI
//import CallKit

protocol RemoteController {
    func perfom(command: Command)
}

enum Command {
    case lock
    case unlock
    case engineStart
    case engineStop
    case openGate
}



//final class CarAlarmController: NSObject, CXCallObserverDelegate {
struct CarAlarmController: RemoteController {
    @Environment(\.openURL) private var openURL

    private var carAlarmPhoneNumber: String?
    private var gatePhoneNumber: String?

    private var lockUSSDCode: String?
    private var unlockUSSDCode: String?

    private var engineStartUSSDCode: String?
    private var engineStopUSSDCode: String?


    //    var callObserver = CXCallObserver()
    //    let callController = CXCallController()

    //    var provider = CXProvider(configuration: CarAlarmController.providerConfiguration)

    //    var backgroundTaskIdentifier: UIBackgroundTaskIdentifier? //???

    //    static var providerConfiguration: CXProviderConfiguration = {
    //        let providerConfiguration = CXProviderConfiguration(localizedName: "CarAlarmControl")
    //
    //        providerConfiguration.supportsVideo = false
    //        providerConfiguration.maximumCallsPerCallGroup = 1
    //        providerConfiguration.supportedHandleTypes = [.phoneNumber]
    //
    //        return providerConfiguration
    //    }()



    func perfom(command: Command) {
        //        callController.callObserver.setDelegate(self, queue: nil)
        //        provider.setDelegate(self, queue: nil)

        switch command {
            case .lock:
                callTo(number: carAlarmPhoneNumber, ussdCode: lockUSSDCode)
            case .unlock:
                callTo(number: carAlarmPhoneNumber, ussdCode: unlockUSSDCode)
            case .engineStart:
                callTo(number: carAlarmPhoneNumber, ussdCode: engineStartUSSDCode)
            case .engineStop:
                callTo(number: carAlarmPhoneNumber, ussdCode: engineStopUSSDCode)
            case .openGate:
                callTo(number: gatePhoneNumber)
        }
    }

    private func callTo(number: String?, ussdCode: String? = nil) {
        let encoded = ussdCode?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        if let number = number,
           let url = URL(string: "tel://\(number)\(encoded)") {

            openURL(url)
        }
    }

    //    func callObserver(_ callObserver: CXCallObserver, callChanged call: CXCall) {
    //
    //        if call.hasEnded == true {
    //
    //            print("CXCallState :Ended")
    //
    //            return
    //
    //        }
    //
    //        if call.isOutgoing == true && call.hasConnected == false {
    //
    //            print("CXCallState :Dialing")
    //
    ////            backgroundTaskIdentifier = UIApplication.shared.beginBackgroundTask(expirationHandler: nil)
    //
    //
    ////            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    ////                let handle = CXHandle(type: .phoneNumber, value: "0*")
    //
    ////                let dtmfCallAction = CXPlayDTMFCallAction(call: call.uuid, digits: "0", type: .singleTone)
    ////                //            startCallAction.isVideo = videoEnabled
    ////
    ////                let transaction = CXTransaction(action: dtmfCallAction)
    //
    //
    ////                self.callController.request(transaction) { error in
    ////                    if let error = error {
    ////                        print("Error requesting transaction: \(error)")
    ////                    } else {
    ////                        print("Requested transaction successfully")
    ////                    }
    ////
    ////                    UIApplication.shared.endBackgroundTask(backgroundTaskIdentifier)
    ////                }
    //
    ////            }
    //
    //        }
    //
    //        if call.isOutgoing == false && call.hasConnected == false && call.hasEnded == false {
    //
    //            print("CXCallState :Incoming")
    //
    //        }
    //
    //
    //
    //        if call.hasConnected == true && call.hasEnded == false {
    //
    ////            if call.isOutgoing {
    ////
    ////                let handle = CXHandle(type: .phoneNumber, value: "0*")
    ////
    ////                let startCallAction = CXStartCallAction(call: UUID(), handle: handle)
    ////                //            startCallAction.isVideo = videoEnabled
    ////
    ////                let transaction = CXTransaction(action: startCallAction)
    ////
    ////                let callController = CXCallController()
    ////
    ////                callController.request(transaction) { error in
    ////                    if let error = error {
    ////                        print("Error requesting transaction: \(error)")
    ////                    } else {
    ////                        print("Requested transaction successfully")
    ////                    }
    ////                    //            }          requestTransaction(transaction)
    ////
    ////                }
    ////            if let task = backgroundTaskIdentifier {
    ////                UIApplication.shared.endBackgroundTask(task)
    ////            }
    //
    ////            let dtmfCallAction = CXPlayDTMFCallAction(call: call.uuid, digits: "0", type: .singleTone)
    ////
    ////
    ////            let transaction = CXTransaction(action: dtmfCallAction)
    ////
    ////
    ////            callController.request(transaction) { error in
    ////                if let error = error {
    ////                    print("Error requesting transaction: \(error)")
    ////                } else {
    ////                    print("Requested transaction successfully")
    ////                }
    ////            }
    ////            let setHeldCallAction = CXSetHeldCallAction(call: call.uuid, onHold: true)
    ////
    ////            let transaction = CXTransaction()
    ////            transaction.addAction(setHeldCallAction)
    ////
    ////
    ////            callController.request(transaction) { error in
    ////                if let error = error {
    ////                    print("Error requesting transaction: \(error)")
    ////                } else {
    ////                    print("Requested transaction successfully")
    ////                }
    ////            }
    //
    //            print(callController.callObserver.calls.count, callObserver.calls[0] == call)
    //
    //                print("CXCallState : Connected")
    //
    //            }
    //
    //        }
    ////    }
    //
    //    deinit {
    //        print("Deinit")
    //    }
    //}
    //
    //// MARK: - CXProviderDelegate
    //extension CarAlarmController: CXProviderDelegate {
    //    func providerDidReset(_ provider: CXProvider) {
    //        let a = 5
    //    }
    //
    //
    //    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
    ////        guard let call = callManager.callWithUUID(uuid: action.callUUID) else {
    ////            action.fail()
    ////            return
    ////        }
    ////
    //////        configureAudioSession()
    ////
    ////        call.answer()
    //
    //        action.fulfill()
    //    }
    //
    //    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
    //        action.fulfill()
    //    }
    //
    //    func provider(_ provider: CXProvider, perform action: CXPlayDTMFCallAction) {
    //        action.fulfill()
    //    }
    //
    //    func provider(_ provider: CXProvider, perform action: CXStartCallAction) {
    //        action.fulfill()
    //
    //
    //
    //
    //
    ////        let call = Call(uuid: action.callUUID, outgoing: true,
    ////                        handle: action.handle.value)
    ////
    ////        configureAudioSession()
    ////
    ////        call.connectedStateChanged = { [weak self, weak call] in
    ////            guard
    ////                let self = self,
    ////                let call = call
    ////            else {
    ////                return
    ////            }
    ////
    ////            if call.connectedState == .pending {
    ////                self.provider.reportOutgoingCall(with: call.uuid, startedConnectingAt: nil)
    ////            } else if call.connectedState == .complete {
    ////                self.provider.reportOutgoingCall(with: call.uuid, connectedAt: nil)
    ////            }
    ////        }
    ////
    ////        call.start { [weak self, weak call] success in
    ////            guard
    ////                let self = self,
    ////                let call = call
    ////            else {
    ////                return
    ////            }
    ////
    ////            if success {
    ////                action.fulfill()
    ////                self.callManager.add(call: call)
    ////            } else {
    ////                action.fail()
    ////            }
    ////        }
    //    }
}
