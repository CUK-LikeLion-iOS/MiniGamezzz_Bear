//
//  HomeViewController.swift
//  minigame
//
//  Created by 김정원 on 2023/05/11.
//

import UIKit
import Foundation
class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
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
        return cell
    }
}

// view 레이아웃을 지정해주는 함수
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height/3)
    }
}




















//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.register(UINib(nibName: "FrameworkCell", bundle: nil), forCellWithReuseIdentifier: "FrameworkCell")
//
//        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        print(1)
//
//    }
//


//extension HomeViewController :UICollectionViewDelegate {
//
//}
//extension HomeViewController : UICollectionViewDataSource{
//    //섹션에 들어가는 아이템 갯수
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return list.count
//    }
//    // 셀에 대한 설정
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cellId = String(describing: HomeViewController.self)
//        print("cellId: \(cellId)")
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeViewController", for: indexPath) as! FrameworkCell
//        let framework = list[indexPath.item]
//        cell.configure(framework)
//        return cell
//    }
//
//
//}
//
//
//
//
//
//
////extension HomeViewController: UICollectionViewDataSource{
////    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        return list.count
////    }
////    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
////            return UICollectionViewCell()
////        }
////        let framework = list[indexPath.item]
////        cell.configure(framework)
////        return cell
////
////    }
////
////}
////extension HomeViewController: UICollectionViewDelegateFlowLayout {
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////
////        // 3열일때 계산
////        let interItemSpacing: CGFloat = 10
////        let padding: CGFloat = 16
////
////        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2)
////        let height = width * 1.5
////        return CGSize(width: width, height: height)
////
////    }
////
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
////        return 10
////    }
////
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
////        return 10
////    }
////}
////
////extension HomeViewController: UICollectionViewDelegate {
////    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        let framework = list[indexPath.item]
////        print(">>> selected: \(framework.name)")
////    }
////}
