//
//  Rook.swift
//  Chess_game
//
//  Created by 박진섭 on 10/25/23.
//

// TODO: 중복 부분 쪼개기, 코드 개선
struct Rook: Piece {
    var color: PieceColor
    var isAlive: Bool = true
    var position: Position

    func getMoveablePositions(pieces: [Piece]) -> [Position] {
        var moveablePositions: [Position] = []
        let currentRankRawValue = position.rank.rawValue
        let currentFileRawValue = position.file.rawValue

        // 왼쪽으로 다른 말을 발견할때까지 계속
        for i in 1...File.allCases.count - currentFileRawValue {
            if let rank = Rank(rawValue: currentRankRawValue),
               let file = File(rawValue: currentFileRawValue - i) {
                if let foundPiece = findPiece(pieces: pieces, with: .init(rank: rank, file: file)) {
                    // 같은 색상일 경우 이전 까지 추가
                    if foundPiece.color == self.color {
                        break
                    } else {
                        // 다른 색상일 경우 여기까지 추가
                        moveablePositions.append(.init(rank: rank, file: file))
                        break
                    }
                }
                moveablePositions.append(.init(rank: rank, file: file))
            } else {
                break
            }
        }

        // 오른쪽으로 다른 말을 발견할때까지 계속
        for i in 1...File.allCases.count - currentFileRawValue {
            if let rank = Rank(rawValue: currentRankRawValue),
               let file = File(rawValue: currentFileRawValue + i) {
                if let foundPiece = findPiece(pieces: pieces, with: .init(rank: rank, file: file)) {
                    // 같은 색상일 경우 이전 까지 추가
                    if foundPiece.color == self.color {
                        break
                    } else {
                        // 다른 색상일 경우 여기까지 추가
                        moveablePositions.append(.init(rank: rank, file: file))
                        break
                    }
                }
                moveablePositions.append(.init(rank: rank, file: file))
            } else {
                break
            }
        }

        // 위쪽으로 다른 말을 발견할때까지 계속
        for i in 1...Rank.allCases.count - currentRankRawValue {
            if let rank = Rank(rawValue: currentRankRawValue + i),
               let file = File(rawValue: currentFileRawValue) {
                if let foundPiece = findPiece(pieces: pieces, with: .init(rank: rank, file: file)) {
                    // 같은 색상일 경우 이전 까지 추가
                    if foundPiece.color == self.color {
                        break
                    } else {
                        // 다른 색상일 경우 여기까지 추가
                        moveablePositions.append(.init(rank: rank, file: file))
                        break
                    }
                }
                moveablePositions.append(.init(rank: rank, file: file))
            } else {
                break
            }
        }

        // 아래으로 다른 말을 발견할때까지 계속
        for i in 1...Rank.allCases.count - currentRankRawValue {
            if let rank = Rank(rawValue: currentRankRawValue - i),
               let file = File(rawValue: currentFileRawValue) {
                if let foundPiece = findPiece(pieces: pieces, with: .init(rank: rank, file: file)) {
                    // 같은 색상일 경우 이전 까지 추가
                    if foundPiece.color == self.color {
                        break
                    } else {
                        // 다른 색상일 경우 여기까지 추가
                        moveablePositions.append(.init(rank: rank, file: file))
                        break
                    }
                }
                moveablePositions.append(.init(rank: rank, file: file))
            } else {
                break
            }
        }
        return moveablePositions
    }
}
