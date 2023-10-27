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

extension File: DistanceCalculatable {
    typealias Item = File
    
    func distance(with compared: File) -> Int {
        return compared.amount - self.amount
    }
    
    private var amount: Int {
        switch self {
        case .A:
            return 1
        case .B:
            return 2
        case .C:
            return 3
        case .D:
            return 4
        case .E:
            return 5
        case .F:
            return 6
        case .G:
            return 7
        case .H:
            return 8
        }
    }
    
}
