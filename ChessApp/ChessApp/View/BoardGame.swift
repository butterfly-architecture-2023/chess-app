//
//  BoardGame.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/29.
//

import SwiftUI

struct BoardGame: View {
  @State var localError: Error?
  let board = Board()
  
  var body: some View {
    VStack(spacing: 16) {
      InfoArea(board: board)
        .padding(.horizontal)
      
      SimpleLine()
        .padding(.horizontal)
      
      BoardView(
        localError: $localError,
        board: board)
      .padding(.horizontal)
      
      SimpleLine()
        .padding(.horizontal)
      
      ErrorPresenterView(localError: $localError)
        .padding(.horizontal)
      
      Spacer()
    }
  }
}

#Preview {
  BoardGame()
}
