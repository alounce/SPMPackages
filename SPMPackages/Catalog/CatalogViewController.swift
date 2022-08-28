//
//  CatalogViewController.swift
//  Packages
//
//  Created by Oleksa on 1/17/22.
//

import UIKit
import Combine
import CoreHelpers
import Networking

import AppCenterCrashes

final class CatalogViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    
    private var bag: Set<AnyCancellable> = []
    private var products: Products = []
    private var dataSource: UITableViewDiffableDataSource<Section, Product>!
    // must be an injection
    private let dataService: DataService = DataServiceImpl(api: APIService())
    
    private enum Section {
        case products
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        load()
        change() // just to see diffable datasource in action
        
// Just for testing crash registration
//        DispatchQueue.main.asyncAfter(deadline: .now().advanced(by: .seconds(10))) {
//            fatalError("### OLEKSA: Simulating crash")
//        }
    }
    
    private func configure() {
        title = "Catalog"
        dataSource = UITableViewDiffableDataSource(
            tableView: tableView,
            cellProvider: { tableView, indexPath, model -> UITableViewCell? in
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "ProductCell",
                    for: indexPath
                ) as? ProductCell
                cell?.configure(
                    title: model.title,
                    details: model.details,
                    price: StringFormatter.stringFromMoney(model.price)
                )
                return cell
            }
        )
    }
    
    // just to see diffable datasource in action
    private func change() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {[weak self] in
            guard let self = self else { return }
            let newId = self.products.map{ $0.id }.max()! + 1
            self.products.remove(at: 5)
            self.products.insert(
                Product(
                    id: newId,
                    title: "New product #\(newId)",
                    details: "description for new product #\(newId)",
                    price: 333 + newId
                ), at: 1)
            self.updateDataSource(items: self.products)
            self.change() // <<< recursive call
        }
    }
    
    private func updateDataSource(items: Products) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Product>()
        snapshot.appendSections([.products])
        snapshot.appendItems(products, toSection: .products)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    private func load() {
        dataService
            .loadProducts()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                print("###: Load Product Handler Thread: \(Thread.current)")
            }, receiveValue: { [weak self] items in
                self?.products = items
                self?.updateDataSource(items: items)
            })
            .store(in: &bag)
    }
}

