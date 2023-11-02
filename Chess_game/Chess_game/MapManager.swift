//
//  MapManager.swift
//  Chess_game
//
//  Created by 박진섭 on 10/25/23.
//

final class MapManager {
    private var map: [[String]]

    init(map: [[String]] = Array(repeating: Array(repeating: ".", count: Rank.allCases.count), count: File.allCases.count)) {
        self.map = map
    }

    func resetPiece(position: Position) {
        map[position.rank.rawValue][position.file.rawValue] = "."
    }

    @discardableResult
    func makeMap(_ pieces: [Piece]) -> [[String]] {
        let whiteTeam: [Piece] = pieces.filter{ $0.isAlive != false }.filter { $0.color == .white }
        let blackTeam: [Piece] = pieces.filter{ $0.isAlive != false }.filter { $0.color == .black }

        whiteTeam.forEach { piece in
            let position = piece.position
            map[position.rank.rawValue][position.file.rawValue] = piece.icon
        }

        blackTeam.forEach { piece in
            let position = piece.position
            map[position.rank.rawValue][position.file.rawValue] = piece.icon
        }
        return map
    }
}
