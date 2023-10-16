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
}
