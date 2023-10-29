//
//  BoardPositionView.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/29.
//

import UIKit

final class BoardPositionView: UIButton {
    private let position: Position
    
    private let circleView = {
        let view = EllipseView()
        view.bounds.size = CGSize(width: 16, height: 16)
        view.backgroundColor = .systemGray
        view.isUserInteractionEnabled = false
        view.isHidden = true
        return view
    }()
    
    private let dimmedView = {
        let view = UIView()
        view.backgroundColor = BoardColor.dim
        view.isHidden = true
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleView.frame.center = bounds.center
        dimmedView.frame = bounds
    }
    
    init(position: Position) {
        self.position = position
        super.init(frame: .zero)
        addSubview(circleView)
        addSubview(dimmedView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(viewModel: BoardViewModel.Element) {
        self.dimmedView.isHidden = !viewModel.isSelected
        self.circleView.isHidden = !viewModel.isHighlighted
        self.backgroundColor = viewModel.backgroundColor
        setTitleColor(.black, for: .normal)
        setTitle(viewModel.title, for: .normal)
    }
}
