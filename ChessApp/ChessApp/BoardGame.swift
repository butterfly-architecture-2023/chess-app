//
//  BoardGame.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/29.
//

import SwiftUI

struct BoardGame: View {
  let board = Board()
  var body: some View {
    VStack(spacing: 16) {
      InfoArea(board: board)
        .padding(.horizontal)
      
      BoardView(board: board)
    }
  }
}

#Preview {
  BoardGame()
}
