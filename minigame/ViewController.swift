//
//  ViewController.swift
//  minigame
//
//  Created by 김정원 on 2023/05/10.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    @IBOutlet weak var animationView: LottieAnimationView!
    // @IBOutlet var home: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            print("dd")
            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.present(homeVC, animated: true, completion: nil)
        }
    }
    
    
}

