//
//  BoardPieceManager.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/29.
//

import Foundation

struct BoardPieceManager {
  func getNormalBoard() -> [Position] {
    var result = [Position]()
    
    for rowNum in 0..<8 {
      var rows = [Position]()
      
      for columnNum in 0..<8 {
        if let row = rowNum.toRow, let column = columnNum.toColumn {
          rows.append(Position(column, row))
        }
      }
      
      if rowNum == 1 || rowNum == 6 {
        rows.forEach({ $0.piece = Pawn(rowNum == 6 ? .black : .white) })
      } else if rowNum == 0 || rowNum == 7 {
        let comb = specialChessCombination(rowNum == 7 ? .black : .white)
        rows.enumerated().forEach({ inx, position in position.piece = comb[inx] })
      }
      
      result.append(contentsOf: rows)
    }
    
    return result
  }
  
  private func specialChessCombination(_ color: PieceColor) -> [(any Piece)?] {
    [
      Rook(color), Knight(color), Bishop(color), nil,
      Queen(color), Bishop(color), Knight(color), Rook(color)
    ]
  }
}
