//
//  BoardView.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/29.
//

import SwiftUI
import Combine

typealias ActionPublisher = PassthroughSubject<Position, Never>

struct BoardView: View {
  let board: Board
  let actionPublisher = ActionPublisher()
  
  var body: some View {
    VStack(spacing: 4) {
      ForEach(board.positionPerRow, id: \.first?.row) { oneRow in
        HStack(spacing: 4) {
          ForEach(oneRow, id: \.column) { item in
            
            ChessGrid(
              position: item,
              subject: actionPublisher)
            
          }
        }
      }
    }
    .padding(.horizontal)
    .onReceive(actionPublisher, perform: { position in
      print(position)
    })
  }
}

#Preview {
  BoardView(board: Board())
}
