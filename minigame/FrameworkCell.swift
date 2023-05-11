import Foundation
import UIKit

class FrameworkCell: UICollectionViewCell {
    
    // @IBOutlet weak var description: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var textDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        print("view")
        nameLabel.numberOfLines = 1
        nameLabel.adjustsFontSizeToFitWidth = true
        
    }
    func configure (_ framework : GameFramework)
    {
        thumbnailImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
        textDescription.text = framework.description
    }
}
