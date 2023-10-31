//
//  BoardInteractor.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/29.
//

import Foundation

protocol BoardPresenter: AnyObject {
    func updateViewModel(_ viewModel: BoardViewModel)
}

final class BoardInteractor {
    private weak var presenter: BoardPresenter?
    private var selectedPosition: Position? {
        didSet {
            updateViewModel()
        }
    }
    
    private var board = Board() {
        didSet {
            updateViewModel()
        }
    }
    
    init(presenter: BoardPresenter) {
        self.presenter = presenter
        updateViewModel()
        DispatchQueue.main.async {
            try? self.board.updatePieces([
                Position("A1")!: Rook(color: .black),
                Position("C1")!: Bishop(color: .black)
            ])
        }
    }
    
    private func updateViewModel() {
        let canMovePositions = try? board.canMovePositions(from: selectedPosition)
        let elementArray: [(Position, BoardViewModel.Element)] = Position.Rank.allCases.flatMap { rank in
            Position.File.allCases.map { file in
                let position = Position(file: file, rank: rank)
                let element = BoardViewModel.Element(
                    title: board.pieces[position]?.description ?? "",
                    isSelected: selectedPosition == position,
                    isHighlighted: canMovePositions?.contains(position) ?? false,
                    backgroundColor: position.isEven ? BoardColor.dark : BoardColor.light
                )
                
                return (position, element)
            }
        }
        presenter?.updateViewModel(.init(elements: Dictionary(uniqueKeysWithValues: elementArray)))
    }
}

extension BoardInteractor: BoardViewDelegate {
    func didTapped(position: Position) {
        guard position != selectedPosition else {
            self.selectedPosition = nil
            return
        }
        
        guard let selectedPosition, board.pieces[selectedPosition] != nil else {
            guard board.pieces[position] != nil else {
                return
            }
            
            self.selectedPosition = position
            return
        }
        
        _ = try? board.move(from: selectedPosition, to: position)
        self.selectedPosition = nil
    }
}
