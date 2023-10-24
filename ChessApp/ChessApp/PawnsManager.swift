//
//  PawnsGenerator.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/18.
//

import Foundation

protocol PawnsManager {
    func resetPawns()
    func getPawn(at position: Position) -> Pawn?
    func update(from source: Position, to destination: Position)
    func hasPawn(at position: Position) -> Bool
    func getPawns(color: Color) -> [Pawn]
}

final class PawnsManagerImpl: PawnsManager {
    private var pawns: [Position: Pawn] = [:]
    
    func resetPawns() {
        self.pawns = self.makePawns()
    }
    
    private func makePawns() -> [Position: Pawn] {
        var pawns: [Position: Pawn] = [:]
        
        for file in File.allCases {
            for color in Color.allCases {
                switch color {
                case .black:
                    let position = Position(file: file, rank: .two)
                    pawns[position] = Pawn(color: .black, currentPosition: position)
                case .white:
                    let position = Position(file: file, rank: .seven)
                    pawns[position] = Pawn(color: .white, currentPosition: position)
                }
            }
        }
        
        return pawns
    }
    
    func getPawn(at position: Position) -> Pawn? {
        return self.pawns[position]
    }
    
    func update(from source: Position, to destination: Position) {
        guard let pawn = self.getPawn(at: source) else { return }
        
        self.pawns[pawn.currentPosition] = nil
        self.pawns[destination] = Pawn(color: pawn.color, currentPosition: destination)
    }
    
    func hasPawn(at position: Position) -> Bool {
        self.pawns[position] != nil
    }
    
    func getPawns(color: Color) -> [Pawn] {
        return self.pawns.values.filter({ $0.color == color })
    }
    
}
