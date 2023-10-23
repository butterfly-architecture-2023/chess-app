//
//  File.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/24.
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
    
    init?(_ character: Character) {
        guard let file = File(rawValue: String(character)) else {
            return nil
        }
        
        self = file
    }
}
