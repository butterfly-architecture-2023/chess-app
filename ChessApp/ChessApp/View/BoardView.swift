//
//  BoardView.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/29.
//

import UIKit

final class BoardView: UIView {
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
        for _ in 0..<8 {
            let hStack = stackView(axis: .horizontal)
            for _ in 0..<8 {
                let positionView = positionView()
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
    
    private func positionView() -> BoardPositionView {
        let positionView = BoardPositionView()
        positionView.addAction(.init{ [weak positionView] _ in
            positionView?.isSelected.toggle()
        }, for: .touchUpInside)
        return positionView
    }
}
