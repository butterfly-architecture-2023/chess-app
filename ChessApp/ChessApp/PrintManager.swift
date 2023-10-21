//
//  PrintManager.swift
//  ChessApp
//
//  Created by elly on 10/16/23.
//

import Foundation

class PrintManager {
    func showChessBoard(_ group: ChessPieceGroup) {
        print("---")
        // sort
        let pieceGroup = group.sorted {
            if $0.key.rank == $1.key.rank {
                return $0.key.file < $1.key.file
            }
            return $0.key.rank < $1.key.rank
        }
        
        // print
        for (index, row) in pieceGroup.enumerated() {
            for icon in row.value.showIcon() {
                print(icon, terminator: " ")
            }
            if (index + 1) % 8 == 0 {
                print()
            }
        }
        print()
    }
}
