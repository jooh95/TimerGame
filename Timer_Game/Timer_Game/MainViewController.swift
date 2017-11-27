import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var StartButtonOutlet: UIButton!
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var NumberLabel: UILabel!
    @IBOutlet weak var Score: UILabel!
    
    var timer:Timer = Timer()
    var timerCount = 30
    var timerRunning = false
    var number:Int = 0
    var correct:Int = 0
    
    func initing(){
        timerCount = 30
        Score.text! = "정답 수: 0"
        NumberLabel.text = "\(number)"
        TimerLabel.text = "\(timerCount)"
        correct = 0
    }
    
    @objc
    func counting(){
        number = Int(arc4random()) % 1000
        timerCount -= 1
        TimerLabel.text = "\(timerCount)"
        
        if(timerCount == 0){
            timer.invalidate()
            StartButtonOutlet.isHidden = false
            timerRunning = false
            
            let alertController = UIAlertController(title: "게임종료", message: "\(correct)개를 맞추셨습니다.", preferredStyle:.alert)
            let doneAction = UIAlertAction(title:"확인", style:.default, handler:
            {
                (UIAlertAction) in
                print("확인")
            })
            alertController.addAction(doneAction)
            
            self.present(alertController, animated: true)
            
        }
    }
    
    @IBAction func EvenButton(_ sender: Any) {
        NumberLabel.text = "\(number)"
        
        if(number % 2 == 0){
            correct += 1
            Score.text = "정답 수: \(correct)"
        }
    }
    
    @IBAction func OddButton(_ sender: Any) {
        NumberLabel.text = "\(number)"
        
        if(number % 2 == 1){
            correct += 1
            Score.text = "정답 수: \(correct)"
        }
    }
    
    @IBAction func StartButton(_ sender: Any) {
        initing()
        StartButtonOutlet.isHidden = true
        
        if timerRunning == false{
            timer = Timer.scheduledTimer(timeInterval: 1, target:self,selector:Selector("counting"), userInfo:nil,repeats:true)
            
            timerRunning = true
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initing()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
