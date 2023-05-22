import UIKit

class TapTapGameVC: UIViewController {
    var playerNumber = 0
    var count: Int = 0
    //var isButtonEnabled: Bool = false
    var timer: DispatchSourceTimer?
    var remainingTime: TimeInterval = 10.0
    
    @IBOutlet weak var timeBar: UIProgressView!
    @IBOutlet weak var point: UILabel!
    @IBOutlet weak var uiButton: UIButton!
    
    @IBAction func TapButton(_ sender: Any) {
        if count == 0 {
            startTimer()
        }
        count += 1
        updateCount()
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
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "알림", message: "player의 점수는 \(self.count) 점입니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default) { _ in
                self.count = 0
                self.updateCount()
                self.remainingTime = 10.0
                self.updateTimeBar()
               // self.startTimer()
            })
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTimeBar()
        //startTimer()
    }
    
    func updateCount() {
        point.text = "\(count)"
    }
    
    func updateTimeBar() {
        let progress = Float(remainingTime / 10.0)
        timeBar.setProgress(progress, animated: true)
    }
    
}
