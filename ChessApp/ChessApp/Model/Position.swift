//
//  Position.swift
//  ChessApp
//
//  Created by Jiyeon  on 2023/10/16.
//

import Foundation

struct Position {
    enum Rank: Int, CaseIterable {
        case one, two, three, four, five, six, seven, eight
    }
    
    enum File: Int, CaseIterable {
        case A, B, C, D, E, F, G, H
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
