//
//  SectionCell.swift
//  PS Controller App
//
//  Created by bahadir on 2.05.2021.
//

import UIKit

class SectionCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var sectionImage: UIImageView!
    
    func configureUI(backImage: UIImage, secImage: UIImage) {
        backgroundImage.image = backImage
        sectionImage.image = secImage
    }
}
