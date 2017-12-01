//
//  InputView.swift
//  JSONParser
//
//  Created by Mrlee on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct InputView {
    func read() -> String? {
        guard let userRawData = readLine() else {
            return nil
        }
        return userRawData
    }
    
}