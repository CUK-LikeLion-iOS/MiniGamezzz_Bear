//
//  SetPlayerNumberVC.swift
//  minigame
//
//  Created by Demian on 2023/05/15.
//

import UIKit

class SetPlayerNumberVC: UIViewController {
    @IBOutlet weak var playerNumberTextField: UITextField!
    
  
    var gameID: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startClick(_ sender: Any) {
        guard let playerNumber = Int(playerNumberTextField.text ?? "1") else { return }
        
        if (gameID == "ShakeIt") {
            guard let gameVC =
                    self.storyboard?.instantiateViewController(withIdentifier: "ShakeItGameVC") as? ShakeItGameVC else {return }
            gameVC.playerNumber = playerNumber
            self.present(gameVC, animated: true,completion: nil)
        }
        else if (gameID == "Tap") {
            
            guard let gameVC =
                    self.storyboard?.instantiateViewController(withIdentifier: "TapTapGameVC") as? TapTapGameVC else {return }
            gameVC.playerNumber = playerNumber
            self.present(gameVC, animated: true,completion: nil)
        }
        else if (gameID == "Bubi") {
            
            guard let gameVC =
                    self.storyboard?.instantiateViewController(withIdentifier: "SliderGameVC") as? SliderGameVC else {return }
            gameVC.playerNumber = playerNumber
            self.present(gameVC, animated: true,completion: nil)
        }
    }

}
