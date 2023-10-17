//
//  PawnsGenerator.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/18.
//

import Foundation

protocol PawnsManager {
    func resetPawns()
    func getPawn(at location: Location) -> Pawn?
    func update(originPawn: Pawn, to destination: Location)
    func hasPawn(at location: Location) -> Bool
    func getPawns(color: Color) -> [Pawn]
}

final class PawnsManagerImpl: PawnsManager {
    private var pawns: [Location: Pawn] = [:]
    
    func resetPawns() {
        self.pawns.removeAll()
        
        let pawns = self.makePawns()
        for pawn in pawns {
            self.pawns[pawn.currentLocation] = pawn
        }
    }
    
    private func makePawns() -> [Pawn] {
        return Color.allCases
            .map({ color in
                switch color {
                case .black:
                    return File.allCases.map({ file in
                        return Pawn(color: .black, currentLocation: Location(file: file, rank: .two))
                    })
                case .white:
                    return File.allCases.map({ file in
                        return Pawn(color: .white, currentLocation: Location(file: file, rank: .seven))
                    })
                }
            })
            .flatMap({ $0 })
    }
    
    func getPawn(at location: Location) -> Pawn? {
        return self.pawns[location]
    }
    
    func update(originPawn: Pawn, to destination: Location) {
        self.pawns[originPawn.currentLocation] = nil
        self.pawns[destination] = Pawn(color: originPawn.color, currentLocation: destination)
    }
    
    func hasPawn(at location: Location) -> Bool {
        self.pawns[location] != nil
    }
    
    func getPawns(color: Color) -> [Pawn] {
        return self.pawns.values.filter({ $0.color == color })
    }
    
}
