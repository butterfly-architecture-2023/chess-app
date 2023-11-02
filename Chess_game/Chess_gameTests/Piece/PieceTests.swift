//
//  PieceTests.swift
//  Chess_gameTests
//
//  Created by 박진섭 on 10/26/23.
//

import XCTest
@testable import Chess_game

final class PieceTests: XCTestCase {

    func test_getEncounterPieceColor_이동중_만나는_Piece의_Color를_잘_가져_오는가() {
        let piece: BlackPawn = .init(position: .init(rank: .four, file: .A))
        let expectedEncounterPiece = BlackPawn(position: .init(rank: .five, file: .B))
        let notExpectedEncounterPiece = BlackPawn(position: .init(rank: .five, file: .C))

        let encounterPieceColor = piece.isEncounterSameColorWhenMove(pieces: [expectedEncounterPiece,notExpectedEncounterPiece], moveTo: .init(rank: .five, file: .B))
        XCTAssertNotNil(encounterPieceColor)
        XCTAssertEqual(encounterPieceColor!, true)
    }

    func test_getMovablePositionsWithDirection_주어진_방향에_따라_이동할수있는_포지션을_잘_가져_오는가() {
        let blackPiece = BlackPawn.init(position: .init(rank: .four, file: .D))
        
        let expectedPositions_top: [Position] = [
            .init(rank: .three, file: .D),
            .init(rank: .two, file: .D),
            .init(rank: .one, file: .D),
        ]
        
        XCTAssertEqual(blackPiece.getMovablePositionsWithDirection(pieces: [], .top), expectedPositions_top)

        let expectedPositions_left: [Position] = [
            .init(rank: .four, file: .C),
            .init(rank: .four, file: .B),
            .init(rank: .four, file: .A),
        ]
        XCTAssertEqual(blackPiece.getMovablePositionsWithDirection(pieces: [], .left), expectedPositions_left)

        let expectedPositions_right: [Position] = [
            .init(rank: .four, file: .E),
            .init(rank: .four, file: .F),
            .init(rank: .four, file: .G),
            .init(rank: .four, file: .H),
        ]
        XCTAssertEqual(blackPiece.getMovablePositionsWithDirection(pieces: [], .right), expectedPositions_right)

        let expectedPositions_bottom: [Position] = [
            .init(rank: .five, file: .D),
            .init(rank: .six, file: .D),
            .init(rank: .seven, file: .D),
            .init(rank: .eight, file: .D)
        ]
        XCTAssertEqual(blackPiece.getMovablePositionsWithDirection(pieces: [], .bottom), expectedPositions_bottom)

        let expectedPositions_topLeftDiagonal: [Position] = [
            .init(rank: .three, file: .C),
            .init(rank: .two, file: .B),
            .init(rank: .one, file: .A)
        ]
        XCTAssertEqual(blackPiece.getMovablePositionsWithDirection(pieces: [], .topLeftDiagonal), expectedPositions_topLeftDiagonal)

        let expectedPositions_topRightDiagonal: [Position] = [
            .init(rank: .three, file: .E),
            .init(rank: .two, file: .F),
            .init(rank: .one, file: .G)
        ]
        XCTAssertEqual(blackPiece.getMovablePositionsWithDirection(pieces: [], .topRightDiagonal), expectedPositions_topRightDiagonal)

        let expectedPositions_bottomLeftDiagonal: [Position] = [
            .init(rank: .five, file: .C),
            .init(rank: .six, file: .B),
            .init(rank: .seven, file: .A)
        ]
        XCTAssertEqual(blackPiece.getMovablePositionsWithDirection(pieces: [], .bottomLeftDiagonal), expectedPositions_bottomLeftDiagonal)

        let expectedPositions_bottomRightDiagonal: [Position] = [
            .init(rank: .five, file: .E),
            .init(rank: .six, file: .F),
            .init(rank: .seven, file: .G),
            .init(rank: .eight, file: .H)
        ]
        XCTAssertEqual(blackPiece.getMovablePositionsWithDirection(pieces: [], .bottomRightDiagonal), expectedPositions_bottomRightDiagonal)
    }

    func test_checkNearLine_주어진_방향에_장애물이_있어도_포지션을_잘_가져_오는가() {
        let piece = BlackPawn.init(position: .init(rank: .four, file: .D))
        let obstacleBlackPiece_1 = BlackPawn.init(position: .init(rank: .two, file: .D))
        let obstacleWhitePiece_1 = WhitePawn.init(position: .init(rank: .two, file: .D))

        let obstacleBlackPiece_2 = BlackPawn.init(position: .init(rank: .six, file: .F))
        let obstacleWhitePiece_2 = WhitePawn.init(position: .init(rank: .six, file: .F))

        // 같은 팀 만났을 때
        let expectedPositions_top_1: [Position] = [
            .init(rank: .three, file: .D),
        ]

        let expectedPositions_bottomRightDiagonal_1: [Position] = [
            .init(rank: .five, file: .E),
        ]
        XCTAssertEqual(piece.getMovablePositionsWithDirection(pieces: [obstacleBlackPiece_1], .top), expectedPositions_top_1)
        XCTAssertEqual(piece.getMovablePositionsWithDirection(pieces: [obstacleBlackPiece_2], .bottomRightDiagonal), expectedPositions_bottomRightDiagonal_1)

        // 다른 팀 만났을 때
        let expectedPositions_top_2: [Position] = [
            .init(rank: .three, file: .D),
            .init(rank: .two, file: .D),
        ]

        let expectedPositions_bottomRightDiagonal_2: [Position] = [
            .init(rank: .five, file: .E),
            .init(rank: .six, file: .F),
        ]
        XCTAssertEqual(piece.getMovablePositionsWithDirection(pieces: [obstacleWhitePiece_1], .top), expectedPositions_top_2)

        XCTAssertEqual(piece.getMovablePositionsWithDirection(pieces: [obstacleWhitePiece_2], .bottomRightDiagonal), expectedPositions_bottomRightDiagonal_2)

    }
}
