//
//  Pawn.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/18.
//

import Foundation

protocol PawnConfigurable {
    var color: Color { get }
    var currentLocation: Location { get }
    
    func canMove(to location: Location) -> Bool
}

struct Pawn: PawnConfigurable {
    let color: Color
    let currentLocation: Location
    
    func canMove(to location: Location) -> Bool {
        let currentRank = self.currentLocation.rank
        let destinationRank = location.rank
        
        guard currentRank.distance(with: destinationRank) == 1 else {
            return false
        }
        
        switch self.color {
        case .black:
            return currentRank < destinationRank
        case .white:
            return currentRank > destinationRank
        }
    }
}


