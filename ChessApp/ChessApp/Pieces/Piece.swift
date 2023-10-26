//
//  Piece.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/26.
//

import Foundation

protocol Piece {
    var score: Int { get }
    var color: Color { get }
    var currentPosition: Position { get }
    var text: String { get }
    
    init(color: Color, currentPosition: Position)
    
    func canMove(to position: Position) -> Bool
    static func postionsCanCreate(of color: Color) -> [Position]
}
