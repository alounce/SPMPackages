//
//  ProductCell.swift
//  Packages
//
//  Created by Oleksa on 1/17/22.
//

import UIKit

final class ProductCell: UITableViewCell {

    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var detailsLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(title: String, details: String, price: String) {
        titleLabel.text = title
        detailsLabel.text = details
        priceLabel.text = price
    }

}
