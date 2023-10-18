//
//  Position.swift
//  ChessApp
//
//  Created by Se Eun Lee on 2023/10/18.
//

import Foundation

struct Position: Equatable, CustomStringConvertible, Hashable {
    var rank: Rank
    var file: File

    var description: String { return "\(file)\(rank)" }

    init(_ rank: Rank, _ file: File) {
        self.rank = rank
        self.file = file
    }
}

enum Rank: Int, CaseIterable, CustomStringConvertible {
    case one = 1, two, three, four, five, six, seven, eight

    var description: String { return "\(self.rawValue)" }
}

enum File: String, CaseIterable {
    case A, B, C, D, E, F, G, H

    var value: Int {
        return (File.allCases.firstIndex(of: self) ?? 0) +  1
    }

    init?(_ column: Int) {
        guard column <= File.allCases.count else { return nil }
        self = File.allCases[column - 1]
    }
}
