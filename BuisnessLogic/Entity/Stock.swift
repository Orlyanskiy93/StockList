//
//  Stock.swift
//  StockList
//
//  Created by Дмитрий Орлянский on 25.02.2021.
//

import Foundation
import ObjectMapper

struct Stock: ImmutableMappable {
    var symbol: String
    var name: String
    var price: Double
    var priceChange: Double?
    var open: Double?
    var low: Double?
    var high: Double?
        
    init(map: Map) throws {
        symbol = try map.value("symbol")
        name = try map.value("companyName")
        price = try map.value("latestPrice")
        priceChange = try? map.value("change")
        open = try? map.value("iexOpen")
        low = try? map.value("low")
        high = try? map.value("high")
    }
}
