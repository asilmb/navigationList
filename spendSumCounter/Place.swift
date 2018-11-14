//
//  Place.swift
//  spendSumCounter
//
//  Created by Admin on 07.06.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import MapKit

class Place {
    var name: String = ""//названия
    var spend: Spend = Spend(howMuch: 0, currency: CurrencyEnum.usd) //суммы затрат с валютой
    var transportType: TransportTypeEnum = TransportTypeEnum.airplane//суммы затрат с валютой
    var rate: RateEnum = RateEnum.excellent
    var description: String = ""
    var annotation: MKPointAnnotation = MKPointAnnotation()
    
}

enum TransportTypeEnum: String {
    case train = "🚂",
     auto = "🚙",
     airplane = "✈️"
}

enum RateEnum: Int {
    case bad = 1,
    notBad = 2,
    good,
    nice,
    excellent
}
