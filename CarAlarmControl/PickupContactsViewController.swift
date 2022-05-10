//
//  PickupContactsViewController.swift
//  CarAlarmControl
//
//  Created by Павел Барташов on 05.05.2022.
//

import SwiftUI
//import UIKit

import ContactsUI

struct PickupContactsViewController: UIViewControllerRepresentable {

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    let picker = CNContactPickerViewController()

    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIViewController()
        picker.willMove(toParent: vc)
        vc.addChild(picker)
        vc.view.addSubview(picker.view)

        picker.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            picker.view.topAnchor.constraint(equalTo: vc.view.topAnchor),
            picker.view.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor),
            picker.view.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor),
            picker.view.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor)
        ])

//        pageViewController.view.backgroundColor = .blue
        picker.delegate = context.coordinator
        picker.view.backgroundColor = .gray
        return picker
    }

    func updateUIViewController(_ viewController: UIViewController, context: Context) {

//        picker.view?.sizeToFit()
//
//        (picker.view?.frame).map {
//            picker.view!.widthAnchor.constraint(equalToConstant: $0.width).isActive = true
//            picker.view!.heightAnchor.constraint(equalToConstant: $0.height).isActive = true
//            viewController.preferredContentSize = $0.size
//        }
//        pageViewController.setViewControllers(
//            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }


    func showContacts() {
        let picker = CNContactPickerViewController()

        UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }?.rootViewController?.present(picker, animated: false)
    }



    class Coordinator: NSObject, CNContactPickerDelegate {
        var parent: PickupContactsViewController
//        var controllers = [UIViewController]()

        init(_ pageViewController: PickupContactsViewController) {
            parent = pageViewController
//            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }

        func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
            print("Selected a contact")
//            parent.dismiss()
        }



    }
}
