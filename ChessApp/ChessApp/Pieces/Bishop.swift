//
//  Bishop.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/26.
//

import Foundation

struct Bishop: Piece {
    let score: Int = 3
    let color: Color
    let currentPosition: Position
    
    var text: String {
        switch self.color {
        case .black:
            return "♝"
        case .white:
            return "♗"
        }
    }
    
    func canMove(to position: Position) -> Bool {
        guard self.currentPosition != position else {
            return false
        }
        
        let distanceOfFile = self.currentPosition.file.distance(with: position.file)
        let distanceOfRank = self.currentPosition.rank.distance(with: position.rank)
        
        return distanceOfFile == distanceOfRank
    }
    
    static  func postionsCanCreate(of color: Color) -> [Position] {
        switch color {
        case .black:
            return [Position(file: .C, rank: .one), Position(file: .F, rank: .one)]
        case .white:
            return [Position(file: .C, rank: .eight), Position(file: .F, rank: .eight)]
        }
    }
    
}
