////
////  ProviderDelegate.swift
////  CarAlarmControl
////
////  Created by Павел Барташов on 21.04.2022.
////
//
//import AVFoundation
//import CallKit
//
//class ProviderDelegate: NSObject {
//    // 1.
//    private let callManager: CallManager
//    private let provider: CXProvider
//
//    init(callManager: CallManager) {
//        self.callManager = callManager
//        // 2.
//        provider = CXProvider(configuration: ProviderDelegate.providerConfiguration)
//
//        super.init()
//        // 3.
//        provider.setDelegate(self, queue: nil)
//    }
//
//    // 4.
//    static var providerConfiguration: CXProviderConfiguration = {
//        let providerConfiguration = CXProviderConfiguration(localizedName: "Hotline")
//
//        providerConfiguration.supportsVideo = true
//        providerConfiguration.maximumCallsPerCallGroup = 1
//        providerConfiguration.supportedHandleTypes = [.phoneNumber]
//
//        return providerConfiguration
//    }()
//
//    func reportIncomingCall(
//        uuid: UUID,
//        handle: String,
//        hasVideo: Bool = false,
//        completion: ((Error?) -> Void)?
//    ) {
//        // 1.
//        let update = CXCallUpdate()
//        update.remoteHandle = CXHandle(type: .phoneNumber, value: handle)
//        update.hasVideo = hasVideo
//
//        // 2.
//        provider.reportNewIncomingCall(with: uuid, update: update) { error in
//            if error == nil {
//                // 3.
//                let call = Call(uuid: uuid, handle: handle)
//                self.callManager.add(call: call)
//            }
//
//            // 4.
//            completion?(error)
//        }
//    }
//}
//
