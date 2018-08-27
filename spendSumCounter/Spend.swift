//
//  Spend.swift
//  spendSumCounter
//
//  Created by Admin on 10.06.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

class Spend {
    
    let sum: Double
    let currency: CurrencyEnum
    
    init(howMuch value: Double, currency: CurrencyEnum) {
        self.sum = value
        self.currency = currency
    }
    
}

enum CurrencyEnum: String {
    case usd = "$"
    case euro = "€"
    case rub = "₽"
}
