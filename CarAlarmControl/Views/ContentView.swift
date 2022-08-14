//
//  ContentView.swift
//  Car Alarm Control
//
//  Created by Павел Барташов on 20.04.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var controller = CarAlarmController()
    @State private var tabSelection = 0

    var body: some View {
        TabView(selection : $tabSelection) {
            ControlView()
                .edgesIgnoringSafeArea(.all)
                .tag(0)
            VStack {
                HStack(alignment: .center, spacing: 4) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.blue)
                        .font(.system(size: 23, weight: .medium))

                    Button {
                        withAnimation {
                            tabSelection -= 1
                        }
                    } label: {
                        Text("Back")
                        //                            .multilineTextAlignment(.leading)
                    }

                    Spacer()
                }
                .padding([.horizontal, .top])

                SettingsView()
            }
            .tag(1)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .task {
            if controller.needPhoneNumbers {
                withAnimation {
                    tabSelection = 1
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .environmentObject(controller)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CarAlarmController())
    }
}
