//
//  AboutViewIO.swift
//  StockList
//
//  Created by Дмитрий Орлянский on 25.02.2021.
//

import Foundation

protocol AboutViewInput: class, UIViewInput {
    func setupInitialState()
    func fillLabels()
    func loadLogoWith(_ logoUrl: URL)
    func startLoading()
    func stopLoading()
}

protocol AboutViewOutput {
    func viewIsReady()
    func getCompanyLogo(companySymbol: String)
}
