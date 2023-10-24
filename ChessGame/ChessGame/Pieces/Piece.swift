//
//  Piece.swift
//  ChessGame
//
//  Created by 오킹 on 2023/10/18.
//

import Foundation

// 프로그래밍 요구사항 7.
// 체스말은 현재 위치를 기준으로 이동할 수 있는 모든 위치를 제공한다.
// 다른 말이 있는지 여부는 판단하지 않는다.
protocol Piece: CustomStringConvertible {
    static var score: Int { get }
    static var color: Color { get }
    
    func movablePositions(current: Position) -> [Position]
}

protocol WhitePiece: Piece { }

protocol BlackPiece: Piece { }

extension WhitePiece {
    static var color: Color { return .white  }
}

extension BlackPiece {
    static var color: Color { return .black  }
}

