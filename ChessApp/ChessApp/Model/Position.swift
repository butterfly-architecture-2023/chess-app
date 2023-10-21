//
//  Position.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/15.
//

import Foundation

struct Position: Hashable, CustomStringConvertible {
    struct Rank: Hashable, CustomStringConvertible {
        static let range: Range<Int> = 0..<8
        private(set) var rawValue: Int
        
        init?(_ value: Int) {
            guard Self.range ~= value else { return nil }
            self.rawValue = value
        }
        
        init?(_ value: Character) {
            guard let value = value.asciiValue,
                  value >= 49 else { return nil }
            self.init(Int(value) - 49) // value - "1"
        }
        
        static var allCases: [Rank] {
            range.compactMap { Rank($0) }
        }
        
        var description: String {
            "\(rawValue + 1)"
        }
    }
    
    struct File: Hashable, CustomStringConvertible {
        static let range: Range<Int> = 0..<8
        private(set) var rawValue: Int
        
        init?(_ value: Int) {
            guard Self.range ~= value else { return nil }
            self.rawValue = value
        }
        
        init?(_ value: Character) {
            guard let value = value.asciiValue,
                  value >= 65 else { return nil }
            self.init(Int(value) - 65) // value - "A"
        }
        
        static var allCases: [File] {
            range.compactMap { File($0) }
        }
        
        var description: String {
            guard let unicodeScalar = UnicodeScalar(65 + rawValue) else {
                return "?"
            }
            return String(unicodeScalar)
        }
    }
    
    let file: File
    let rank: Rank
    
    init(file: File, rank: Rank) {
        self.file = file
        self.rank = rank
    }
    
    init?(_ value: String) {
        let value = Array(value.uppercased())
        guard value.count == 2,
              let file = File(value[0]),
              let rank = Rank(value[1]) else { return nil }
        self.init(file: file, rank: rank)
    }
    
    var description: String {
        return file.description + rank.description 
    }
}
