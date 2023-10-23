//
//  Position.swift
//  ChessApp
//
//  Created by Jiyeon  on 2023/10/16.
//

import Foundation

struct Position: Equatable {
    enum Rank: Int, CaseIterable {
        case one, two, three, four, five, six, seven, eight
        
        var displayText: String {
            return "\(self.rawValue + 1)"
        }
        
        func makeRank(by offset: Int) -> Rank? {
            return Rank(rawValue: rawValue + offset) ?? nil
        }
        
    }
    
    enum File: Int, CaseIterable {
        case A, B, C, D, E, F, G, H
        
        var displayText: String {
            return String(describing: self)
        }
        
        func makeFile(by offset: Int) -> File? {
            return File(rawValue: rawValue + offset) ?? nil
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
    
    func makePosition(rankDiff: Int, fileDiff: Int) -> Position? {
        guard let newRank = rank.makeRank(by: rankDiff), let newFile = file.makeFile(by: fileDiff) else { return nil }
        return .init(rank: newRank, file: newFile)
    }
}

extension Position: Comparable {
    static func < (lhs: Position, rhs: Position) -> Bool {
        return lhs.rank.rawValue < rhs.rank.rawValue && lhs.file.rawValue < rhs.file.rawValue
    }
    
}
