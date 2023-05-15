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
        
        /*
        let gameSB = UIStoryboard(name: self.gameID, bundle: Bundle.main)
        
        guard let gameVC = gameSB.instantiateViewController(withIdentifier: self.gameID) as? GameVC else { return }
        gameVC.playerNumber = playerNumber
        
        self.present(gameVC, animated: true)
         */
    }

}
