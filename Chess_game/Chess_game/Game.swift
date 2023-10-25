//
//  Game.swift
//  Chess_game
//
//  Created by 박진섭 on 10/22/23.
//

// Game: 어떤 게임을 할 것인지(chess, Chinese chess ... )
// Board: 점수세기, pieceManger의 리턴값에 따라 분기처리
// PieceManager: Piece 배열 리턴, 움직임에 따라 piece배열 조절
// MapManager: Piece를 이용 Map 그리기
// PieceManager: 게임 종류별 Piece를 만들어줌.
// Piece: 현재 위치 정보와 움직일 수 있는 곳의 정보를 리턴

enum GameType {
    case chess
}

final class Game {
    private var board: Board?

    func start(_ type: GameType) {
        let pieces = PieceFactory.createPieces(type)
        switch type {
        case .chess:
            self.board = .init(pieces: pieces)
        }
    }

    // TODO: 움직인 결과가 nil일 경우 다시 입력을 받음.
    func move(from startPosition : Position, to destination: Position) {
        if let result = board?.move(from: startPosition, to: destination) {
            print(result)
        }
    }

}
