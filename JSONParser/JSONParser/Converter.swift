//
//  Converter.swift
//  JSONParser
//
//  Created by 이희찬 on 03/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct converter {

    private let dataTypeCriterion = DataTypeCriterion()
    private var countCanNotConvertData = 0
    private var canNotConvertData:[String] = []
    
    static func convertToArray(JSON:String) -> [String] {
        
        let removedJSONArrayFormatInput = JSON.trimmingCharacters(in: FormatItem.JSONArrayFormat)
        let removedblankInput = removedJSONArrayFormatInput.split(separator: FormatItem.blank).joined()
        return removedblankInput.components(separatedBy: FormatItem.arraySperator)
        
    }
    
    mutating func parsing(JSON:[String])throws -> JSONParser {
        
        var JSONParserData = JSONParser()
        
        for item in JSON {
            
            if dataTypeCriterion.distinguishingString.isStrictSubset(of: CharacterSet(charactersIn: item)) {
                JSONParserData.JSONParserValue.append(String(item))
                JSONParserData.countString += 1
                continue
            }
            
            if CharacterSet(charactersIn: item).isStrictSubset(of: dataTypeCriterion.distinguishingInt){
                JSONParserData.JSONParserValue.append(Int(item)!)
                JSONParserData.countInt += 1
                continue
            }
            
            if item == dataTypeCriterion.distinguishingBool.true || item == dataTypeCriterion.distinguishingBool.false {
                JSONParserData.JSONParserValue.append(Bool(item)!)
                JSONParserData.countBool += 1
                continue
            }
            canNotConvertData.append(item)
            countCanNotConvertData += 1
        }
        
        guard countCanNotConvertData == 0 else{
            print(canNotConvertData)
            throw ConvertError.canNotCovertData
        }
        
        return JSONParserData
        
    }
    
}



