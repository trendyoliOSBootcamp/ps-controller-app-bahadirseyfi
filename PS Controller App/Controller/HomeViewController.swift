//
//  ViewController.swift
//  PS Controller App
//
//  Created by bahadir on 1.05.2021.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var productsCollectionView: UICollectionView!
    @IBOutlet private weak var sectionCollectionView: UICollectionView!
    
    let products: [ProductModel] = [.init(name: "Dual Sense", description: "Official PS5 controller", image: UIImage(named: "blackPSController")!),
                                    .init(name: "Dual Sense", description: "Official PS5 controller", image: UIImage(named: "whitePSController")!),
                                    .init(name: "Dual Sense", description: "Official PS5 controller", image: UIImage(named: "blackPSController")!)]
    
    let sections: [SectionModel] = [.init(backgroundImage: UIImage(named: "selectedTabBackground")!, sectionImage: UIImage(named: "controllerIcon")!),
                                    .init(backgroundImage: UIImage(named: "unSelectedTabBackground")!, sectionImage: UIImage(named: "mouseIcon")!),
                                    .init(backgroundImage: UIImage(named: "unSelectedTabBackground")!, sectionImage: UIImage(named: "switchIcon")!),
                                    .init(backgroundImage: UIImage(named: "unSelectedTabBackground")!, sectionImage: UIImage(named: "controllerIcon")!),
                                    .init(backgroundImage: UIImage(named: "unSelectedTabBackground")!, sectionImage: UIImage(named: "mouseIcon")!),
                                    .init(backgroundImage: UIImage(named: "unSelectedTabBackground")!, sectionImage: UIImage(named: "switchIcon")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productsCollectionView.dataSource = self
        productsCollectionView.delegate = self
        sectionCollectionView.dataSource = self
        sectionCollectionView.delegate = self
        
    }
}

extension UIViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 28 + x + 24 + x. 0.3982 = collectionViewWidth
        let cellWidth = (collectionView.frame.width - 28 - 24) / 1.3982
        // ratio w/h 231.0 / 291.0
        print(cellWidth)
        return .init(width: cellWidth, height: cellWidth / 0.7938)
//        return .init(width: cellWidth, height: 300)
    }
}

/*
extension HomeViewController: UICollectionViewDelegate {
    
}
*/
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == productsCollectionView {
            return products.count
        } else {
            return sections.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == productsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductsCell
            let product = products[indexPath.item]
            cell.configureUI(image: product.image, name: product.name, description: product.description)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sectionCell", for: indexPath) as! SectionCell
            let section = sections[indexPath.item]
            cell.configureUI(backImage: section.backgroundImage, secImage: section.sectionImage)
            return cell
        }
        
    }
}
