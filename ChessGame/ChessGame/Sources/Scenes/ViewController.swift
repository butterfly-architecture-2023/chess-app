//
//  ViewController.swift
//  ChessGame
//
//  Created by Dongyoung Kwon on 2023/10/13.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

final class ChessProgram {
    
    init() {
        
    }
    
    func run() {
        // 흑백 Pawn 초기화
    }
    
    // 체스 프로그램을 동작하는 동안, 턴을 반복하면서 입력을 받아서 말을 움직인다고 가정
    
    // 움직이려는 말이 있는 위치와 이동하려는 위치를 차례대로 입력받아서 말을 이동한다.
        // 말이 있는 위치 2자리 문자와 이동하려는 위치 2자리 문자를 입력받는다. 형식에 맞지 않으면 다시 입력받는다.
        //예시) B2 ⇒ B3 : B2에 있던 Pawn을 B3로 이동한다.
    
    // 흑 또는 백 체스말이 상대편 말이 있던 곳으로 이동해서 상대편 말을 잡는 경우는 체스판 점수를 출력한다.
    
    // 체스말을 이동하는 명령은 백색부터 시작해서, 흑과 백이 번갈아서 처리해야 한다.
    
    // 흑 또는 백 체스말이 상대편 말이 있던 곳으로 이동해서 상대편 말을 잡는 경우는 체스판 점수를 출력한다.
    
    // 체스말을 이동하는 명령은 백색부터 시작해서, 흑과 백이 번갈아서 처리해야
}

// 8x8 크기 체스판에 체스말(Piece) 존재 여부를 관리
final class Board2 {
    
    init() {
        // 특정 위치에 특정 말 생성
        // 초기화할 때 1,2-rank는 흑백 체스말이, 7,8-rank는 백색 체스말이 위치한다.
        // 체스말 초기 위치가 아니면 생성하지 않는다.
        // 이미 해당 위치에 다른 말이 있으면 생성하지 않는다.
        // 체스말 종류별로 최대 개수보다 많이 생성할 수는 없다.
        // Pawn는 색상별로 8개만 가능하다.
    }
    
    // 현재 있는 말을 확인해서 흑과 백 점수를 출력
    
    // 모든 말의 위치를 알 수 있고,
    
    func display() {
        // 1-rank부터 8-rank까지 rank 문자열 배열로 보드 위에 체스말을 리턴
    }
    
    // 특정 말을 옮기는 메소드
    // 체스말은 위치값은 가로 file은 A부터 H까지, 세로 rank는 1부터 8까지 입력이 가능
    func move(to: Int) {
        // 같은 색상의 말이 to 위치에 다른 말이 이미 있으면 옮길 수 없다.
        // 말을 옮길 수 있으면 true, 옮길 수 없으면 false를 리턴한다.
        // 만약, 다른 색상의 말이 to 위치에 있는 경우는 기존에 있던 말을 제거하고 이동한다.
    }
    
    
}


// 1 rank - 흑색 체스말
// 2 rank - 흑색 체스말
// 3 rank
// 4 rank
// 5 rank
// 6 rank
// 7 rank - 백색 체스말
// 8 rank - 백색 체스말
