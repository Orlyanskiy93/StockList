//
//  CompanyLogo.swift
//  StockList
//
//  Created by Дмитрий Орлянский on 06.03.2021.
//

import Foundation
import ObjectMapper

struct CompanyLogo: ImmutableMappable {
    var url: URL
    
    init(map: Map) throws {
        let urlString: String = try map.value("url")
        url = URL(string: urlString)!
    }
}
