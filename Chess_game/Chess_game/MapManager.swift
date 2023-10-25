//
//  MapManager.swift
//  Chess_game
//
//  Created by 박진섭 on 10/25/23.
//

import Foundation

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
            let pieceType = type(of: piece)
            switch pieceType {
            case is Pawn.Type:
                map[position.rank.rawValue][position.file.rawValue] = "\u{2659}"
            case is Knight.Type:
                map[position.rank.rawValue][position.file.rawValue] = "\u{2658}"
            case is Bishop.Type:
                map[position.rank.rawValue][position.file.rawValue] = "\u{2657}"
            case is Rook.Type:
                map[position.rank.rawValue][position.file.rawValue] = "\u{2656}"
            case is Queen.Type:
                map[position.rank.rawValue][position.file.rawValue] = "\u{2655}"
            case is King.Type:
                break
            default:
                break
            }
        }

        blackTeam.forEach { piece in
            let position = piece.position
            let pieceType = type(of: piece)
            switch pieceType {
            case is Pawn.Type:
                map[position.rank.rawValue][position.file.rawValue] = "\u{265F}"
            case is Knight.Type:
                map[position.rank.rawValue][position.file.rawValue] = "\u{265E}"
            case is Bishop.Type:
                map[position.rank.rawValue][position.file.rawValue] = "\u{265D}"
            case is Rook.Type:
                map[position.rank.rawValue][position.file.rawValue] = "\u{265C}"
            case is Queen.Type:
                map[position.rank.rawValue][position.file.rawValue] = "\u{265B}"
            case is King.Type:
                break
            default:
                break
            }
        }
        return map
    }
}
