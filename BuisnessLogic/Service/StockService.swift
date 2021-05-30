//
//  StockService.swift
//  StockList
//
//  Created by Дмитрий Орлянский on 25.02.2021.
//

import Foundation
import PromiseKit

protocol StockService {
    func getList(_ type: StockType) -> Promise<[Stock]>
    func getLogoUrl(symbol: String) -> Promise<CompanyLogo>
}
