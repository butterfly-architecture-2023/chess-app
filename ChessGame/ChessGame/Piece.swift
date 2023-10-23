//
//  Piece.swift
//  ChessGame
//
//  Created by 오킹 on 2023/10/18.
//

import Foundation

struct Piece: Equatable {

    enum Color {
        case black
        case white
    }
    
    enum Category: Equatable {
        case pawn(color: Color)
        case empty
        
        var unicode: String {
            switch self {
            case .pawn(let color):
                return color == .black ? "\u{265F}" : "\u{2659}"
            case .empty:
                return "\u{002E}"
            }
        }
    }
    
    let category: Category
    
    // 프로그래밍 요구사항 7.
    // 체스말은 현재 위치를 기준으로 이동할 수 있는 모든 위치를 제공한다.
    // 다른 말이 있는지 여부는 판단하지 않는다.
    func movablePositions(current: Position) -> [Position] {
        
        switch category {
        case .pawn(let color):
            
            switch color {
            case .black:
                return [.init(file: current.file, rank: current.rank + 1)]
                
            case .white:
                return [.init(file: current.file, rank: current.rank - 1)]
            }
   
        case .empty:
            return []
        }
    }
}
