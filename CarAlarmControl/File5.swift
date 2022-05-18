//
//  File5.swift
//  CarAlarmControl
//
//  Created by Павел Барташов on 10.05.2022.
//

import SwiftUI
import ContactsUI

/// `UIViewRepresentable` to port `CNContactPickerViewController` for use with SwiftUI.
struct ContactPicker: UIViewControllerRepresentable {
    @Binding var delegate: ContactPickerDelegate
    public var displayedPropertyKeys: [String]?

    // Sadly, we need to present the `CNContactPickerViewController` from another `UIViewController`.
    // This is due to a confirmed bug -- see https://openradar.appspot.com/7103187.
    class Presenter: UIViewController {}
    public var presenter = Presenter()
    typealias UIViewControllerType = Presenter

    func makeUIViewController(context: Context) -> UIViewControllerType {
        let picker = CNContactPickerViewController()
        picker.delegate = delegate
        picker.displayedPropertyKeys = displayedPropertyKeys
        presenter.present(picker, animated: true)
        return presenter
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if !delegate.showPicker {
            presenter.dismiss(animated: true)
        }
    }
}

/// Delegate required by `ContactPicker` to handle `CNContactPickerViewController` events.
/// Extend `ContactPickerDelegate` and implement/override its methods to provide custom functionality as required.
/// Listen/subscribe to `showPicker` in a `View` or `UIViewController`, e.g. to control whether `CNContactPickerViewController` is presented.
class ContactPickerDelegate: NSObject, CNContactPickerDelegate, ObservableObject {
    @Published var showPicker: Bool = false

    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        self.showPicker = false
    }
}
