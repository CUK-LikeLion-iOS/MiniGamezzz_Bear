
import UIKit

class SliderGameVC: UIViewController {
    var playerNumber = 0
    var timer: DispatchSourceTimer?
    var remainingTime: TimeInterval = 10.0
    var count : Int = 0
    func updatePointLabel ()
    {
        pointLabel.text = "\(count/5)"
    }
    @IBOutlet weak var timeBar: UIProgressView!
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        if count == 0
        {
            startTimer()
        }
        count += 1
        updatePointLabel()
    }
    @IBOutlet weak var pointLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTimeBar()
     
        
    }
    func updateTimeBar() {
        let progress = Float(remainingTime / 10.0)
        timeBar.setProgress(progress, animated: true)
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
            let alert = UIAlertController(title: "알림", message: "player의 점수는 \(self.count/5) 점입니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default) { _ in
                self.count = 0
                self.updatePointLabel()
                self.remainingTime = 10.0
                self.updateTimeBar()
               // self.startTimer()
            })
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
