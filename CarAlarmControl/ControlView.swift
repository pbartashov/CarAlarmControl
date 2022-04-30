//
//  ControlView.swift
//  CarAlarmControl
//
//  Created by Павел Барташов on 24.04.2022.
//

import SwiftUI

struct ControlView: View {
    let controller: RemoteController = CarAlarmController()

    var body: some View {
        ZStack {
            LinearGradient(Color.darkStart, Color.darkEnd)

            VStack {
                if controller.canLock || controller.canUnlock {
                    Spacer()

                    HStack {
                        if controller.canLock {
                            Spacer()

                            Button(action: {
                                controller.perfom(command: .lock)
                            }) {
                                Image(systemName: "lock")
                                    .foregroundColor(.lightStart)
                                    .font(.system(size: 45))
                            }
                            .buttonStyle(CircleButtonStyle())
                        }

                        Spacer()

                        if controller.canUnlock {
                            Button(action: {
                                controller.perfom(command: .unlock)
                            }) {
                                Image(systemName: "lock.open")
                                    .foregroundColor(.lightStart)
                                    .font(.system(size: 45))
                            }
                            .buttonStyle(CircleButtonStyle())

                            Spacer()
                        }
                    }
                }
//                .padding()

                //                VStack {
                Spacer()

                if controller.canStartEngine {
                    Button(action: {
                        controller.perfom(command: .engineStart)
                    }) {
                        Text("Start")
                            .padding(20)
                            .foregroundColor(.lightStart)
                            .font(.system(size: 30))
                    }
                    .buttonStyle(CircleButtonStyle())

                    Spacer()
                }

                if controller.canStopEngine {
                    Button(action: {
                        controller.perfom(command: .engineStop)
                    }) {
                        Text("Stop")
                            .padding(15)
                            .foregroundColor(.redColor)
                            .font(.system(size: 25))
                    }
                    .buttonStyle(CircleButtonStyle())

                    Spacer()
                }

                if controller.canOpenGate {
                    Button(action: {
                        controller.perfom(command: .openGate)
                    }) {
                        Text("Open gate")
//                                                .padding(15)
                            .foregroundColor(.lightStart)
                            .font(.system(size: 30))
                    }
                    .buttonStyle(CapsuleButtonStyle())

                    Spacer()
                }
            }
        }
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView()
    }
}
