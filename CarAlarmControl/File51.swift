//
//  File51.swift
//  CarAlarmControl
//
//  Created by Павел Барташов on 10.05.2022.
//

import SwiftUI
import ContactsUI

struct ContactPickerView: View {
    @ObservedObject var delegate = Delegate()

    var body: some View {
        VStack {
            Text("Hi")

            Button(action: {
                delegate.showPicker = true
            }, label: {
                Text("Pick contact")
            })
            .sheet(isPresented: $delegate.showPicker, onDismiss: {
                delegate.showPicker = false
            }) {
                ContactPicker(delegate: .constant(delegate))
            }

            if let contact = delegate.contact {
                Text("Selected: \(contact.givenName)")
            }
        }
    }

    /// Provides `CNContactPickerDelegate` functionality tailored to this view's requirements.
    class Delegate: ContactPickerDelegate {
        @Published var contact: CNContact? = nil

        func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
            print(contact.givenName)
            self.contact = contact
            self.showPicker = false
        }
    }
}

struct ContactPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ContactPickerView()
    }
}
