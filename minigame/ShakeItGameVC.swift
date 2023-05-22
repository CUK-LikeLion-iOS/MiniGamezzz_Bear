//
//  ShakeItGameVC.swift
//  minigame
//
//  Created by Demian on 2023/05/21.
//

import UIKit
import Lottie

class ShakeItGameVC: UIViewController {
    var score: UInt16 = 0 {
        didSet {    // 점수와 레이블의 텍스트를 동기화
            scoreLabel.text = String(score)
            if (score < 10) {
                scoreLabel.textColor = .systemBlue
            }
            else if (score < 30) {
                scoreLabel.textColor = .systemCyan
            }
            else if (score < 50) {
                scoreLabel.textColor = .systemGreen
            }
            else {
                scoreLabel.textColor = .systemPink
            }
        }
        willSet {   // 처음 흔들면 타이머 시작
            if (newValue == 1) {
                startTimer()
                messageLabel.text = "빠르게 흔드세요!"
            }
        }
    }
    var playerNumber = 0    // 총 인원수
    var playerCounter = 1   // 현재 플레이어 번호
    var timer: DispatchSourceTimer?
    var remainingTime: TimeInterval = 10.0
    
    @IBOutlet weak var phoneShakingAnimation: LottieAnimationView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let height: CGFloat = 10.0
        timeBar.transform = CGAffineTransform(scaleX: 1.0, y: height / timeBar.frame.size.height)
        
        phoneShakingAnimation.contentMode = .scaleAspectFit
        phoneShakingAnimation.loopMode = .loop
        phoneShakingAnimation.animationSpeed = 0.5
        
        phoneShakingAnimation.play()
    }
    
    func startTimer() {
        timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        timer?.schedule(deadline: .now(), repeating: .milliseconds(100))
        
        timer?.setEventHandler { [weak self] in
            guard let self = self else { return }
            self.remainingTime -= 0.1
            DispatchQueue.main.async {
                self.updateTimeBar()
                if self.remainingTime <= 0 {
                    self.timer?.cancel()
                    self.timerExpired()
                }
            }
        }
        timer?.resume()
    }
    
    func timerExpired() {
        phoneShakingAnimation.stop()
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "알림", message: "\(self.playerCounter)번 플레이어의 점수는 \(self.score) 점입니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default) { _ in
                self.score = 0
                self.remainingTime = 10.0
                self.updateTimeBar()
                // self.startTimer()
                self.resetGame()
            })
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            score += 1
            print("Score: \(score)")
        }
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            score += 1
            print("Score: \(score)")
        }
    }
    
    override func motionCancelled(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        score += 1
    }
    
    
    func updateTimeBar() {
        let progress = Float(remainingTime / 10.0)
        timeBar.setProgress(progress, animated: true)
    }

    func resetGame() {
        guard (playerCounter < playerNumber) else {
            self.dismiss(animated: true)    // 게임 종료
            return
        }
        playerCounter += 1
        messageLabel.text = "흔들면 시작합니다!"
        phoneShakingAnimation.play()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
