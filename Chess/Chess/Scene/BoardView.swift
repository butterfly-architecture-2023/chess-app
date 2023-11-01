//
//  BoardView.swift
//  Chess
//
//  Created by ByungHoon Ann on 2023/10/29.
//

import UIKit

final class BoardView: UIView {
    private let board: Board
    
    private var pieceButtons = [PieceButton]()
    private let rankStackView = UIStackView()
    
    private let columnStackView = UIStackView()
    private let rankLeftGuideStackView = UIStackView()
    private let rankRightGuideStackView = UIStackView()
    private let messageLabel = UILabel()
    
    private var currentPiece: ChessPiece?
    
    private let cantMoveMessage = "해당 자리로 움직일 수 없습니다."
    private let dontCurrentPlaceMessage = "다른 위치를 선택해주세요."
    private let notMyTurn = "현재 당신의 턴이 아닙니다."
    
    private var size: CGFloat {
        return frame.width/10
    }
    
    init(frame: CGRect = .zero, board: Board = Board()) {
        self.board = board
        super.init(frame: frame)
        layout()
        makeChessBoard()
        makeColumnGuideView()
        showScore()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func pieceButtonTappped(_ button: PieceButton) {
        if board.isCanMoveTurn(fromPiece: button.chessPiece) == false && currentPiece == nil {
            showMessage(text: notMyTurn)
            return
        }

        if currentPiece == nil && button.chessPiece.pieceColor == .none {
            showMessage(text: dontCurrentPlaceMessage)
            return
        }
        
        if currentPiece == nil {
            button.selectButtonSet()
            showCanMovePiece(chessPiece: button.chessPiece)
            return
        }
        
        moveApply(selectButton: button)
    }
    
    func makeChessBoard() {
        for rank in Rank.allCases {
            let columnStackView = UIStackView()
            columnStackView.axis = .horizontal
            columnStackView.distribution = .fillEqually
            columnStackView.alignment = .fill
            
            for column in Column.allCases {
                let piecebutton = PieceButton(chessPiece: board.getPiece(position: Position(rank: rank, column: column)))
                columnStackView.addArrangedSubview(piecebutton)
                piecebutton.addTarget(self, action: #selector(pieceButtonTappped), for: .touchUpInside)
                pieceButtons.append(piecebutton)
            }
            
            rankStackView.addArrangedSubview(columnStackView)
        }
    }
    
    /// 선택된 Piece 이동 실행
    func moveApply(selectButton: PieceButton) {
        let chessPiece = selectButton.chessPiece
        
        guard
            let currentPiece = currentPiece,
            let prebutton = pieceButtons.filter ({ $0.chessPiece.position == currentPiece.position}).first,
            chessPiece.position != currentPiece.position
        else {
            boardMoveReset()
            return
        }
        
        let result = board.movePiece(inputText: "\(currentPiece.pieceText)->\(chessPiece.pieceText)")
        
        if result == true {
            prebutton.chessPiece = board.getPiece(position: currentPiece.position)
            selectButton.chessPiece = board.getPiece(position: chessPiece.position)
            boardMoveReset()
        }
        
        if result == false {
            showMessage(text: cantMoveMessage)
        }
    }
    
    func showCanMovePiece(chessPiece: ChessPiece) {
        self.currentPiece = chessPiece
        
        let canMoveList = board.getCanMovePieceList(fromPiece: chessPiece)
        
        for (index, button) in pieceButtons.enumerated() {
            for piece in canMoveList {
                if button.chessPiece.position == piece.position {
                    pieceButtons[index].canMoveButtonSet()
                    break
                }
            }
        }
    }
    
    func boardMoveReset() {
        board.resetList()
        currentPiece = nil
        pieceButtons.forEach { $0.basicSet() }
    }
    
    func showScore() {
        board.completion = { score, team in
            guard score > 0 else { return }
            self.showMessage(text: "\(team)팀이 \(score)점을 획득했습니다!")
        }
    }
}

private extension BoardView {
    
    func showMessage(text: String) {
        messageLabel.text = text
        hiddenMessage()
    }
    
    func hiddenMessage(seconds: TimeInterval = 2.0) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [weak self] in
            guard let self = self else { return }
            self.messageLabel.text = nil
        }
    }
}

private extension BoardView {
    func makeGuideButtonView(text: String) -> UIButton {
        let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: size, height: size)))
        button.setTitle(text, for: .normal)
        button.backgroundColor = .black
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }
    
    func makeRankGuideView(stackView: UIStackView) {
        let emptyTopView = UIButton()
        stackView.addArrangedSubview(emptyTopView)
        Rank.allCases.forEach {
            let label = makeGuideButtonView(text: "\($0.rawValue)")
            stackView.addArrangedSubview(label)
        }
        
        let emptyBottomView = UIButton()
        stackView.addArrangedSubview(emptyBottomView)
    }
    
    func makeColumnGuideView() {
        let topStackView = UIStackView()
        topStackView.distribution = .fillEqually
        topStackView.axis = .horizontal
        topStackView.alignment = .fill
        
        let bottomStackView = UIStackView()
        bottomStackView.distribution = .fillEqually
        bottomStackView.axis = .horizontal
        bottomStackView.alignment = .fill
        
        Column.allCases.forEach {
            let label = makeGuideButtonView(text: $0.rawValue)
            topStackView.addArrangedSubview(label)
        }
        
        Column.allCases.forEach {
            let label = makeGuideButtonView(text: $0.rawValue)
            bottomStackView.addArrangedSubview(label)
        }
        rankStackView.insertArrangedSubview(topStackView, at: 0)
        rankStackView.addArrangedSubview(bottomStackView)
    }
    
    func layout() {
        insertUI()
        basicSetUI()
        anchorUI()
    }
    
    func insertUI() {
        addSubview(rankLeftGuideStackView)
        addSubview(rankRightGuideStackView)
        addSubview(rankStackView)
        addSubview(messageLabel)
    }
    
    func basicSetUI() {
        viewBasicSet()
        stackViewBasicSet()
        messageLabelBasicSet()
    }
    
    func anchorUI() {
        stackViewAnchor()
        messageLabelAnchor()
    }
    
    func viewBasicSet() {
        backgroundColor = .lightGray
    }
    
    func stackViewBasicSet() {
        rankLeftGuideStackView.translatesAutoresizingMaskIntoConstraints = false
        rankLeftGuideStackView.alignment = .fill
        rankLeftGuideStackView.axis = .vertical
        rankLeftGuideStackView.distribution = .fillEqually
        
        rankRightGuideStackView.translatesAutoresizingMaskIntoConstraints = false
        rankRightGuideStackView.alignment = .fill
        rankRightGuideStackView.axis = .vertical
        rankRightGuideStackView.distribution = .fillEqually
        makeRankGuideView(stackView: rankLeftGuideStackView)
        makeRankGuideView(stackView: rankRightGuideStackView)
        
        rankStackView.translatesAutoresizingMaskIntoConstraints = false
        rankStackView.alignment = .fill
        rankStackView.axis = .vertical
        rankStackView.distribution = .fillEqually
    }
    
    func messageLabelBasicSet() {
        messageLabel.textColor = .black
        messageLabel.backgroundColor = .clear
        messageLabel.font = .boldSystemFont(ofSize: 15)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func stackViewAnchor() {
        NSLayoutConstraint
            .activate(
                [
                    rankLeftGuideStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
                    rankLeftGuideStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                    rankLeftGuideStackView.widthAnchor.constraint(equalToConstant: size)
                ]
            )
        
        NSLayoutConstraint
            .activate(
                [
                    rankStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
                    //rankStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
                    rankStackView.leadingAnchor.constraint(equalTo: rankLeftGuideStackView.trailingAnchor),
                    rankStackView.trailingAnchor.constraint(equalTo: rankRightGuideStackView.leadingAnchor)
                ]
            )
        
        NSLayoutConstraint
            .activate(
                [
                    rankRightGuideStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
                    rankRightGuideStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                    rankRightGuideStackView.widthAnchor.constraint(equalToConstant: size),
                ]
            )
    }
    
    func messageLabelAnchor() {
        NSLayoutConstraint
            .activate(
                [
                    messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                    messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50)
                ]
            )
    }
}
