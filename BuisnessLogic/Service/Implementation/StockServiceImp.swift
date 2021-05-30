//
//  StockServiceImp.swift
//  StockList
//
//  Created by Дмитрий Орлянский on 25.02.2021.
//

import Foundation
import Alamofire
import ObjectMapper
import PromiseKit


class StockServiceImp: StockService {
    static let token = "pk_742e2bcb078b4ef7bbce73527a98c2a3"
    let baseUrl = URL(string: "https://cloud.iexapis.com/stable")!
        
    static let shared = StockServiceImp()
    private init(){}
    
    func getList(_ type: StockType) -> Promise<[Stock]> {
        return Promise { seal in
            let url = baseUrl.appendingPathComponent(type.routeUrlString)
            let parametrs: Parameters = ["token": StockServiceImp.token]

            AF.request(url, parameters: parametrs).validate().responseJSON { (response) in
                switch response.result {
                case.success(let data):
                    do {
                        let stocks = try Mapper<Stock>().mapArray(JSONObject: data)
                        seal.fulfill(stocks)
                    } catch {
                        seal.reject(error)
                    }
                case .failure(let error):
                    guard let data = response.data,
                          let string = try? JSONSerialization.jsonObject(with: data, options: []) as? String else {
                        seal.reject(error)
                        return
                    }
                    let errorMesssage = StockError.custom(string)
                    seal.reject(errorMesssage)
                }
            }
        }
    }
    
    func getLogoUrl(symbol: String) -> Promise<CompanyLogo> {
        return Promise { seal in
            let url = baseUrl.appendingPathComponent("stock/\(symbol)/logo")
            let parametrs: Parameters = ["token": StockServiceImp.token]
            
            AF.request(url, parameters: parametrs).validate().responseJSON { (response) in
                switch response.result {
                case.success(let data):
                    do {
                        let logo = try Mapper<CompanyLogo>().map(JSONObject: data)
                        seal.fulfill(logo)
                    } catch {
                        seal.reject(error)
                    }
                case.failure(let error):
                    guard let data = response.data,
                          let string = try? JSONSerialization.jsonObject(with: data, options: []) as? String else {
                        seal.reject(error)
                        return
                    }
                    let errorMesssage = StockError.custom(string)
                    seal.reject(errorMesssage)
                }
            }
        }
    }
}
