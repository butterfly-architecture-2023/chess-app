//
//  BoardPositionView.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/29.
//

import UIKit

final class BoardPositionView: UIControl {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(circleView)
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemBlue.cgColor
    }
}
