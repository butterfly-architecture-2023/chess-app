//
//  Pawn.swift
//  Chess_game
//
//  Created by 박진섭 on 10/25/23.
//

struct Pawn: Piece {
    var color: PieceColor
    var isAlive: Bool = true
    var position: Position

    func getMoveablePositions(pieces: [Piece]) -> [Position] {
        var movablePositions: [Position] = []
        switch color {
        case .black:
            if let destinationFile = File(rawValue: position.file.rawValue),
               let destinationRank = Rank(rawValue: position.rank.rawValue + 1) {
                let destinationPosition: Position = .init(rank: destinationRank, file: destinationFile)
                if pawnCanGo(pieces: pieces, self, destinationPosition) {
                    movablePositions.append(destinationPosition)
                }
            }
        case .white:
            if let destinationFile = File(rawValue: position.file.rawValue),
               let destinationRank = Rank(rawValue: position.rank.rawValue - 1) {
                let destinationPosition: Position = .init(rank: destinationRank, file: destinationFile)
                if pawnCanGo(pieces: pieces, self, destinationPosition) {
                    movablePositions.append(destinationPosition)
                }
            }
        }
        return movablePositions
    }

    private func pawnCanGo(pieces: [Piece], _ startPawn: Piece, _ destination: Position) -> Bool {
        let isSameFile = startPawn.position.file == destination.file
        if let destinationPiece = findPiece(pieces: pieces, with: destination) {
            if destinationPiece.color == startPawn.color {
                return false
            }
        }
        switch startPawn.color {
        case .black:
            let rankGap = destination.rank.rawValue - startPawn.position.rank.rawValue
            if isSameFile && rankGap == 1 {
                return true
            } else {
                return false
            }
        case .white:
            let rankGap = startPawn.position.rank.rawValue - destination.rank.rawValue
            if isSameFile && rankGap == 1 {
                return true
            } else {
                return false
            }
        }
    }
}
