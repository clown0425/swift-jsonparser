import Foundation

protocol Parser {
    
    mutating func result() throws -> SupportedType
    
    /// 문자를 분석하고 결과를 저장합니다.
    ///
    /// - Parameter character: JSON 문자입니다.
    /// - Returns: 계속 실행되어야하면 true를 반환합니다. 작동이 중지되어야하면 false를 반환합니다.
    /// - Throws: 분석 중 올바르지 않은 문자를 발견하면 오류를 발생시킵니다.
    mutating func parse(_ character: Character) throws -> Bool
    
}
