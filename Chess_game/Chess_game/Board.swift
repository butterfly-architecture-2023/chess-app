//
//  Board.swift
//  Chess_game
//
//  Created by 박진섭 on 10/15/23.
//

import Foundation

//struct BoardPosition: Equatable {
//    let rank: Rank
//    let file: File
//}

typealias BoardPosition = (rank: Rank, file: File)

final class Board {
//    var pieceManager: ChessPieceManager = .init()
    private(set) var map: [[String]] = []
    private(set) var chessPieces: [ChessPiece] = []

    func initBoardMap() {
        self.map = Array(repeating: Array(repeating: ".", count: Rank.allCases.count), count: File.allCases.count)
    }

    func initPieces() {
        let whitePawns = File.allCases.map { ChessPiece(color: .white, position: (rank: .seven, file: $0), type: .pawn) }

        let blackPawns = File.allCases.map { ChessPiece(color: .black, position: (rank: .two, file: $0), type: .pawn) }
        self.chessPieces = whitePawns + blackPawns
    }

    func kill(_ position: BoardPosition) {
        guard let index = getChessPieceIndex(position) else { return }
        chessPieces[index].isAlive = false
    }

    @discardableResult
    func move(_ from: BoardPosition, _ to: BoardPosition) -> Bool {
        if validateCanGo(from, to) {
            // 시작점에 말이 없으면 false
            guard let startPieceIndex = getChessPieceIndex(from) else { return false }

            // 만약 목적지에 다른팀의 말이 있다면 kill 한다
            if validateIsDifferentTeam(from, to) {
                if let destinationPieceIndex = getChessPieceIndex(to) {
                    chessPieces[destinationPieceIndex].isAlive = false
                }
            }
            // map을 초기화 한다.
            let beforePosition = chessPieces[startPieceIndex].position
            map[beforePosition.rank.rawValue][beforePosition.file.rawValue] = "."
            // 말 포지션을 바꾼다.
            chessPieces[startPieceIndex].position = to
        }
        return false
    }

    func validateCanGo(_ from: BoardPosition, _ to: BoardPosition) -> Bool {
        guard let startPiece = findPiece(from) else { return false }

        if startPiece.isAlive && pawnCanGo(startPiece, to) {
            return true
        }
        return false
    }

    func validateIsDifferentTeam(_ from: BoardPosition, _ to: BoardPosition) -> Bool {
        guard let startPiece = findPiece(from),
              let destinationPiece = findPiece(to) else { return false }
        let startPawnType = startPiece.color
        let destinationPawnType = destinationPiece.color
        return startPawnType != destinationPawnType
    }

    func findPiece(_ position: BoardPosition) -> ChessPiece? {
        guard let index = getChessPieceIndex(position) else { return nil }
        return chessPieces[index]
    }

    func getPoint(_ pawnType: PieceColor) -> Int {
        switch pawnType {
        case .black:
            return chessPieces.filter { $0.color == .black }.filter { $0.isAlive == false }.count
        case .white:
            return chessPieces.filter { $0.color == .white }.filter { $0.isAlive == false }.count
        }
    }

    func display() -> [[String]] {
        let whitePawnPositions: [BoardPosition] = chessPieces.filter{ $0.isAlive != false }.filter { $0.color != .black }.map { $0.position }
        let blackPawnPositions: [BoardPosition] = chessPieces.filter{ $0.isAlive != false }.filter { $0.color != .white }.map { $0.position }

        whitePawnPositions.forEach { position in
            map[position.rank.rawValue][position.file.rawValue] = "\u{2659}"
        }

        blackPawnPositions.forEach { position in
            map[position.rank.rawValue][position.file.rawValue] = "\u{265F}"
        }
        return map
    }

    private func getChessPieceIndex(_ position: BoardPosition) -> Int? {
        return chessPieces.firstIndex(where: { $0.position == position })
    }

    private func pawnCanGo(_ startPawn: ChessPiece, _ destination: BoardPosition) -> Bool {
        let isSameFile =  startPawn.position.file == destination.file
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

    // Map 출력 함수
    // 추후 입,출력 테스트시 사용예정
    func printMap(_ map: [[String]]) {
        var board = String(map.flatMap({$0}).joined())
        var index = board.index(board.startIndex, offsetBy: 8)

        while index < board.endIndex {
            board.insert(contentsOf: "\n", at: index)
            index = board.index(index, offsetBy: 8 + "\n".count)
        }
        print(board)
    }
}

extension Board {
    convenience init(chessPieces: [ChessPiece]) {
        self.init()
        self.chessPieces = chessPieces
    }
}


enum Rank: Int, CaseIterable {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
}

enum File: Int, CaseIterable {
    case A
    case B
    case C
    case D
    case E
    case F
    case G
    case H
}

