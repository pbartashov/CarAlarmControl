//
//  ContentView.swift
//  Car Alarm Control
//
//  Created by Павел Барташов on 20.04.2022.
//

import SwiftUI

extension TabView {

    func myTabViewStyle() -> some View {
        self.background(LinearGradient(Color.darkStart, Color.darkEnd))              // Replace 'BackgroundImage' with your image name
        // or   self.background(Image(systemName: "questionmark.square"))
//            .frame(width: 200, height: 500, alignment: .top)   // Optional, but shows the background
            .opacity(0.)                                      // Again optional, but shows the effect

        // etc, with other View modifiers, choose the ones you need

    }
}

struct ContentView: View {
//    @State private var lock = true

//    init() {
//        UITabBar.appearance().backgroundColor = UIColor.blue
//    }

    var body: some View {
        ZStack {
            LinearGradient(Color.darkStart, Color.darkEnd)

            TabView {
                ControlView()
                    .tabItem {
                        Image(systemName: "circle.grid.cross")
                    }
                Text("Another Tab")
                    .tabItem {
                        Image(systemName: "gearshape")
                    }
            }
            .myTabViewStyle()
            

        
        }
        //        .foregroundColor(.purple)
        //        .background(LinearGradient(Color.darkStart, Color.darkEnd))

        .edgesIgnoringSafeArea(.all)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
