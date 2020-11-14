//
//  ProductsCell.swift
//  Gapsi
//
//  Created by luis on 13/11/20.
//

import UIKit
import Kingfisher

class ProductsCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    // MARK: Variables and Constants
    static let kCellId = "ProductsCell"
    
    // MARK: View Life
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Functions
    func fill(product: Product) {
        productNameLabel.text = product.title
        productPriceLabel.text = "$ \(product.price)"
        productImage.kf.indicatorType = .activity
        productImage.kf.setImage(with: URL(string: product.image), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil )
    }
    
    private func setup() {
        configure()
        setupUI()
    }
    
    private func setupUI() {
        productNameLabel.primary()
        productPriceLabel.secondary()
    }
   
    
}
