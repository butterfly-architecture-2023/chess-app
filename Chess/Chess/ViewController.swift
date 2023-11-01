//
//  ViewController.swift
//  Chess
//
//  Created by ByungHoon Ann on 2023/10/14.
//

import UIKit

class ViewController: UIViewController {
    lazy var boardView = BoardView(frame: view.frame)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    func layout() {
        insertUI()
        basicSetUI()
        anchorUI()
    }
    
    func insertUI() {
        view.addSubview(boardView)
    }
    
    func basicSetUI() {
        boardViewBasicSet()
    }
    
    func anchorUI() {
        boardViewAnchor()
    }
   
    func boardViewBasicSet() {
        boardView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func boardViewAnchor() {
        NSLayoutConstraint.activate(
            [
                boardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                boardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                boardView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                boardView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ]
        )
    }
}

