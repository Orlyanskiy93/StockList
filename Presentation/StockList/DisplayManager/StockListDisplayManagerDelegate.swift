//
//  StockListDisplayManagerDelegate.swift
//  StockList
//
//  Created by Дмитрий Орлянский on 26.02.2021.
//

import Foundation

protocol StockListDisplayManagerDelegate {
    func stockListDisplayManager(_ stockListDisplayManager: StockListDisplayManager, didSelectStock stock: Stock)
}
