import UIKit
import Foundation
class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

   // var dataSource : UICollectionViewDiffableDataSource<Section,Item>!
    let list : [GameFramework] = GameFramework.list

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self

    }
}
// 데이터를 전달해주는 함수
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as? MyCollectionViewCell else {
            return UICollectionViewCell()
        }

        let framework = list[indexPath.item]
        cell.configure(framework)

        cell.playButton.tag = indexPath.row
        cell.playButton.addTarget(self, action: #selector(playGame(sender: )), for: .touchUpInside)

        return cell
    }

    @objc func playGame(sender: UIButton) {
        let gameID = GameFramework.list[sender.tag].id

        guard let setPlayerNumberVC = self.storyboard?.instantiateViewController(withIdentifier: "SetPlayerNumber") as? SetPlayerNumberVC else { return }

        setPlayerNumberVC.gameID = gameID
        self.present(setPlayerNumberVC, animated: false)
    }
}

// view 레이아웃을 지정해주는 함수
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height/3)
    }
}

