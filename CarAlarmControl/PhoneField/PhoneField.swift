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
                setTexts(with: newValue)
            }
            .onChange(of: text) { newValue in
                setTexts(with: newValue)
            }
            .keyboardType(.phonePad)
    }

    private func setTexts(with value: String) {
        let formatted = formatter.formDisplayedText(from: value)
        if displayedText != formatted {
            displayedText = formatted
        }

        let number = formatter.formPhoneNumber(from: value)
        if text != number {
            text = number
        }
    }
}

struct PhoneField_Previews: PreviewProvider {
    static var previews: some View {
        PhoneField(placeholder: "90", text: .constant("95"))
    }
}
