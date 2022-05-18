////
////  File2.swift
////  CarAlarmControl
////
////  Created by Павел Барташов on 05.05.2022.
////
//
//import SwiftUI
//import ContactsUI
//
//struct ContactPickerView: UIViewControllerRepresentable {
//
//    @Environment(\.dismiss) var dismiss
//
//    func makeUIViewController(context: Context) -> UINavigationController {
//        let navController = UINavigationController()
//        let controller = CNContactPickerViewController()
//        controller.delegate = context.coordinator
//        navController.present(controller, animated: false, completion: nil)
//        return navController
//    }
//
//    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
//        print("Updating the contacts controller!")
//    }
//
//    // MARK: ViewController Representable delegate methods
//    func makeCoordinator() -> ContactsCoordinator {
//        return ContactsCoordinator(self)
//    }
//
//    class ContactsCoordinator : NSObject, UINavigationControllerDelegate, CNContactPickerDelegate {
//        let parent: ContactPickerView
//        public init(_ parent: ContactPickerView) {
//            self.parent = parent
//        }
//
//        func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
//            print("Contact picked cancelled!")
//            parent.dismiss()
//        }
//
//        func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
//            print("Selected a contact")
//            parent.dismiss()
//        }
//    }
//}
