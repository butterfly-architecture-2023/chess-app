//
//  Position.swift
//  ChessApp
//
//  Created by Se Eun Lee on 2023/10/18.
//

import Foundation

struct Position: Equatable, CustomStringConvertible, Hashable {
    private(set) var rank: Rank
    private(set) var file: File

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

// TODO: property wrapper 로 개선 가능한가?
struct Action {
    var rowAction: Int
    var columnAction: Int

    init(rowAction: Int = 0, columnAction: Int = 0) {
        self.rowAction = rowAction
        self.columnAction = columnAction
    }
}
