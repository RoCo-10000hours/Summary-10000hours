import Foundation


//당일 10.13~14(목,금) 복습 

//--------------------------------------------------------------
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
        4주차 (목~금요일)
                   나만의 계산기 만들기  
                                        
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//--------------------------------------------------------------

//제곱계산기 fist try

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()

    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pressCalcButton(_ sender: Any) {
        let myString: String = myTextField.text ?? ""
        let myNumber: Int = Int(myString) ?? 0
        let myResultNumber = myNumber * myNumber
        print("\(myResultNumber)")
        
        myLabel.text = "결과 \(myResultNumber)"
        
        
        let myResultString = "\(myNumber)를 제곱한 값은 \(myResultNumber)입니다"
        let utterance: AVSpeechUtterance = AVSpeechUtterance(string: myResultString)
        synthesizer.speak(utterance)
    
        
    }
   
}
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

//사칙연산계산기 fist try

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var myTextField1: UITextField!
    @IBOutlet weak var myTextField2: UITextField!
    @IBOutlet weak var myLabel1: UILabel!
    let synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    

    @IBAction func plusButton(_ sender: Any) {
        let someString1: String = myTextField1.text ?? ""
        let inputNumber1: Int = Int(someString1) ?? 0
        let someString2: String = myTextField2.text ?? ""
        let inputNumber2: Int = Int(someString2) ?? 0
        
        let resultNumber: Int = inputNumber1 + inputNumber2
        print("\(resultNumber)")
        myLabel1.text = "결과는 \(resultNumber)"
        
        let resultSpeech = "결과는 \(resultNumber)입니다"
        let utterance: AVSpeechUtterance = AVSpeechUtterance(string: resultSpeech)
        synthesizer.speak(utterance)
    }
    
    
    
    
    @IBAction func minusButton(_ sender: Any) {
        let someString1: String = myTextField1.text ?? ""
        let inputNumber1: Int = Int(someString1) ?? 0
        let someString2: String = myTextField2.text ?? ""
        let inputNumber2: Int = Int(someString2) ?? 0
        
        let resultNumber: Int = inputNumber1 - inputNumber2
        print("\(resultNumber)")
        myLabel1.text = "결과는 \(resultNumber)입니다"
        
        let resultSpeech = "결과는 \(resultNumber)입니다"
        let utterance: AVSpeechUtterance = AVSpeechUtterance(string: resultSpeech)
        synthesizer.speak(utterance)
    }
    
    
    
    
    @IBAction func mutiplyButton(_ sender: Any) {
        let someString1: String = myTextField1.text ?? ""
        let inputNumber1: Int = Int(someString1) ?? 0
        let someString2: String = myTextField2.text ?? ""
        let inputNumber2: Int = Int(someString2) ?? 0
        
        let resultNumber: Int = inputNumber1 * inputNumber2
        print("\(resultNumber)")
        myLabel1.text = "결과는 \(resultNumber)입니다"
        
        let resultSpeech = "결과는 \(resultNumber)입니다"
        let utterance: AVSpeechUtterance = AVSpeechUtterance(string: resultSpeech)
        synthesizer.speak(utterance)
    }
    
    
    
    
    @IBAction func divideButton(_ sender: Any) {
        let someString1: String = myTextField1.text ?? ""
        let inputNumber1: Double = Double(someString1) ?? 0
        let someString2: String = myTextField2.text ?? ""
        let inputNumber2: Double = Double(someString2) ?? 0
        
        let resultNumber: Double = inputNumber1 / inputNumber2
        print("\(resultNumber)")
        myLabel1.text = "결과는 \(resultNumber)입니다"
        
        let resultSpeech = "결과는 \(resultNumber)입니다"
        let utterance: AVSpeechUtterance = AVSpeechUtterance(string: resultSpeech)
        synthesizer.speak(utterance)
    }
    
    
}

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


//사칙연산계산기 second try (신디사이저부부을 함수로해보기)

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var myTextField1: UITextField!
    @IBOutlet weak var myTextField2: UITextField!
    @IBOutlet weak var myLabel1: UILabel!
    let synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //일단 하드코딩으로해본과정
    //중복되는건 말하는부분이랑 textField부분
    //말하느거부터 줄여나가보자
  

    @IBAction func plusButton(_ sender: Any) {
        let someString1: String = myTextField1.text ?? ""
        let inputNumber1: Int = Int(someString1) ?? 0
        let someString2: String = myTextField2.text ?? ""
        let inputNumber2: Int = Int(someString2) ?? 0
        
        let resultNumber: Int = inputNumber1 + inputNumber2
        print("\(resultNumber)")
        myLabel1.text = "결과는 \(resultNumber)"
        
        utterSpeech(to: resultNumber)   //말하는걸 함수로줄임(*두영님코드 참고)
                                //그런데 마지막가서 나눗셈 type DOUBLE에서
        //에러가생겼음 결국 함수를 하나 더 만들었음
        //이유가뭐지? 결과값의 타입이 Any인건가?
        
//        let resultSpeech = "결과는 \(resultNumber)입니다"
//        let utterance: AVSpeechUtterance = AVSpeechUtterance(string: resultSpeech)
//        synthesizer.speak(utterance)
    }
    
    
    
    
    @IBAction func minusButton(_ sender: Any) {
        let someString1: String = myTextField1.text ?? ""
        let inputNumber1: Int = Int(someString1) ?? 0
        let someString2: String = myTextField2.text ?? ""
        let inputNumber2: Int = Int(someString2) ?? 0
        
        let resultNumber: Int = inputNumber1 - inputNumber2
        print("\(resultNumber)")
        myLabel1.text = "결과는 \(resultNumber)입니다"
        
        utterSpeech(to: resultNumber)
        
//        let resultSpeech = "결과는 \(resultNumber)입니다"
//        let utterance: AVSpeechUtterance = AVSpeechUtterance(string: resultSpeech)
//        synthesizer.speak(utterance)
    }
    
    
    
    
    @IBAction func mutiplyButton(_ sender: Any) {
        let someString1: String = myTextField1.text ?? ""
        let inputNumber1: Int = Int(someString1) ?? 0
        let someString2: String = myTextField2.text ?? ""
        let inputNumber2: Int = Int(someString2) ?? 0
        
        let resultNumber: Int = inputNumber1 * inputNumber2
        print("\(resultNumber)")
        myLabel1.text = "결과는 \(resultNumber)입니다"
        
        utterSpeech(to: resultNumber)
        
//        let resultSpeech = "결과는 \(resultNumber)입니다"
//        let utterance: AVSpeechUtterance = AVSpeechUtterance(string: resultSpeech)
//        synthesizer.speak(utterance)
    }
    
    
    
    
    @IBAction func divideButton(_ sender: Any) {
        let someString1: String = myTextField1.text ?? ""
        let inputNumber1: Double = Double(someString1) ?? 0
        let someString2: String = myTextField2.text ?? ""
        let inputNumber2: Double = Double(someString2) ?? 0
        
        let resultNumber: Double = inputNumber1 / inputNumber2
        print("\(resultNumber)")
        myLabel1.text = "결과는 \(resultNumber)입니다"
        
        utterSpeech2(to: Double(resultNumber))
        
//        let resultSpeech = "결과는 \(resultNumber)입니다"
//        let utterance: AVSpeechUtterance = AVSpeechUtterance(string: resultSpeech)
//        synthesizer.speak(utterance)
    }
    
    
    func utterSpeech(to resultNum: Int) {
        let resultSpeech = "결과는 \(resultNum)입니다"
        synthesizer.speak(AVSpeechUtterance(string: resultSpeech))
    }
    func utterSpeech2(to resultNum: Double) {
        let resultSpeech = "결과는 \(resultNum)입니다"
        synthesizer.speak(AVSpeechUtterance(string: resultSpeech))
    
}

}

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ