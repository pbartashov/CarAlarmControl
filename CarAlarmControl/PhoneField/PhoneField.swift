//
//  PhoneField.swift
//  CarAlarmControl
//
//  Created by Павел Барташов on 18.05.2022.
//

import SwiftUI

struct PhoneField: View {
    private let formatter: PhoneNumberFormatter
    private var placeholder: String
    @State private var displayedText: String
    @Binding private var text: String

    init(placeholder: String, text: Binding<String>) {
        self.formatter = PhoneNumberFormatter()
        self.placeholder = placeholder
        self._text = text
        self._displayedText = State(initialValue:
                                        formatter.formDisplayedText(from: text.wrappedValue))
    }

    var body: some View {
        TextField(placeholder, text: $displayedText)
            .onChange(of: displayedText) { newValue in
                displayedText = formatter.formDisplayedText(from: newValue)

                let number = formatter.formPhoneNumber(from: displayedText)
                if text != number {
                    text = number
                }
            }
            .onChange(of: text) { newValue in
                let formatted = formatter.formDisplayedText(from: newValue)
                if displayedText != formatted {
                    displayedText = formatted
                }
            }
            .keyboardType(.phonePad)
    }
}

struct PhoneField_Previews: PreviewProvider {
    static var previews: some View {
        PhoneField(placeholder: "90", text: .constant("95"))
    }
}
