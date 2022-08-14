//
//  PhoneNumberFormatter.swift
//  CarAlarmControl
//
//  Created by Павел Барташов on 28.05.2022.
//

struct PhoneNumberFormatter {
    private let pattern: Array<Character>
    private let patternValidSymbolsCount: Int
    private let otherValidSymbols: String
    
    init(pattern: Array<Character> = Array("x xxx xxx-xx-xx"),
         otherValidSymbols: String = "#*") {
        self.pattern = pattern
        self.otherValidSymbols = otherValidSymbols
        self.patternValidSymbolsCount = pattern.filter { $0 == "x" || otherValidSymbols.contains($0) }
            .count
    }
    
    func formDisplayedText(from input: String) -> String {
        var billet = input.filter { $0.isNumber || otherValidSymbols.contains($0) }
            .prefix(patternValidSymbolsCount)
        
        if billet.contains(where: { otherValidSymbols.contains($0) } ) {
            return String(billet)
        }
        
        var result = ""
        var index = pattern.count - 1
        
        while let d = billet.popLast(), index >= 0 {
            while pattern[index] != "x" && index >= 0 {
                result.insert(pattern[index], at: result.startIndex)
                index -= 1
            }
            
            result.insert(d, at: result.startIndex)
            index -= 1
        }
        
        return result
    }
    
    func formPhoneNumber(from input: String) -> String {
        String(input.filter { $0.isNumber || otherValidSymbols.contains($0) }
            .prefix(patternValidSymbolsCount))
    }
}
