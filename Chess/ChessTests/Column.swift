//
//  Column.swift
//  ChessTests
//
//  Created by ByungHoon Ann on 2023/10/16.
//

enum Column: String, CaseIterable {
    case a = "A"
    case b = "B"
    case c = "C"
    case d = "D"
    case e = "E"
    case f = "F"
    case g = "G"
    case h = "H"
    
    var number: Int {
        switch self {
        case .a:
            return 0
        case .b:
            return 1
        case .c:
            return 2
        case .d:
            return 3
        case .e:
            return 4
        case .f:
            return 5
        case .g:
            return 6
        case .h:
            return 7
        }
    }
}
