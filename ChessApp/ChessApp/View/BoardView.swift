//
//  BoardView.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/29.
//

import UIKit

protocol BoardViewDelegate: AnyObject {
    func didTapped(position: Position)
}

final class BoardView: UIView {
    weak var delegate: BoardViewDelegate?
    
    private lazy var pieceGridView = stackView(axis: .vertical)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        let vStack = pieceGridView
        for i in (0..<8).reversed() {
            let hStack = stackView(axis: .horizontal)
            for j in 0..<8 {
                guard let file = Position.File(j),
                      let rank = Position.Rank(i) else {
                    assertionFailure()
                    continue
                }
                let positionView = positionView(Position(file: file, rank: rank))
                hStack.addArrangedSubview(positionView)
            }
            vStack.addArrangedSubview(hStack)
        }
        self.addSubview(vStack)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        pieceGridView.frame = bounds
    }
    
    private func stackView(axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }
    
    private func positionView(_ position: Position) -> BoardPositionView {
        let positionView = BoardPositionView(position: position)
        positionView.addAction(.init{ [weak self] _ in
            self?.delegate?.didTapped(position: position)
        }, for: .touchUpInside)
        return positionView
    }
}
