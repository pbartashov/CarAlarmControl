//
//  Extensions.swift
//  CarAlarmControl
//
//  Created by Павел Барташов on 20.04.2022.
//

import SwiftUI

extension Color {
    static let darkStart = Color(red: 55 / 255, green: 55 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 25 / 255)

    static let deeperDarkStart = Color(red: 50 / 255, green: 50 / 255, blue: 60 / 255)
    static let deeperDarkEnd = Color(red: 20 / 255, green: 20 / 255, blue: 20 / 255)

    static let lightStart = Color(red: 168 / 255, green: 169 / 255, blue: 173 / 255)
    static let lightEnd = Color(red: 87 / 255, green: 86 / 255, blue: 82 / 255)

    static let redColor = Color(red: 236 / 255, green: 98 / 255, blue: 95 / 255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

