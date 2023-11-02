//
//  ViewController.swift
//  ChessApp
//
//  Created by elly on 11/1/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI Items
    
    var boardView: BoardView = BoardView().then {
        $0.makeBoard()
    }
    
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        makeConstraints()
    }
}


// MARK: - UISubviewStyle

extension ViewController: UISubviewStyle {
    func addSubviews() {
        self.view.addSubview(boardView)
    }
    
    func makeConstraints() {
        boardView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(32)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            let height = UIScreen.main.bounds.width - 32
            $0.height.equalTo(height)
        }
    }
}
