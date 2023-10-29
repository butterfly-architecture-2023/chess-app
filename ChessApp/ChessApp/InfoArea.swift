//
//  InfoArea.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/29.
//

import SwiftUI

struct InfoArea: View {
  let board: Board
  var body: some View {
    HStack {
      VStack {
        Text("현재 턴은?")
        Text("Black : ")
        Text("White : ")
      }
      VStack {
        Text(board.currentTurn == .black ? "Black" : "White")
        Text("\(board.score[.black] ?? 0)")
        Text("\(board.score[.white] ?? 0)")
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
}

#Preview {
  InfoArea(board: Board())
}
