//
//  SettingsView.swift
//  CarAlarmControl
//
//  Created by Павел Барташов on 24.04.2022.
//

import SwiftUI
import iPhoneNumberField



import Contacts

enum Settings {
    static let carAlarmPhoneNumber = "carAlarmPhoneNumber"
    static let gatePhoneNumber = "gatePhoneNumber"
}

struct SettingsView: View {
    @EnvironmentObject var controller: CarAlarmController
//    @AppStorage(Settings.carAlarmPhoneNumber) var carAlarmPhoneNumber: String = ""
//    @AppStorage(Command.lock.rawValue) var lockCommand: String = ""
//    @AppStorage(Command.unlock.rawValue) var unlockCommand: String = ""
//    @AppStorage(Command.engineStart.rawValue) var engineStartCommand: String = ""
//    @AppStorage(Command.engineStop.rawValue) var engineStopCommand: String = ""
//    @AppStorage(Settings.gatePhoneNumber) var gatePhoneNumber: String = ""

    var body: some View {
        Form {
            Section("Car alarm") {
                iPhoneNumberField("Car alarm phone number", text: controller.$carAlarmPhoneNumber)
                    .prefixHidden(false)
//                    .autofillPrefix(true)
//                    .flagHidden(false)
//                    .flagSelectable(true)
//                    .onChange(of: controller.carAlarmPhoneNumber) { newValue in
//                        print(newValue)
//                        controller.carAlarmPhoneNumber = "2"
//
//                    }
            }

            Section("Commands") {
                HStack() {
                    Text("Lock")
                    TextField("Lock command", text: controller.$lockCommand)
                }

                HStack {
                    Text("Unlock")
                    TextField("Unlock command", text: controller.$unlockCommand)
                }

                HStack {
                    Text("Engine start")
                    TextField("Engine start command", text: controller.$engineStartCommand)
                }

                HStack {
                    Text("Engine stop")
                    TextField("Engine stop command", text: controller.$engineStopCommand)
                }


            }
            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
//            Section("Car alarm") {
//                HStack {
//                    Text("Phone number:")
//                    Divider()
//                    TextField("Car alarm phone number", text: $carAlarmPhoneNumber)
//                }
//
//                HStack {
//                    Text("Lock command:")
//                    Divider()
//                    TextField("Lock command", text: $carAlarmPhoneNumber)
//                }
//
//
//            }




            Section("Gate") {
                TextField("Gate phone number", text: controller.$gatePhoneNumber)
            }

            VStack {

                Text("Selected: \(contact?.givenName ?? "")")
                Text("Selected: \(contact?.phoneNumbers.first?.value.stringValue ?? "")")
                ContactPickerButton(contact: $contact) {
                    Label("Select Contact", systemImage: "person.crop.circle.fill")
                        .fixedSize()
                }
                .fixedSize()
                .buttonStyle(.borderedProminent)

            }

        }
        .keyboardType(.phonePad)


    }

    @State var contact: CNContact?
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(CarAlarmController())
    }
}
