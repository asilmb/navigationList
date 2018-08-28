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
    func getCurrencyHash() -> Int {
        return self.currency.hashValue
    }
    func getCurrencyRaw() -> String {
        return self.currency.rawValue
    }
}

enum CurrencyEnum: String {
    case usd = "$"
    case euro = "€"
    case rub = "₽"
}
