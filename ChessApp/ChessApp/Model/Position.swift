//
//  Position.swift
//  ChessApp
//
//  Created by Jiyeon  on 2023/10/16.
//

import Foundation

struct Position: Equatable, Comparable {
    static func < (lhs: Position, rhs: Position) -> Bool {
        return lhs.rank.rawValue < rhs.rank.rawValue && lhs.file.rawValue < rhs.file.rawValue
    }
    
    enum Rank: Int, CaseIterable {
        case one, two, three, four, five, six, seven, eight
        
        var displayText: String {
            return "\(self.rawValue + 1)"
        }
    }
    
    enum File: Int, CaseIterable {
        case A, B, C, D, E, F, G, H
        
        var displayText: String {
            return String(describing: self)
        }
    }
    
    let rank: Rank
    let file: File
    
    func getInitAvailableColor() -> Color? {
        switch rank {
        case .one, .two:
            return .black
        case .seven, .eight:
            return .white
        default:
            return nil
        }
    }
}
