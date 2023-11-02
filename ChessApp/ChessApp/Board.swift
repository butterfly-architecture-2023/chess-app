//
//  Board.swift
//  ChessApp
//
//  Created by elly on 10/16/23.
//

import Foundation

typealias ChessPieceGroup = [Position:Piece]

struct Board {
    private var size: Int = 0
    private(set) var chessBoard: ChessPieceGroup = [:]
    private(set) var chessPoint: ChessPoint = ChessPoint(black: 0, white: 0)
    private(set) var gameTurn: PieceColorType = .white
    
    init(size: Int) {
        self.size = size
        startBoard()
    }
    
    // MARK: - 체스 프로그램 시작 시, 흑/백 Pawn을 초기화
    private mutating func startBoard() {
        for rank in 0..<size {
            for file in 0..<size {
                let position = Position(rank: rank, file: file)
                chessBoard[position] = makeInitialPieces(by: position)
            }
        }
    }
    
    private func makeInitialPieces(by position: Position) -> Piece {
        let area = (rank: position.rank, file: position.file)
        switch area {
            case (rank: 1, file: _): // 2-rank
                return Pawn(pieceColorType: .black)
            case (rank: 6, file: _): // 7-rank
                return Pawn(pieceColorType: .white)
            default:
                return EmptySpace()
        }
        // 초기화할 때 1,2-rank는 흑백 체스말이, 7,8-rank는 백색 체스말이 위치한다.
        // Pawn는 색상별로 8개. Bishop, Rook는 색상별로 2개, Queen는 색상별로 1개만 가능하다.
        // Pawn - 생성 위치는 흑색은 2-rank 또는 백색 7-rank에만 가능하다.
        // Bishop - 생성 위치는 흑색은 C-1 과 F-1 에만 가능하고, 백색은 C-8 과 F-8 에만 가능하다.
        // Rook - 생성 위치는 흑색은 A-1 과 H-1 에만 가능하고, 백색은 A-8 과 H-8 에만 가능하다.
        // Queen - 생성 위치는 흑색은 E-1에만 가능하고, 백색은 E-8 에만 가능하다.
        // Knight - 생성 위치는 흑색은 B-1 과 G-1 에만 가능하고, 백색은 B-8 과 G-8 에만 가능하다.
    }
    
    // Board는 8x8 크기 체스판에 체스말(Piece) 존재 여부를 관리
    
    // Board는 현재 있는 말을 확인해서 흑과 백 점수를 출력
    func showChessPoint() -> ChessPoint {
        return chessPoint
    }
    
    
    // MARK: - 체스말 리턴 (1-rank부터 8-rank까지 rank 문자열 배열)
    mutating func display() -> ChessPieceGroup {
        return chessBoard
    }
    
    // 말을 옮길 수 있으면 true, 옮길 수 없으면 false를 리턴한다.
    func isUpdateValid() -> Bool {
        return false
    }
    
    
    // MARK: - 특정 체스말 이동 ([0]: current position, [1]: update position)
    mutating func updateBoard(_ positionArray: [Position]) {
        guard let currentPosition = positionArray.first,
              let updatePosition = positionArray.last else { return }
        chessBoard[updatePosition] = chessBoard[currentPosition]
        chessBoard[currentPosition] = EmptySpace()
    }
    
    mutating func checkGameTurn(_ positionArray: [Position]) throws {
        guard let currentPosition = positionArray.first else { return }
        guard getPawnType(by: currentPosition) == gameTurn else {
            throw ErrorType.chessTypeError(pieceColorType: gameTurn)
        }
    }
    
    func checkMovable(_ positionArray: [Position], _ type: RegexFormatType) throws {
        //
        // 1. [0]이 어떤 체스말인지 가져옴
        let currentPosition: Position = positionArray.first!
        guard let currentPiece = chessBoard[currentPosition] else { throw ErrorType.pieceError }
        
        // 2. [0] 기준으로 해당 [Position]이 어딘지 리턴받아옴
        var array = currentPiece.movablePosition(currentPosition)
        array = checkInBoardArea(array)
        array = checkInSameGroup(array, currentPosition)
        print(array)
        
        // help형식이면, 2 리턴
        // update형식이면, [1]이 [Position]에 속하는지 체크
            // 해당 위치에 같은 편 체스말 있는지 체크해서 제외시킴
            // 이동 안된다면 throw
        switch type {
            case .updatePiece:
                let updatePosition: Position = positionArray.last!
                if !array.contains(updatePosition) { throw ErrorType.unableToMoveError }
                if let updatePiece = chessBoard[updatePosition],
                    updatePiece.pieceColorType == currentPiece.pieceColorType {
                    throw ErrorType.unableToMoveError
                }
            case .help:
                throw ErrorType.helpPosition(positionList: array)
        }
    }
    
    func checkInBoardArea(_ array: [Position]) -> [Position] {
        return array.filter {
            ($0.rank >= 0 && $0.rank <= 8) && ($0.file >= 0 && $0.file <= 8)
        }
    }
    
    func checkInSameGroup(_ array: [Position], _ currentPosition: Position) -> [Position] {
        return array.filter {
            if let piece = chessBoard[$0], let currentPiece = chessBoard[currentPosition] {
                return !(piece.pieceColorType == currentPiece.pieceColorType)
            }
            return true
        }
    }
    
    private func getPawnType(by position: Position) -> PieceColorType {
        if let piece = chessBoard[position] {
            return piece.pieceColorType
        }
        return .black
    }
 }
