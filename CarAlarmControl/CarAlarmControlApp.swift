//
//  CarAlarmControlApp.swift
//  CarAlarmControl
//
//  Created by Павел Барташов on 20.04.2022.
//

import SwiftUI




import Contacts

@main
struct CarAlarmControlApp: App {
    @State var contact: CNContact?
    @State var openSelectContact = false
    @State var isShowingSheet = false

    @State var showPicker = false


    var body: some Scene {
        WindowGroup {
//            ContentView()


            VStack {
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

                VStack {
                    Spacer()


                    Button("Select a contact") {
                        openSelectContact.toggle()
                    }
                    .sheet(isPresented: $openSelectContact, onDismiss: nil) {
                        ContactPickerView()
                    }

                    Spacer()

                    Button(action: {
                        EmailService.shared.sendEmail(subject: "hello", body: "this is body", to: "asd@gmail.com") { (isWorked) in
                            if !isWorked{ //if mail couldn't be presented
                                // do action
                            }
                        }
                    }, label: {
                        Text("Send Email")
                    })


                    Spacer()

                    Button(action: {
                        isShowingSheet.toggle()
                    }) {
                        Text("Show contacts")
                    }
                    .sheet(isPresented: $isShowingSheet,
                           onDismiss: nil) {
                        PickupContactsView()
                    }
                }

                Spacer()

                Button(action: {
                    PickupContactsViewController().showContacts()
                }) {
                    Text("SHOW FROM ROOT")
                }


                Spacer()

                VStack {
                    ZStack {
                        // This is just a dummy view to present the contact picker,
                        // it won't display anything, so place this anywhere.
                        // Here I have created a ZStack and placed it beneath the main view.
                        ContactPicker(
                            showPicker: $showPicker,
                            onSelectContact: { c in
    //                            self.contact = c
                            }
                        )

                        VStack {
                            Button(action: {
                                self.showPicker.toggle()
                            }) {
                                Text("Pick a contact")
                            }
                        }
                    }
                }

//                Button(action: {
//                    isShowingSheet.toggle()
//                }) {
//                    Text("Show License Agreement")
//                }
//                .sheet(isPresented: $isShowingSheet,
//                       onDismiss: nil) {
//                    VStack {
//                        Text("License Agreement")
//                            .font(.title)
//                            .padding(50)
//                        Text("""
//                        Terms and conditions go here.
//                    """)
//                        .padding(50)
//                        Button("Dismiss",
//                               action: { isShowingSheet.toggle() })
//                    }
//                }
            }
        }
    }
}
