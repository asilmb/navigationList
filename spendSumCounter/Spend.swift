//
//  Spend.swift
//  spendSumCounter
//
//  Created by Admin on 10.06.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

class Spend {
    
    var amount: Double
    var currency: CurrencyEnum
    
    init(howMuch value: Double, currency: CurrencyEnum) {
        self.amount = value
        self.currency = currency
    }
    
    func getStringSum() -> String {
        return String(format:"%.1f", self.amount)
    }
   
}

enum CurrencyEnum: String {
    case
    eur = "eur",
    usd = "usd",
    rur = "rur"
    
    var identifier: Int {
        get {
            switch rawValue {
            case "eur":
                return 0
            case "usd":
                return 1
            case "rur":
                return 2
            default:
                return 0
            }
        }
    }
    
    var sign: String {
        get {
            switch rawValue {
            case "eur":
                return "\u{20AC}"
            case "usd":
                return "\u{0024}"
            case "rur":
                return "\u{20BD}"
            default:
                return ""
            }
        }
    }
    static func getRawValue(at: Int)-> String {
        switch at {
        case 0:
            return "eur"
        case 1:
            return "usd"
        case 2:
            return "rur"
        default:
            return "eur"
        }
    }
    static let allValues = [eur, usd, rur]
}
