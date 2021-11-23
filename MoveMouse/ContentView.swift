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
}

struct ContentView: View {
    var body: some View {
        Text("Go Move mouse")
            .lineLimit(nil)
            .padding([.top, .leading, .bottom], 10.0)
            .frame(width: 200.0, height: 50.0)
        Button("Move mouse") {
            jerry.go = true
            print("let's go !",jerry.go)
            DispatchQueue.global().async {
                moveAroundAndLeftClick()
            }
        }
        .padding([.top, .leading, .bottom], 10.0)
        .frame(width: 200.0, height: 50.0)
        Button("Stop mouse") {
            jerry.go = false
            print("Stop!", jerry.go)            
        }
        .padding([.top, .leading, .bottom], 10.0)
        .frame(width: 200.0, height: 50.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



