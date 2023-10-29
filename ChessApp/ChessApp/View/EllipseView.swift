//
//  EllipseView.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/29.
//

import UIKit

final class EllipseView: UIView {
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        let shorterEdgeLength = min(bounds.width, bounds.height)
        self.layer.cornerRadius = shorterEdgeLength / 2
        self.clipsToBounds = true
    }
}
