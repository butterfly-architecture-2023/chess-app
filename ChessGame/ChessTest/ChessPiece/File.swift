//
//  File.swift
//  ChessGame
//
//  Created by 강호성 on 10/18/23.
//

import Foundation

enum File: String, CaseIterable {
    case A
    case B
    case C
    case D
    case E
    case F
    case G
    case H

    var index: Int {
        switch self {
        case .A: 0
        case .B: 1
        case .C: 2
        case .D: 3
        case .E: 4
        case .F: 5
        case .G: 6
        case .H: 7
        }
    }
}
