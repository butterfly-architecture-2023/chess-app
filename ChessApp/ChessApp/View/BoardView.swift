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
    
    private lazy var positionViewContainer = stackView(axis: .vertical)
    private var positionViews = [Position: BoardPositionView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        let vStack = positionViewContainer
        for rank in Position.Rank.allCases.reversed() {
            let hStack = stackView(axis: .horizontal)
            for file in Position.File.allCases {
                let position = Position(file: file, rank: rank)
                let positionView = positionView(position)
                positionViews[position] = positionView
                hStack.addArrangedSubview(positionView)
            }
            vStack.addArrangedSubview(hStack)
        }
        self.addSubview(vStack)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        positionViewContainer.frame = bounds
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

extension BoardView: BoardPresenter {
    func updateViewModel(_ viewModel: BoardViewModel) {
        for element in viewModel.elements {
            positionViews[element.key]?.setup(viewModel: element.value)
        }
    }
}
