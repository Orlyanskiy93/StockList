//
//  StockType.swift
//  StockList
//
//  Created by Дмитрий Орлянский on 04.03.2021.
//

import Foundation

enum StockType: Int, CaseIterable {
    case mostActive = 0
    case gainers = 1
    case losers = 2
    
    var routeUrlString: String {
        switch self {
        case .mostActive:
            return "stock/market/list/mostActive"
        case .gainers:
            return "stock/market/list/gainers"
        case .losers:
            return "stock/market/list/losers"
        }
    }
    
    var name: String {
        switch self {
        case .mostActive:
            return "Most active"
        case .gainers:
            return "Gainers"
        case .losers:
            return "Losers"
        }
    }
}
