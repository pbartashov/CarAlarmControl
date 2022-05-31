////
////  PhoneField.swift
////  CarAlarmControl
////
////  Created by Павел Барташов on 18.05.2022.
////
//
//import SwiftUI
//
//struct PhoneField: View {
//    let formatter: PhoneNumberFormatter
//    var placeholder: String
//    @Binding var phoneNumber: String
//    //    @Binding var displayedText: String
//
//    //    @State private var text: String
//
//    @PhoneNumber var number: String
//
//
//    init(placeholder: String, phoneNumber: Binding<String>) {
//        self.formatter = PhoneNumberFormatter()
//        self.placeholder = placeholder
//        self._phoneNumber = phoneNumber
//        //        self._displayedText = State(initialValue: phoneNumber.wrappedValue)
//        //        self._displayedText = Binding(
//
//        self._number = PhoneNumber(binding: phoneNumber)
//    }
//
//    var body: some View {
//
//        TextField(placeholder, text: $number)
//        //            .onChange(of: displayedText) { newValue in
//        //                displayedText = formatter.formDisplayedText(from: newValue)
//        //
//        //                if phoneNumber != displayedText {
//        //                    phoneNumber = displayedText
//        //                }
//        //            }
//        //            .onChange(of: phoneNumber) { newValue in
//        //                let formatted = formatter.formDisplayedText(from: newValue)
//        //
//        //                if displayedText != formatted {
//        //                    displayedText = formatted
//        //                }
//        //            }
//            .keyboardType(.phonePad)
//    }
//}
//
//struct PhoneField_Previews: PreviewProvider {
//    static var previews: some View {
//        PhoneField(placeholder: "90", phoneNumber: .constant("95"))
//    }
//}
//
//
//@propertyWrapper class PhoneNumber {
//    let formatter = PhoneNumberFormatter()
//    @Binding var text: String
//
//    //    var wrappedValue: String {
//    //        didSet {
//    //            let formatted = formatter.formPhoneNumber(from: wrappedValue)
//    //            if formatted != wrappedValue {
//    //                wrappedValue = formatted
//    //            }
//    //        }
//    //   }
//
//    var wrappedValue: String {
//        get {
//            text
//        }
//        set {
//            let formatted = formatter.formPhoneNumber(from: newValue)
//            //            if formatted != text {
//            text = formatted
//            //            }
//        }
//    }
//
//    //    var displayedText: String {
//    //        get {
//    //            formatter.formDisplayedText(from: wrappedValue)
//    //        }
//    //    }
//
//    var projectedValue: Binding<String> {
//        Binding(
//            get: { [self] in
//                formatter.formDisplayedText(from: text)
//            },
//            set: { [self] in
//                wrappedValue = $0
//            }
//        )
//
//    }
//
//    init(binding: Binding<String>) {
//        self._text = binding
//    }
//}
