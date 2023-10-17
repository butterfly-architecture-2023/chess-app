//
//  PawnsGenerator.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/18.
//

import Foundation

protocol PawnsManager {
    func setupPawns()
    func gatPawn(at location: Location) -> Pawn?
    func getPawns(color: Color) -> [Pawn]
}

final class PawnsManagerImpl: PawnsManager {
    private var pawns: [Location: Pawn] = [:]
    
    func setupPawns() {
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
                    return Capital.allCases.map({ capital in
                        return Pawn(color: .black, currentLocation: Location(capital: capital, rank: .two))
                    })
                case .white:
                    return Capital.allCases.map({ capital in
                        return Pawn(color: .white, currentLocation: Location(capital: capital, rank: .seven))
                    })
                }
            })
            .flatMap({ $0 })
    }
    
    func gatPawn(at location: Location) -> Pawn? {
        return self.pawns[location]
    }
    
    func getPawns(color: Color) -> [Pawn] {
        return self.pawns.values.filter({ $0.color == color })
    }
    
}
