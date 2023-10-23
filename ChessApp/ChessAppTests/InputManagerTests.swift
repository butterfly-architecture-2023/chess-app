//
//  InputManagerTests.swift
//  ChessAppTests
//
//  Created by 김도형 on 2023/10/24.
//

import XCTest
@testable import ChessApp

final class InputManagerTests: XCTestCase {
    var sut: InputManager!
    
    override func setUp() {
        super.setUp()
        
        self.sut = InputManager(separator: "->")
    }
    
    func test_makeFormattedInputs메서드_성공케이스() throws {
        let (source, destination) = try self.sut.makeFormattedInputs(from: "A2->A3")
        
        XCTAssertEqual(source, Position(file: .A, rank: .two))
        XCTAssertEqual(destination, Position(file: .A, rank: .three))
    }
    
    func test_makeFormattedInputs메서드_실패케이스_sperator_가_다를때() throws {
        do {
           _ = try self.sut.makeFormattedInputs(from: "A2:A3")
        } catch let error {
            let error = try XCTUnwrap(error as? InputError)
            XCTAssertEqual(error, InputError.invalidSeparator)
        }
        
    }
    
    func test_makeFormattedInputs메서드_실패케이스_file_범위에서_벗어났을때() throws {
        do {
           _ = try self.sut.makeFormattedInputs(from: "Z1->T3")
        } catch let error {
            let error = try XCTUnwrap(error as? InputError)
            XCTAssertEqual(error, InputError.overRange)
        }
        
    }
    
    func test_makeFormattedInputs메서드_실패케이스_rank_범위에서_벗어났을때() throws {
        do {
           _ = try self.sut.makeFormattedInputs(from: "B10->C11")
        } catch let error {
            let error = try XCTUnwrap(error as? InputError)
            XCTAssertEqual(error, InputError.overRange)
        }
        
    }
}
