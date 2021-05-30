//
//  StockListViewController.swift
//  StockList
//
//  Created by Дмитрий Орлянский on 25.02.2021.
//

import UIKit

class StockListViewController: UIViewController, StockListViewInput, StockListDisplayManagerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activitiIndicator: UIActivityIndicatorView!
    @IBOutlet var tryAgainButton: UIButton!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    var output: StockListViewOutput!
    
    lazy var stockDisplayManager: StockListDisplayManager = {
        let displayManager = StockListDisplayManager(tableView)
        return displayManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = StockListPresenter(view: self)
        output.viewIsReady()
    }
    
    func setupInitialState() {
        setupSegmentControl()
        stockDisplayManager.delegate = self
        activitiIndicator.hidesWhenStopped = true
        tryAgainButton.isHidden = true
        tableView.isHidden = true
    }

    func setupSegmentControl() {
        segmentedControl.removeAllSegments()
        let allCases = StockType.allCases
        allCases.forEach { (type) in
            segmentedControl.insertSegment(withTitle: type.name, at: type.rawValue, animated: false)
        }
        segmentedControl.selectedSegmentIndex = 0
    }
    
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        output.didSelectSegment(sender.selectedSegmentIndex)
    }
    
    @IBAction func tryAgain(_ sender: Any) {
        output.didSelectSegment(segmentedControl.selectedSegmentIndex)
    }

    func stopLoading() {
        activitiIndicator.stopAnimating()
        if stockDisplayManager.stockArray.isEmpty {
            tryAgainButton.isHidden = false
        } else {
            tableView.isHidden = false
            segmentedControl.isHidden = false
        }
    }
    
    func startLoading() {
        tryAgainButton.isHidden = true
        activitiIndicator.startAnimating()
        tableView.isHidden = true
    }
    
    func update(_ stocks: [Stock]) {
        stockDisplayManager.stockArray = stocks
    }

    func stockListDisplayManager(_ stockListDisplayManager: StockListDisplayManager, didSelectStock stock: Stock) {
        performSegue(withIdentifier: "aboutSegue", sender: .none)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = stockDisplayManager.tableView.indexPathForSelectedRow else {
            return
        }
        let stock = stockDisplayManager.stockArray[indexPath.row]
        if let aboutVC = segue.destination as? AboutViewController {
            aboutVC.stock = stock
        }
    }
}
