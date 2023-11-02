//
//  BoardView.swift
//  ChessGame
//
//  Created by Dongyoung Kwon on 2023/11/01.
//

import UIKit

protocol BoardViewDelegate: AnyObject {
    func onTapSquare(coordinate: PieceCoordinate)
}

final class BoardView: UIStackView {
    
    // MARK: - property
    
    // INTERNAL
    weak var delegate: BoardViewDelegate?
    
    // PRIVATE
    private(set) var selectedSquare: PieceCoordinate?
    private(set) var movableSquares: [PieceCoordinate]?
    
    // MARK: - ui component property
    
    private var squareViews: [[BoardSquareView]] = []
    
    // MARK: - life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpUI()
    }
}

// MARK: - internal method

extension BoardView {
    func updateSquares(with pieces: [[(any Piece)?]]) {
        movableSquares?.forEach { coord in
            squareViews[coord.rank.rawValue][coord.file.rawValue].hasBorderColor(false)
        }
        movableSquares = nil
        
        for (rowIndex, row) in pieces.enumerated() {
            for (colIndex, piece) in row.enumerated() {
                squareViews[rowIndex][colIndex].update(symbol: piece?.symbol)
            }
        }
    }
    
    func displayMovableSquares(current: PieceCoordinate, movableCoordinates: [PieceCoordinate]) {
        selectedSquare = current
        
        movableSquares?.forEach { coord in
            squareViews[coord.rank.rawValue][coord.file.rawValue].hasBorderColor(false)
        }
        
        movableSquares = movableCoordinates
        
        movableCoordinates.forEach { coord in
            squareViews[coord.rank.rawValue][coord.file.rawValue].hasBorderColor(true)
        }
    }
}

// MARK: - set up UI

extension BoardView {
    
    private func setUpUI() {
        setUpStackView()
        setUpSquareViews()
    }
    
    private func setUpStackView() {
        axis = .vertical
        distribution = .fillEqually
    }
    
    private func setUpSquareViews() {
        var backgorundColorTrigger: Bool = true
        
        (0..<8).forEach { row in
            let squareHorizontalStackView: UIStackView = {
                let stackview = UIStackView()
                stackview.axis = .horizontal
                stackview.distribution = .fillEqually
                stackview.spacing = 0
                return stackview
            }()
            
            var squareViewsAtRank: [BoardSquareView] = []
            
            (0..<8).forEach { col in
                let squareView = BoardSquareView()
                squareView.backgroundColor = backgorundColorTrigger == true
                ? .lightGray
                : .brown
                
                squareView.addAction(
                    UIAction { [weak self] _ in
                        guard let self,
                              let rank = PieceCoordinate.Rank(rawValue: row),
                              let file = PieceCoordinate.File(rawValue: col)
                        else { return }
                        
                        let coord = PieceCoordinate(rank: rank, file: file)
                        
                        delegate?.onTapSquare(coordinate: coord)
                    },
                    for: .touchUpInside
                )
                
                squareHorizontalStackView.addArrangedSubview(squareView)
                squareViewsAtRank.append(squareView)
                backgorundColorTrigger.toggle()
            }
            
            addArrangedSubview(squareHorizontalStackView)
            squareViews.append(squareViewsAtRank)
            backgorundColorTrigger.toggle()
        }
    }
}
