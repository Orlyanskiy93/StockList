//
//  UIViewInput.swift
//  StockList
//
//  Created by Дмитрий Орлянский on 28.02.2021.
//

import UIKit

protocol UIViewInput {
    func show(_ error: Error)
}

extension UIViewInput {
    func show(_ error: Error) {
        guard let vc = self as? UIViewController else { return }
        let allert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: .none)
        allert.addAction(action)
        vc.present(allert, animated: true, completion: nil)
    }
}
