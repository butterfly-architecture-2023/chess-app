//
//  ContentView.swift
//  Chess_game
//
//  Created by 박진섭 on 10/13/23.
//

import SwiftUI

struct SelectGameTypeView: View {
    @State private var showChessBoardView: Bool = false

    var body: some View {
        VStack {
            Button("Chess") {
                
            }
        }
        .padding()
        .fullScreenCover(isPresented: $showChessBoardView, content: {
            ChessBoardView()
        })
    }
}

struct ChessBoardView: View {
    var body: some View {
        Text("Chess")
    }
}
