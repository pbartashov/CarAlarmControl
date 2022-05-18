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


//    @State var showPicker = false

    @State private var myDouble: Double = 0.673
    @State private var numberFormatter: NumberFormatter = {
        var nf = NumberFormatter()
        nf.numberStyle = .decimal
        return nf
    }()
    @State private var nameComponents = PersonNameComponents()

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

               ContactsPicker(title: "Select from Contacts")



//                ContactsPicker1(onContactPropertySelect: { contactProperty in
//                    if let phoneNumber = contactProperty.value as? CNPhoneNumber {
//                        controller.carAlarmPhoneNumber = phoneNumber.stringValue
//                    }
//                }, label: {
//                    Text("Select from Contacts")
//                })

                ContactsPicker1 { contactProperty in
                    if let phoneNumber = contactProperty.value as? CNPhoneNumber {
                        controller.carAlarmPhoneNumber = phoneNumber.stringValue
                    }
                } label: {
                    Text("Select from Contacts")
                }


                Button {
                    controller.carAlarmPhoneNumber = "1"
                } label: {
                    Text("1")
                }

                Text(controller.carAlarmPhoneNumber)

                TextField("1", text: controller.$carAlarmPhoneNumber)




                         VStack {
                             TextField(
                                 value: $myDouble,
                                 formatter: numberFormatter
                             ) {
                                 Text("Double")
                             }
                             Text(myDouble, format: .number)
                             Text(myDouble, format: .number.precision(.significantDigits(5)))
                             Text(myDouble, format: .number.notation(.scientific))
                         }

                TextField(
                    "Proper name",
                    value: $nameComponents,
                    format: .name(style: .medium)
                )
                .onSubmit {
//                    validate(components: nameComponents)
                }
                .disableAutocorrection(true)
                .border(.secondary)
                Text(nameComponents.debugDescription)

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
