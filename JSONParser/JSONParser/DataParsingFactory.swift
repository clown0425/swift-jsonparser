//
//  Validator.swift
//  JSONParser
//
//  Created by 이희찬 on 03/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

typealias countNumbers = (string:Int, int:Int, bool: Int)

struct DataParsingFactory {
    
    mutating func makeParsingData(data:[String])throws -> JSONParse {
        let (parsingData,canNotParsingData) = parsing(datas: data)
        try canNotConvertDataPrint(data: canNotParsingData)
        return parsingData
    }
    
    private func parsing(datas:[String]) -> (JSONParse,CanNotParsingData) {
        let dataTypeCriterion = DataTypeCriterion()
        var ParsedData:[JSONValue] = []
        var canNotParsingData:[String] = []
        var countString = 0, countInt = 0, countBool = 0
        
        for element in datas {
            
            if isString(data: element, dataTypeCriterion: dataTypeCriterion) {
                ParsedData.append(String(element))
                countString += 1
                continue
            }
            if isInt(data: element, dataTypeCriterion: dataTypeCriterion) {
                ParsedData.append(Int(element)!)
                countInt += 1
                continue
            }
            if isBool(data: element, dataTypeCriterion: dataTypeCriterion) {
                ParsedData.append(Bool(element)!)
                countBool += 1
                continue
            }
            
            canNotParsingData.append(element)
            
        }
        return (JSONParse(ParsedData, countNumbers:(countString, countInt, countBool)), CanNotParsingData(canNotParsingData))
    }
    
    private func isString(data:String, dataTypeCriterion:DataTypeCriterion) -> Bool {
        return dataTypeCriterion.String.isStrictSubset(of: CharacterSet(charactersIn: data))
    }
    
    private func isInt(data:String, dataTypeCriterion:DataTypeCriterion) -> Bool {
        return CharacterSet(charactersIn: data).isStrictSubset(of: dataTypeCriterion.Int)
    }
    
    private func isBool(data:String, dataTypeCriterion:DataTypeCriterion) -> Bool {
        return data == dataTypeCriterion.Bool.true || data == dataTypeCriterion.Bool.false
    }
    
    private func canNotConvertDataPrint(data:CanNotParsingData)throws {
        
        guard data.count == 0 else{
            print(data.canNotParsingData)
            throw ConvertError.canNotCovertData
        }
        
    }
}
