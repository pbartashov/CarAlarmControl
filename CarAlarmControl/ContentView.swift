//
//  ContentView.swift
//  Car Alarm Control
//
//  Created by Павел Барташов on 20.04.2022.
//

import SwiftUI

struct ContentView: View {
//    @State private var lock = true
//    @StateObject
    @StateObject var controller = CarAlarmController()
    @State var tabSelection = 0
    
//    init() {
//        UITabBar.appearance().backgroundColor = UIColor.blue
//    }

    var body: some View {

        TabView(selection : $tabSelection) {
                ControlView()
                    .edgesIgnoringSafeArea(.all)
                    .tag(0)


            VStack {
                HStack(alignment: .center, spacing: 8) {
                    
                    Image(systemName: "chevron.backward")

                    Button {
                        withAnimation {
                            tabSelection -= 1
                        }

                    } label: {
                        Text("Back")
                            .multilineTextAlignment(.leading)
                    }

                    Spacer()
                }

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


        
//        }
        //        .foregroundColor(.purple)
        //        .background(LinearGradient(Color.darkStart, Color.darkEnd))


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
