//
//  JsonParser.swift
//  JsonParser
//
//  Created by 이희찬 on 03/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class FormatTest: XCTestCase {

    func testCorrectFormatOfJSON() {
        var dataParser = DataParsingFactory()
        XCTAssertNoThrow(try dataParser.makeParsingData(input: "[ 10, \"jk\", 4, \"314\", 99, \"crong\", false]"))
    }

    func testInCorrectFormatOfJSON() {
        var dataParser = DataParsingFactory()
        XCTAssertThrowsError(try dataParser.makeParsingData(input: " 10, \"jk\", 4, \"314\", 99, \"crong\", false"))
    }
    
    func testCanConvertArray() {
        var dataParser = DataParsingFactory()
        XCTAssertNoThrow(try dataParser.makeParsingData(input: "[ 10, \"jk\", 4, \"314\", 99, \"crong\", false]"))
    }
    
    func testContainCanNotConvertData() {
        var dataParser = DataParsingFactory()
        XCTAssertThrowsError(try dataParser.makeParsingData(input: "[ 10, \"jk\", 4, \"314\", 99, \"crong\", false, canNotConvertData]"))
    }
    
    func testCanConvertArrayContainObject() {
        var dataParser = DataParsingFactory()
        XCTAssertNoThrow(try dataParser.makeParsingData(input: "[{ \"name\" : \"KIM JUNG\"}, { \"alias\" : \"JK\", \"level\" : 5, \"married\" : true }, true, 5, \"alias\"]"))
    }
    
    func testCanNotConvertArrayContainObject() {
        var dataParser = DataParsingFactory()
        XCTAssertThrowsError(try dataParser.makeParsingData(input: "[ {\"name\" : \"KIM JUNG\", { \"alias\" : \"JK\", \"level\" : 5, \"married\" : true }, true, 5, \"alias\"]"))
    }
}
