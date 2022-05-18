//
//  ContactsPicker1.swift
//  CarAlarmControl
//
//  Created by Павел Барташов on 10.05.2022.
//

import SwiftUI
import ContactsUI

struct ContactsPicker1<Label>: View where Label : View {
//struct ContactsPicker1<Label: View>: View {
    let delegate: Delegate
    let label: () -> Label

    init(onContactPropertySelect: ((_: CNContactProperty) -> Void)? = nil, label: @escaping () -> Label) {
        self.label = label

        self.delegate = Delegate()
        self.delegate.onContactPropertySelect = onContactPropertySelect
    }


    var body: some View {

//        Button<Label>(action: showContacts, label: Label)


        Button<Label> {
            showContacts()
        } label: {
            label()
        }

    }

    func showContacts() {
        let picker = CNContactPickerViewController()
        picker.delegate = delegate
        picker.displayedPropertyKeys = [CNContactPhoneNumbersKey]
        picker.predicateForEnablingContact = NSPredicate(format: "phoneNumbers.@count > 0",
                                                         argumentArray: nil)

        UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }?.rootViewController?.present(picker, animated: true)
    }

    class Delegate: NSObject, CNContactPickerDelegate  {

        var onContactPropertySelect: ((_: CNContactProperty) -> Void)?

        func contactPicker(_ picker: CNContactPickerViewController, didSelect contactProperty: CNContactProperty) {

            onContactPropertySelect?(contactProperty)
        }
    }
}

struct ContactsPicker1_Previews: PreviewProvider {
    static var previews: some View {
        ContactsPicker1 { Text("Show Contacts") }
    }
}
