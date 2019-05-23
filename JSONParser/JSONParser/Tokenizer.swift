//
//  Tokenizer.swift
//  JSONParser
//
//  Created by CHOMINJI on 19/05/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Tokenizer {
    
    static func tokenize(from prompt: String) -> [String] {
        let trimmed = prompt.split(separator: " ").joined()
        let input = trimmed.splitByLeftBracket().splitByRightBracket()
        let tokens = input.components(separatedBy: ",")
        print(tokens)
        return tokens
    }
}

extension String {
    func splitByLeftBracket() -> String {
        return self.split(separator: "[").joined()
    }
    
    func splitByRightBracket() -> String {
        return self.split(separator: "]").joined()
    }
}
