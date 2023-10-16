//
//  PrintManager.swift
//  ChessApp
//
//  Created by elly on 10/16/23.
//

import Foundation

class PrintManager {
    private(set) var board: Board = [[]]
    
    init(board: Board) {
        self.board = board
    }
    
    // FIXME: - 확인을 위한 임시 출력
    func printBoard() {
        print("---")
        for row in board {
            for value in row {
                print(value.rawValue, terminator: " ")
            }
            print()
        }
    }
}
