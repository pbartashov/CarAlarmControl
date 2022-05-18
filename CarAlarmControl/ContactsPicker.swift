//
//  ContactsPicker.swift
//  CarAlarmControl
//
//  Created by Павел Барташов on 10.05.2022.
//

import SwiftUI
//import UIKit

import ContactsUI

struct ContactsPicker: UIViewControllerRepresentable {
    var title: String



    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }


    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()

            let button = UIButton()

            button.setTitle(title, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(context.coordinator, action: #selector(Coordinator.showContacts), for: .touchUpInside)


        viewController.view.addSubview(button)

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: viewController.view.topAnchor),
            button.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor)
        ])

        //        pageViewController.view.backgroundColor = .blue
//        picker.delegate = context.coordinator
//        picker.view.backgroundColor = .gray
        return viewController
    }

    func updateUIViewController(_ viewController: UIViewController, context: Context) {
    }






    class Coordinator: NSObject, CNContactPickerDelegate {
        var parent: ContactsPicker
        //        var controllers = [UIViewController]()

        init(_ parent: ContactsPicker) {
            self.parent = parent
            //            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }

//        func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
//            print("Selected a contact")
//            //            parent.dismiss()
//        }

        func contactPicker(_ picker: CNContactPickerViewController, didSelect contactProperty: CNContactProperty) {
            print("Selected a property")
            print(contactProperty.value)
        }

        @objc
        func showContacts() {
            let picker = CNContactPickerViewController()
            picker.delegate = self
            picker.displayedPropertyKeys = [CNContactPhoneNumbersKey]
            picker.predicateForEnablingContact = NSPredicate(format: "phoneNumbers.@count > 0",
                                                             argumentArray: nil)

            UIApplication
                .shared
                .connectedScenes
                .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                .first { $0.isKeyWindow }?.rootViewController?.present(picker, animated: true)
        }

    }
}

