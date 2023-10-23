//
//  PrintManager.swift
//  ChessApp
//
//  Created by elly on 10/16/23.
//

import Foundation

class PrintManager {
    enum ChessDescriptionType: String {
        case initBoard = "체스 보드를 초기화했습니다."
        case inputText = "명령을 입력하세요> "
        
        var description: String {
            return self.rawValue
        }
    }
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
        print("  A B C D E F G H")
        for (index, row) in pieceGroup.enumerated() {
            if index % 8 == 0 {
                print(index / 8 + 1, terminator: " ")
            }
            for icon in row.value.showIcon() {
                print(icon, terminator: " ")
            }
            if (index + 1) % 8 == 0 {
                print()
            }
        }
        print()
    }
    
    func showDescription(_ type: ChessDescriptionType) {
        print(type.description)
    }
}
