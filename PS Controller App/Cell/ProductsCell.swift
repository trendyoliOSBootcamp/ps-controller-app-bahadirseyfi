//
//  ProductsCell.swift
//  PS Controller App
//
//  Created by bahadir on 2.05.2021.
//

import UIKit

class ProductsCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    func configureUI(image: UIImage, name: String, description: String) {
        productImage.image = image
        nameLabel.text = name
        descriptionLabel.text = description
    }
}
