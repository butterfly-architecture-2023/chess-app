//
//  PawnsGenerator.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/18.
//

import Foundation

protocol PiecesManagerable {
    func resetPieces()
    func piece(at position: Position) -> Piece?
    func update(from source: Position, to destination: Position)
    func hasPiece(at position: Position) -> Bool
    func pieces(color: Color) -> [Piece]
}

final class PieceManager: PiecesManagerable {
    private var pieces: [Position: Piece] = [:]
    
    func resetPieces() {
        self.pieces = self.makePieces()
    }
    
    private func makePieces() -> [Position: Piece] {
        var pieces: [Position: Piece] = [:]
        self.updatePieces(&pieces, type: Pawn.self)
        self.updatePieces(&pieces, type: Bishop.self)
        self.updatePieces(&pieces, type: Rook.self)
        self.updatePieces(&pieces, type: Queen.self)
        self.updatePieces(&pieces, type: Knight.self)
        return pieces
    }
    
    private func updatePieces(_ pieces: inout [Position: Piece], type pieceType: Piece.Type) {
        for color in Color.allCases {
            let positions = pieceType.postionsCanCreate(of: color)
            
            for position in positions {
                pieces[position] = pieceType.init(color: color, source: position)
            }
        }
    }
    
    func piece(at position: Position) -> Piece? {
        return self.pieces[position]
    }
    
    func update(from source: Position, to destination: Position) {
        guard let piece = self.piece(at: source) else { return }
        
        self.pieces[piece.source] = nil
        self.pieces[destination] = type(of: piece).init(color: piece.color, source: destination)
    }
    
    func hasPiece(at position: Position) -> Bool {
        self.pieces[position] != nil
    }
    
    func pieces(color: Color) -> [Piece] {
        return self.pieces.values.filter({ $0.color == color })
    }
    
}
