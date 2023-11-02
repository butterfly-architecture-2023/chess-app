//
//  ChessBoardViewController.swift
//  ChessGame
//
//  Created by 강호성 on 11/1/23.
//

import UIKit

final class ChessBoardViewController: UIViewController {

    private let chessBoardView: ChessBoardView = {
        let view = ChessBoardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        setConfiguration()
    }

    private func setViews() {
        view.addSubview(chessBoardView)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            chessBoardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chessBoardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chessBoardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    private func setConfiguration() {
        view.backgroundColor = .white
    }
}
