//
//  BoardViewController.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/15.
//

import UIKit

final class BoardViewController: UIViewController {
    private let boardView = BoardView()
    private lazy var interactor = BoardInteractor(presenter: boardView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boardView.delegate = interactor
        view.addSubview(boardView)
        view.backgroundColor = .systemBackground
        boardView.translatesAutoresizingMaskIntoConstraints = false
        [
            view.centerYAnchor.constraint(equalTo: boardView.centerYAnchor),
            view.leadingAnchor.constraint(equalTo: boardView.leadingAnchor, constant: -20),
            view.trailingAnchor.constraint(equalTo: boardView.trailingAnchor, constant: 20),
            boardView.heightAnchor.constraint(equalTo: boardView.widthAnchor)
        ].forEach { $0.isActive = true }
    }
}
