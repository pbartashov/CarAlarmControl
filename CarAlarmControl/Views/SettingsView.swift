//
//  SettingsView.swift
//  CarAlarmControl
//
//  Created by Павел Барташов on 24.04.2022.
//

import SwiftUI


import Contacts

struct SettingsView: View {
    @EnvironmentObject var controller: CarAlarmController

    var body: some View {
        Form {
            Section("Car alarm") {
                PhoneField(placeholder: "Car alarm phone number", text: $controller.carAlarmPhoneNumber)
                ContactsPicker {
                    Text("Select from Contacts")
                } onContactPropertySelect: { contactProperty in
                    if let phoneNumber = contactProperty.value as? CNPhoneNumber {
                        DispatchQueue.main.async {
                            controller.carAlarmPhoneNumber = phoneNumber.stringValue/
                        }
                    }
                }
            }

            Section("Commands") {
                HStack() {
                    Text("Lock")
                    PhoneField(placeholder: "Lock command", text: controller.$lockCommand)
                }

                HStack {
                    Text("Unlock")
                    PhoneField(placeholder: "Unlock command", text: controller.$unlockCommand)
                }

                HStack {
                    Text("Engine start")
                    PhoneField(placeholder: "Engine start command", text: controller.$engineStartCommand)
                }

                HStack {
                    Text("Engine stop")
                    PhoneField(placeholder: "Engine stop command", text: controller.$engineStopCommand)
                }
            }
            .multilineTextAlignment(.trailing)

            Section("Gate") {
                PhoneField(placeholder: "Gate phone number", text: $controller.gatePhoneNumber)
                ContactsPicker {
                    Text("Select from Contacts")
                } onContactPropertySelect: { contactProperty in
                    if let phoneNumber = contactProperty.value as? CNPhoneNumber {
                        controller.gatePhoneNumber = phoneNumber.stringValue
                    }
                }
            }
        }
        .keyboardType(.phonePad)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(CarAlarmController())
    }
}
