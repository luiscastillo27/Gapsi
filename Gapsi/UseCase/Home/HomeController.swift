//
//  HomeController.swift
//  Gapsi
//
//  Created by luis on 13/11/20.
//

import UIKit
import SVProgressHUD

class HomeController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: Variables and Constants
    private let viewModel = ProductViewModel()
    private var listProducts:[Product] = []
    
    // MARK: View Life
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        setup()
        localize()
    }

    // MARK: Functions
    private func setup() {
        setupTable()
        loadSeach(search: "computer")
    }
    
    private func localize() {
        title = "Gapsi"
    }
    
    private func setupTable() {
        tableView.configure(owner: self)
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        tableView.register(UINib(nibName: ProductsCell.kCellId, bundle: nil), forCellReuseIdentifier: ProductsCell.kCellId)
    }
    
    private func loadSeach( search:String ){
        self.listProducts = []
        SVProgressHUD.show()
        Singelton.manager.currentSearch = search
        viewModel.getProducts() { [unowned self] result in
            SVProgressHUD.dismiss()
            switch result {
            case .success(let data):
                self.listProducts = data
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
                self.hendlerError(this: self, complete: { _ in })
            }
        }
    }

}


// MARK: - UITableViewDataSource, UITableViewDelegate
extension HomeController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listProducts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProductsCell.kCellId, for: indexPath) as? ProductsCell {
            cell.fill(product: self.listProducts[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }

 
}


extension HomeController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("hola: ", searchText)
        Singelton.manager.currentSearch = searchText
        self.loadSeach(search: searchText)
    }
    
}
