//
//  BoardPositionView.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/29.
//

import UIKit

final class BoardPositionView: UIControl {
    private let position: Position
    
    override var isSelected: Bool {
        didSet {
            circleView.isHidden = !isSelected
        }
    }
    
    private let circleView = {
        let ellipseView = EllipseView()
        ellipseView.bounds.size = CGSize(width: 16, height: 16)
        ellipseView.backgroundColor = .systemGray
        ellipseView.isUserInteractionEnabled = false
        ellipseView.isHidden = true
        return ellipseView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleView.frame.center = bounds.center
    }
    
    init(position: Position) {
        self.position = position
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(circleView)
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemBlue.cgColor
    }
}
