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
    
    init(presenter: BoardPresenter) {
        self.presenter = presenter
        let elements = [Position("A1")!: BoardViewModel.Element(description: "1", isSelected: true, isHighlighted: true, backgroundColor: BoardColor.light)]
        
        presenter.updateViewModel(.init(elements: elements))
    }
}

extension BoardInteractor: BoardViewDelegate {
    func didTapped(position: Position) {
        print(position)
    }
}
