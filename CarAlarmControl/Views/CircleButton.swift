//
//  CircleButton.swift
//  Car Alarm Control
//
//  Created by Павел Барташов on 20.04.2022.
//

import SwiftUI

struct ButtonBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        if isHighlighted {
            shape
                .fill(LinearGradient(Color.deeperDarkStart, Color.deeperDarkEnd))
                .overlay(shape.stroke(LinearGradient(Color.lightStart, Color.lightEnd), lineWidth: 4))
                .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
        } else {
            shape
                .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                .overlay(shape.stroke(LinearGradient(Color.lightStart, Color.lightEnd), lineWidth: 4))
                .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
        }
    }
}

struct CircleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        CarAlarmButtonStyle(shape: Circle(), padding: 30)
            .makeBody(configuration: configuration)
    }
}

struct CapsuleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        CarAlarmButtonStyle(shape: Capsule(), padding: 25)
            .makeBody(configuration: configuration)
    }
}

struct CarAlarmButtonStyle<S: Shape>: ButtonStyle {
    var shape: S
    var padding: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(padding)
            .contentShape(shape)
            .background(
                ButtonBackground(isHighlighted: configuration.isPressed, shape: shape)
            )
            .transaction { transaction in
                transaction.animation = nil
            }
    }
}
