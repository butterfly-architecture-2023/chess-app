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
    var text: String { get }
    
    func canMove(to location: Location) -> Bool
}

struct Pawn: PawnConfigurable {
    let score: Int = 1
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
    
    var text: String {
        switch self.color {
        case .black:
            return "♟"
        case .white:
            return "♙"
        }
    }
}


