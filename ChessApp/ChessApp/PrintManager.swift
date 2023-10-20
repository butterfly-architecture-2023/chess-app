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
        for row in group {
            for value in row {
                print(value.rawValue, terminator: " ")
            }
            print()
        }
    }
}
