//
//  BoardVC.swift
//  ChessGame
//
//  Created by Dongyoung Kwon on 2023/10/13.
//

import UIKit

final class BoardVC: UIViewController {
    
    // MARK: - property
    
    private let boardModel = Board()
    
    // MARK: - ui component property
    
    private let boardView = BoardView()
    private let blackUserScoreLabel: UILabel = .init()
    private let whiteUserScoreLabel: UILabel = .init()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        startBoardGame()
    }
}

// MARK: - private method

extension BoardVC {
    private func startBoardGame() {
        boardModel.setUpPieces(type: Pawn.self)
        boardModel.setUpPieces(type: Bishop.self)
        boardModel.setUpPieces(type: Rook.self)
        boardModel.setUpPieces(type: Queen.self)
        boardModel.setUpPieces(type: Knight.self)
        
        boardView.updateSquares(with: boardModel.squares)
        update(scores: boardModel.getScore())
    }
    
    private func update(scores: (black: Int, white: Int)) {
        blackUserScoreLabel.text = "Black Score : \(scores.black)"
        whiteUserScoreLabel.text = "White Score : \(scores.white)"
    }
}

// MARK: - set up UI

extension BoardVC {
    private func setUpUI() {
        setUpView()
        setUpLayout()
        setUpComponents()
    }
    
    private func setUpView() {
        view.backgroundColor = .white
    }
    
    private func setUpLayout() {
        view.addSubview(boardView)
        boardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            boardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            boardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            boardView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                               constant: 20),
            boardView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                constant: -20),
            boardView.heightAnchor.constraint(equalTo: boardView.widthAnchor)
        ])
        
        [blackUserScoreLabel, whiteUserScoreLabel].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            blackUserScoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blackUserScoreLabel.bottomAnchor.constraint(equalTo: boardView.topAnchor, constant: -20),
            whiteUserScoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            whiteUserScoreLabel.topAnchor.constraint(equalTo: boardView.bottomAnchor, constant: 20),
        ])
    }
    
    private func setUpComponents() {
        setUpBoardView()
        setUpBlackUserScoreLabel()
        setUpWhiteUserScoreLabel()
    }
    
    private func setUpBoardView() {
        boardView.delegate = self
    }
    
    private func setUpBlackUserScoreLabel() {
        blackUserScoreLabel.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    private func setUpWhiteUserScoreLabel() {
        whiteUserScoreLabel.font = .systemFont(ofSize: 14, weight: .bold)
    }
}

// MARK: - BoardViewDelegate

extension BoardVC: BoardViewDelegate {
    func onTapSquare(coordinate: PieceCoordinate) {
        let a = boardModel.movableCoordinates(from: coordinate)
        
        if let movableSquares = boardView.movableSquares,
           movableSquares.contains(coordinate),
           let selectedCoord = boardView.selectedSquare
        {
            boardModel.move(from: selectedCoord, to: coordinate)
            boardView.updateSquares(with: boardModel.squares)
            
            update(scores: boardModel.getScore())
        } else {
            boardView.displayMovableSquares(current: coordinate, movableCoordinates: a)
        }
    }
}
