//
//  MyCollectionViewCell.swift
//  minigame
//
//  Created by 김정원 on 2023/05/11.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gameDescription: UILabel!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!

    func configure(_ framework: GameFramework) {
        gameName.text = "\(framework.name)"
        thumbnail.image = UIImage(systemName: framework.imageName)
        gameDescription.text = framework.description

    }
    
}
