//
//  ChessGrid.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/29.
//

import SwiftUI

struct ChessGrid: View {
  @ObservedObject var position: Position
  let subject: ActionPublisher
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 5.0)
        .fill(Color.white)
        .shadow(color: .black.opacity(0.12), radius: 5, x: 3, y: 0)
      Text(position.piece?.typeDesc ?? "")
      if position.isHighlighted {
        RoundedRectangle(cornerRadius: 5.0)
          .fill(Color.red.opacity(0.5))
      }
    }
    .aspectRatio(1, contentMode: .fit)
    .animation(.easeInOut, value: position.isHighlighted)
    .onTapGesture {
      subject.send(position)
    }
  }
}

#Preview {
  let position = Position(Column.A, Row.two)
  position.piece = Pawn(.black)
  return ChessGrid(position: position, subject: ActionPublisher())
}
