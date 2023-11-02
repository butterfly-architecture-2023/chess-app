//
//  Knight.swift
//  Chess_game
//
//  Created by 박진섭 on 10/25/23.
//

protocol Knight: Piece { }
extension Knight {
    var point: Int { 3 }
    func getMoveablePositions(pieces: [Piece]) -> [Position] {
        let currentRankRawValue = position.rank.rawValue
        let currentFileRawValue = position.file.rawValue

        let topLeft: [Position?] = [
            .init(rankRawValue: currentRankRawValue - 2, fileRawValue: currentFileRawValue - 1),
            .init(rankRawValue: currentRankRawValue - 1, fileRawValue: currentFileRawValue - 2),
        ]
        let topRight: [Position?] = [
            .init(rankRawValue: currentRankRawValue - 2, fileRawValue: currentFileRawValue + 1),
            .init(rankRawValue: currentRankRawValue - 1, fileRawValue: currentFileRawValue + 2),
        ]
        let bottomLeft: [Position?] = [
            .init(rankRawValue: currentRankRawValue + 1, fileRawValue: currentFileRawValue - 2),
            .init(rankRawValue: currentRankRawValue + 2, fileRawValue: currentFileRawValue - 1),
        ]
        let bottomRight: [Position?] = [
            .init(rankRawValue: currentRankRawValue + 2, fileRawValue: currentFileRawValue + 1),
            .init(rankRawValue: currentRankRawValue + 1, fileRawValue: currentFileRawValue + 2)
        ]
        return [topLeft, topRight, bottomLeft, bottomRight]
            .flatMap {$0}
            .compactMap { $0 }
            .filter { position in
            if let isEncounterSameColor = isEncounterSameColorWhenMove(pieces: pieces, moveTo: position) {
                return isEncounterSameColor == true ? false : true
            }
            return true
        }
    }
}


struct BlackKnight: Knight {
    var color: PieceColor = .black
    var isAlive: Bool = true
    var position: Position
    var icon: String = "\u{265E}"
}

struct WhiteKnight: Knight {
    var color: PieceColor = .white
    var isAlive: Bool = true
    var position: Position
    var icon: String = "\u{2658}"
}
