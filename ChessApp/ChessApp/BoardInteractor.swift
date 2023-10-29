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
    private var board = Board() {
        didSet {
            updateViewModel()
        }
    }
    
    init(presenter: BoardPresenter) {
        self.presenter = presenter
        updateViewModel()
    }
    
    private func updateViewModel() {
        let elementArray: [(Position, BoardViewModel.Element)] = Position.Rank.allCases.flatMap { rank in
            Position.File.allCases.map { file in
                let position = Position(file: file, rank: rank)
                let element = BoardViewModel.Element(
                    title: board.pieces[position]?.description ?? "",
                    isSelected: false,
                    isHighlighted: false,
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
        try? board.updatePieces([position: Knight(color: .black)])
    }
}
