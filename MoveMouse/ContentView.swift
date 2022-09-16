//
//  ContentView.swift
//  MoveMouse
//
//  Created by Alejandro Cordon Urena on 23/11/21.
//

import SwiftUI
import Cocoa
import Foundation



struct jerry {
    static var go = false
    static var timeInt = 5_000_000
}

struct ContentView: View {
    @State private var time: String = "5"
    @State private var buttonBackColor:Color = .yellow
    
    var body: some View {
        VStack {
            Text("Go Move mouse")
                .lineLimit(nil)
                .padding([.top, .leading, .bottom], 10.0)
                .frame(width: 200.0, height: 30.0)
            
            Text("Time between movements (segs)")
                .lineLimit(nil)
                .padding([.top, .leading, .bottom], 5.0)
                .frame(width: 250.0, height: 20.0)
            
            TextField(
                    "Time between movements (segs)",
                    text: $time
                )
                .onSubmit {
                    print("let's go !",jerry.timeInt)
                }
                .disableAutocorrection(true)
            
                
            Button("Move mouse") {
                jerry.go = true
                jerry.timeInt = Int(time)!
                print("let's go !",jerry.timeInt)
                self.buttonBackColor = .green
                DispatchQueue.global().async {
                    moveAroundAndLeftClick()
                }
            }
            .padding([.top, .leading, .bottom], 10.0)
            .frame(width: 200.0, height: 30.0)
            
            Button("Stop mouse") {
                jerry.go = false
                self.buttonBackColor = .red
                print("Stop!", jerry.go)
            }
            .padding([.top, .leading, .bottom], 10.0)
            .frame(width: 200.0, height: 30.0)
        }
        .background(buttonBackColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



