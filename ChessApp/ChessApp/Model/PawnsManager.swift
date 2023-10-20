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
    func update(from source: Location, to destination: Location)
    func hasPawn(at location: Location) -> Bool
    func getPawns(color: Color) -> [Pawn]
}

final class PawnsManagerImpl: PawnsManager {
    private var pawns: [Location: Pawn] = [:]
    
    func resetPawns() {
        self.pawns = self.makePawns()
    }
    
    private func makePawns() -> [Location: Pawn] {
        var pawns: [Location: Pawn] = [:]
        
        for file in File.allCases {
            for color in Color.allCases {
                switch color {
                case .black:
                    let location = Location(file: file, rank: .two)
                    pawns[location] = Pawn(color: .black, currentLocation: location)
                case .white:
                    let location = Location(file: file, rank: .seven)
                    pawns[location] = Pawn(color: .white, currentLocation: location)
                }
            }
        }
        
        return pawns
    }
    
    func getPawn(at location: Location) -> Pawn? {
        return self.pawns[location]
    }
    
    func update(from source: Location, to destination: Location) {
        guard let pawn = self.pawns[source] else { return }
        
        self.pawns[pawn.currentLocation] = nil
        self.pawns[destination] = Pawn(color: pawn.color, currentLocation: destination)
    }
    
    func hasPawn(at location: Location) -> Bool {
        self.pawns[location] != nil
    }
    
    func getPawns(color: Color) -> [Pawn] {
        return self.pawns.values.filter({ $0.color == color })
    }
    
}
