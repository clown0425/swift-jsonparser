//
//  TypeCheckerTest.swift
//  JSONParserTests
//
//  Created by 이동영 on 11/05/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class TypeCheckerTest: XCTestCase {
    var typeChecker : TypeChecker!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.typeChecker = TypeChecker()
    }
    
    
    func testCheckStringToSuccess(){
        //Given
        let dataOfString = "\"Hello world\""
        //When
        let result = typeChecker.check(dataOfString, type: .String)
        //Then
        XCTAssertTrue(result, "String 형식 체크에 성공합니다.")
    }
    func testCheckStringToFail(){
        //Given
        let dataToFail = "Fail"
        //When
        let result = typeChecker.check(dataToFail, type: .String)
        //Then
        XCTAssertFalse(result, "String 형식이 아닌 데이터에 대해서 실패합니다.")
    }
    
    func testCheckNumberToSuccess(){
        //Given
        let dataOfPositiveNumber = "10"
        let dataOfNegativeNumber = "-10"
        //When
        let resultOfPositiveNumber = typeChecker.check(dataOfPositiveNumber, type: .Number)
        let resultOfNegativeNumber = typeChecker.check(dataOfNegativeNumber, type: .Number)
        //Then
        XCTAssertTrue(resultOfPositiveNumber, "PositiveNumber 체크에 성공합니다.")
        XCTAssertTrue(resultOfNegativeNumber, "NegativeNumber 체크에 성공합니다.")
    }
    
    func testCheckNumberToFail(){
        //Given
         let dataToFail = "Fail"
        //When
        let result = typeChecker.check(dataToFail, type: .String)
        //Then
        XCTAssertFalse(result, "Number 형식이 아닌 데이터에 대해서 실패합니다.")
    }
    
    func testCheckBooleanToSuccess(){
        //Given
        let dataOfBoolean = "true"
        //When
        let result = typeChecker.check(dataOfBoolean, type: .String)
        //Then
        XCTAssertTrue(result, "Boolean 형식 체크에 성공합니다.")
    }
    func testCheckBooleanToFail(){
        //Given
        let dataToFail = "Fail"
        //When
        let result = typeChecker.check(dataToFail, type: .String)
        //Then
        XCTAssertFalse(result, "Boolean 형식이 아닌 데이터에 대해서 실패합니다.")
    }
    func testCheckArrayToSuccess(){
        //Given
        let dataOfArray = "[]"
        //When
        let result = typeChecker.check(dataOfArray, type: .String)
        //Then
        XCTAssertTrue(result, "문자열 체크에 성공합니다.")
    }
    func testCheckArrayToFail(){
        //Given
        let dataToFail = "Fail"
        //When
        let result = typeChecker.check(dataToFail, type: .String)
        //Then
        XCTAssertFalse(result, "배열형식이 아닌 데이터에 대해서 실패합니다.")
    }

}