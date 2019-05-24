import Foundation

struct Parser {
    
    enum ParsingError: Error {
        case foundUnsupportedType
        case objectKeyMustBeString
        case objectKeyMustBeOneAndOnly
    }
    
    static func parseValue(_ input: String) throws -> JSONType {
        if let string = parseString(input) { return string }
        else if let bool = parseBool(input) { return bool }
        else if let number = parseNumber(input) { return number }
        else if let object = try parseObject(input) { return object }
        else if let array = try parseArray(input) { return array }
        throw ParsingError.foundUnsupportedType
    }
    
    private static func parseString(_ input: String) -> String? {
        guard input.first == Token.quotationMark, input.last == Token.quotationMark else { return nil }
        var input = input
        input.removeFirst()
        input.removeLast()
        return input
    }
    
    private static func parseNumber(_ input: String) -> Number? {
        return Number(input)
    }
    
    private static func parseBool(_ input: String) -> Bool? {
        switch input {
        case "true":
            return true
        case "false":
            return false
        default:
            return nil
        }
    }
    
    private static func parseObject(_ input: String) throws -> [String: JSONType]? {
        guard input.first == Token.beginObject else { return nil }
        let tokenizedInput = try Tokenizer.objectTokenize(input: input)
        if tokenizedInput.isEmpty { return tokenizedInput }
        var result = [String: JSONType]()
        for (key, value) in tokenizedInput {
            guard let key = parseString(key) else {
                throw ParsingError.objectKeyMustBeString
            }
            let value = try parseValue(value)
            result[key] = value
        }
        return result
    }
    
    private static func parseArray(_ input: String) throws -> [JSONType]? {
        guard input.first == Token.beginArray else { return nil }
        let tokenizedInput = try Tokenizer.arrayTokenize(input: input)
        if tokenizedInput.isEmpty { return tokenizedInput }
        var result = [JSONType]()
        for value in tokenizedInput {
            result.append(try parseValue(value))
        }
        return result
    }
    
    
}
