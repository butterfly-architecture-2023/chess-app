//
//  Board+File.swift
//  ChessApp
//
//  Created by 김혜지 on 10/15/23.
//

extension Board {
    enum File: CaseIterable, CustomStringConvertible {
        case a
        case b
        case c
        case d
        case e
        case f
        case g
        case h
        
        var description: String {
            switch self {
            case .a:
                return "A"
            case .b:
                return "B"
            case .c:
                return "C"
            case .d:
                return "D"
            case .e:
                return "E"
            case .f:
                return "F"
            case .g:
                return "G"
            case .h:
                return "H"
            }
        }
    }
}
