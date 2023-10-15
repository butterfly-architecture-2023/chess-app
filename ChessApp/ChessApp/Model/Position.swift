//
//  Position.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/15.
//

import Foundation

struct Position: Hashable {
    struct Rank: Hashable {
        private(set) var value: UInt8
        
        init?(_ value: UInt8) {
            guard 0..<8 ~= value else { return nil }
            self.value = value
        }
        
        init?(_ value: Character) {
            guard let value = value.asciiValue else { return nil }
            self.init(value - 50) // value - "1"
        }
    }
    
    struct File: Hashable {
        private(set) var value: UInt8
        
        init?(_ value: UInt8) {
            guard 0..<8 ~= value else { return nil }
            self.value = value
        }
        
        init?(_ value: Character) {
            guard let value = value.asciiValue else { return nil }
            self.init(value - 65) // value - "A"
        }
    }
    
    let file: File
    let rank: Rank
    
    init(file: File, rank: Rank) {
        self.file = file
        self.rank = rank
    }
    
    init?(_ value: String) {
        let value = Array(value)
        guard value.count == 2,
              let file = File(value[0]),
              let rank = Rank(value[1]) else { return nil }
        self.init(file: file, rank: rank)
    }
}
