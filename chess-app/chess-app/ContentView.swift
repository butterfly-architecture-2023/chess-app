//
//  ContentView.swift
//  chess-app
//
//  Created by 윤소희 on 2023/10/14.
//

import SwiftUI

struct ContentView: View {
    var board = Board()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
