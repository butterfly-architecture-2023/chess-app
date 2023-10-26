//
//  Position.swift
//  SwiftChess
//
//  Created by JK on 2022/06/23.
//

import Foundation

struct Position : Hashable, CustomStringConvertible {
    enum File : Int, Strideable, CustomStringConvertible {
        typealias Stride = Int
        func distance(to other: Position.File) -> Int {
            Stride(other.rawValue) - Stride(self.rawValue)
        }
        
        func advanced(by n: Int) -> Position.File {
            return File(rawValue: numericCast(Stride(self.rawValue) + n))!
        }
                
        case A = 0, B, C, D, E, F, G, H
        
        init?(with character: Character) {
            let value = Int(character.unicodeScalars.first?.value ?? 0)
            self.init(rawValue: value - 65)
        }
        var description: String { return String(UnicodeScalar(UInt8(65+rawValue))) }
    }
    enum Rank : Int, Strideable, CustomStringConvertible {
        typealias Stride = Int
        func distance(to other: Rank) -> Int {
            Stride(other.rawValue) - Stride(self.rawValue)
        }
        
        func advanced(by n: Int) -> Rank {
            return Rank(rawValue: numericCast(Stride(self.rawValue) + n))!
        }

        case R1 = 0, R2, R3, R4, R5, R6, R7, R8
        
        init?(with character: Character) {
            let value = Int(character.unicodeScalars.first?.value ?? 0)
            self.init(rawValue: value - 49)
        }

        var description: String { return "\(rawValue+1)" }
    }
    let rank : Rank
    let column : File
    
    var description: String { return "\(column)\(rank)" }
}
