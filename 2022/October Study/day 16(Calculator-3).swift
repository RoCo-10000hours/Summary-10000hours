//  ViewController.swift
//  10.16 복습(계산기)
//
//  Created by Ro-Co on 2022/10/16.
//

// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//코드하기전 머릿속으로 계획하고있는 로직을 한번 읊어보는시간
//( ~~~~~~((키보드 손대기전 머릿속 생각을 글로쓸 부분(@@미완@@)) )
//(이부분들만 따로 또모아서 레시피로 보관해도될듯, 머릿속 로직들을, 하나하나수집하자)
//다 로직전개를 끝마친 후 이젠 코딩 시작 (코딩을 해가면서도 계속 머릿속의 필요한 로직 부분부분등을 수정및 추가 삭제)
//코딩을 막 배우기 시작한 지금부터 습관을 잡아놓자. 귀찮고 번거롭고 코딩시작시간이 오래시 걸리더라도
// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//복습한부분 (맨아래부분은 강사님의 필기를 노트한 부분과 강사님의 코드레시피들)
// 기타 레시피는 : Desktop > 멋사실습(x-code) >2022년 > 10 >10.15 >red tag (총정리 게산기)
// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

import UIKit
import AVFoundation

    //class 밖에서 정의할 내용들

enum CalcOperation {            //operation: 직영하면 작용;
    case plus
    case minus
    case multiply
    case divide
}


struct Calculator {
    //계산하기전 밖에서 정의할 내용
    var firstNumber: Int = 0            //textField의 손아귀에서 벗어낫기에 자유롭게 가능
    var secondNumber: Int = 0
    var operation: CalcOperation = .plus
    
    //계산관련 프로퍼티 내용
    var result: Int {
        get {
            switch operation {
            case .plus:
                return firstNumber + secondNumber
            case .minus:
                return firstNumber - secondNumber
            case .multiply:
                return firstNumber * secondNumber
            case .divide:
                //return firstNumber / secondNumber //근데 이렇게하면 0으로 나눴을떄 아까처럼 문제발생 그러므로
                if secondNumber == 0 {
                    return 0            //0인 이유? 원래는 error뜨니깐 그냥 강제로 값나오게 해준거
                } else {
                    return firstNumber / secondNumber
                }
                
            }
        }
    }
        
    var resultString: String {
        get {
            switch operation {
            case .plus:
                return "\(firstNumber) + \(secondNumber) = \(result)"
            case .minus:
                return "\(firstNumber) - \(secondNumber) = \(result)"
            case .multiply:
                return "\(firstNumber) * \(secondNumber) = \(result)"
            case .divide:
                return "\(firstNumber) / \(secondNumber) = \(result)"
            }
        }
    }
    
    var speechString: String {              ///사실 은/는 하기 귀찮아서 다이렇게한거기에 굳이 스위치 안써도 상관은 없다. 그냥 연습삼아서 해본것
        get {                                   //스위치문같은게 아니라면 굳이 밖으로 뺼일없이 아래쪽 숫자정의(allnumbers)한 부분아래넣어도되지않나?
            switch operation {
            case .plus:
                return "결과는 \(result)입니다"
            case .minus:
                return "결과는 \(result)입니다"
            case .multiply:
                return "결과는 \(result)입니다"
            case .divide:
                return "결과는 \(result)입니다"
                
            }
        }
    }
        
        
        //init을 하는 이유는???-->
    //struct 는 constructor(생성자)인데 얘는 반환형이 없기에 명령마지막에 초기화를 시켜줘야함(?)
        init(first: Int, second: Int, operation: CalcOperation) {
            //이렇게 좌우 자리 바꾸는건 안됨 ---> first = self.firstNumber
            //struct구문 만들당시 정의 했떤 바로 그 firstNumber임
            self.firstNumber = first
            self.secondNumber = second
            self.operation = operation
        }
        
    }
    
    
    
    
    class ViewController: UIViewController {
        let synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer() //avspeech~ 이걸 공식문서보니 class~
        //이 형태로 사용하라기에 그대로아래내려가서 적용함
        @IBOutlet weak var firstTextField: UITextField!
        @IBOutlet weak var secondTextField: UITextField!
        
        @IBOutlet weak var myLabel: UILabel!
        
        
        //튜플을 이용하여 숫자입력반복부위 줄여보자... 이부분은 구조체를 이용하는게아니기에 클래스내에서 선언가능
        func allNumbers() -> (Int, Int) {
            let firstText: String = firstTextField.text ?? ""
            let firstNumber: Int = Int(firstText) ?? 0
            let secondText: String = secondTextField.text ?? ""
            let secondNumber: Int = Int(secondText) ?? 0
            
            return(firstNumber, secondNumber)
        }
        
        func speechResult(speechText: String) {     //---------->아래의 1) + 2)를함수로 만든 음성부분....
            let utterance : AVSpeechUtterance = AVSpeechUtterance(string: speechText)
            synthesizer.speak(utterance)
        //    let speechText: String = "결과는 \(Calculator.result)입니다"error뜬다..왜냐고 Calculator의 메서드를쓰려면 우선
                //아래내려가면있는것처럼 ---> let calculator = Calculator(first: allNumbers().0, second: allNumbers().1, operation: .plus)
            //이런식으로 초기화해줘야하기떄문에.. 그리고그빡에도 많은것뜰을 초기화해야한다
        }               //원래 강시님경우엔.. 말을하는 액션자체는 같기에 묶었지만.. 대사는 사칙연사 전부 다르게하셨기에 요기위에 2개만 묶고
                        //대사는 위에서 스위치 문으로하심.. 근데 만약 대사를 같은걸로 한다면..? 여기에 넣어도 될듯
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // 여기는 화면이 띄워지는 동안 수행되는 액션들
        }
        
        
        @IBAction func pressPlussButton(_ sender: Any) {
            //        let firstText: String = firstTextField.text ?? ""  //if let을 쓰면 줄이길어짐
            //        let firstNumber: Int = Int(firstText) ?? 0         //firstFiled값을 강제로integer화 시켜주기 위함
            //        let secondText: String = secondTextField.text ?? ""
            //        let secondNumber: Int = Int(secondText) ?? 0
//            let firstNumber = allNumbers().0
//            let secondNumber = allNumbers().1
//------------> 함수로까지 만든어 줄인걸 없앤이유는?? firstNumber변수를 직접 쓸일이 없어서 왜냐하면
//              let calculator ~ 이부분이 선언되기 전까지는 그 아래에서 first+seocnd를 쓰면 줄어들기에 필요했찌만
//            선언된 이후엔 calculator가 필요가없어짐함수 allNumbers() 이걸로  간편히 불러올 수 있기 떄문에
            
            //@@@@@
            //숫자중복 줄였고, 그다음에 중복되는것들을 순서대로생각해보면
            //(숫자),  계산... 결과출력문, 결과 출력....음성출력문,음성출력
            
            //let resultNumber: Int = firstNumber + secondNumber
            let calculator = Calculator(first: allNumbers().0, second: allNumbers().1, operation: .plus)
            //위의 코드가 성ㄹ힙하게 하기위해서 위위위위에의   let ~ let ~firstnumber secondnumber를 지워야함..?그런이류로 지운게아니라
            //어차피 구조체 내에서 fistNumber,secondNumber를 이미 정의해놔서 다시 안써도됨???
            //let resusltText = "\(firstNumber) + \(secondNumber) = \(resultNumber)"  //결과값의 타입은---> string-> ""
// ----------> let resusltText = "\(firstNumber) + \(secondNumber) = \(calculator)"
            // let resultText = "\(allNumbers().0) + \(allNumbers().1) = \(calculator.result)"
            //<-----calculator.result..result를 이상황에선 썻어야한다..왜냐하면 아직 츌룍부분 함수로안 만들었떤 상황이라서...이걸로 1시간 30분을 고민했네..

// ----------> myLabel.text = Calculator.resultString  //@@ 이런식으로 Calculator를 직접 쓸수없음 쓰면 에러나옴 매서드가 없다고..
            // 그래서 calculector로 바로 직전 위에서 코드초기화시켜서 요기아래에서 쓴거임..
            myLabel.text = calculator.resultString
            //여기까지 2줄로 줄였으면.... 그다음 음성부분...
            
//            func speechResult(speechText: String) {     //---------->아래의 1) + 2)를함수로 만든 음성부분....이건 공통적용이기에 맨위(숫자정의한부분아래)로올림
//                let utterance : AVSpeechUtterance = AVSpeechUtterance(string: speechText)
//                synthesizer.speak(utterance)
//            }
            
//            let resultSpeech = "답은 \(calculator) 입니다"   //그리고 이부분도 밖으로뺏기에 없앰
            speechResult(speechText: calculator.speechString)
            
// ---------->let utterance: AVSpeechUtterance = AVSpeechUtterance(string: resultSpeech)----------> 1)
            //resultspeech가 신디사이저speak메서드의 요소로 사용가느하게끔 텍스트를 음성신호로 바꿔주는건가??
            //그리고 아래줄코딩이 그렇게 받은 음성신호를 사운드로 출력하게 해주는 synthesizer라는 기능을 선언해주는거고
            //       let synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()             맨위로 뺐음
//----------> synthesizer.speak(utterance)  ---------->2)
            
        }
        
        
        @IBAction func pressMinusButton(_ sender: Any) {
            //        let firstText: String = firstTextField.text ?? ""
            //        let firstNumber: Int = Int(firstText) ?? 0
            //        let secondText: String = secondTextField.text ?? ""
            //        let secondNumber: Int = Int(secondText) ?? 0
//            let firstNumber = allNumbers().0
//            let secondNumber = allNumbers().1
//
//            let resultNumber: Int = firstNumber - secondNumber
//
//            let resultText = "\(firstNumber) - \(secondNumber) = \(resultNumber)"
//
//            myLabel.text = resultText
            let calculator = Calculator(first: allNumbers().0, second: allNumbers().1, operation: .minus)
            myLabel.text = calculator.resultString
            
//            let resultSpeech = "답은 \(resultNumber) 입니다"
//            let utterance: AVSpeechUtterance = AVSpeechUtterance(string: resultSpeech)
//
//            synthesizer.speak(utterance)
            speechResult(speechText: calculator.speechString)
            
        }
        
        
        
        @IBAction func pressMultiplyButton(_ sender: Any) {
            //        let firstText: String = firstTextField.text ?? ""
            //        let firstNumber: Int = Int(firstText) ?? 0
            //        let secondText: String = secondTextField.text ?? ""
            //        let secondNumber: Int = Int(secondText) ?? 0
//            let firstNumber = allNumbers().0
//            let secondNumber = allNumbers().1
//
//            let resultNumber: Int = firstNumber * secondNumber
//
//            let resultText = "\(firstNumber) * \(secondNumber) = \(resultNumber)"
//
//            myLabel.text = resultText
            let calculator = Calculator(first: allNumbers().0, second: allNumbers().1, operation: .multiply)
            myLabel.text = calculator.resultString
//
//            let resultSpeech = "답은 \(resultNumber) 입니다"
//            let utterance: AVSpeechUtterance = AVSpeechUtterance(string: resultSpeech)
//
//            synthesizer.speak(utterance)
            speechResult(speechText: calculator.speechString)
        }
        
        
        @IBAction func pressDivideButton(_ sender: Any) {
            //        let firstText: String = firstTextField.text ?? ""
            //        let firstNumber: Int = Int(firstText) ?? 0
            //        let secondText: String = secondTextField.text ?? ""
            //        let secondNumber: Int = Int(secondText) ?? 0
//   let firstNumber = allNumbers().0
//   let secondNumber = allNumbers().1
            
            //let resultNumber: Int = firstNumber / secondNumber
            //그런데 쌩으로 위의방식(+,-,*)대로 코드입력하면 0나누기0에서 error떳음
            //그래서 선택한 방법...아예 0을 나누지않을 상황을 만들기...즉, 0/0계산요청하면 빠꾸쳐버리기
            //0나누기 1,2,3 등은 무사히 되기에 두번째숫자에서 0을 선택할경우로 if구문사용
 //  if secondNumber == 0 {
                // print("0으로 나눌 수 없습니다") 이렇게나오려면 라벨부분을 수정하면된다
                //어떻게?? 제일처음 firstTexFiedl란 인스턴스에 text라는 메서드를 사용한 것처럼
//      myLabel.text = "error: 0으로는 나눌 수 없습니다"
//   } else {
// let resultNumber: Int = firstNumber / secondNumber      //이걸내린이유는 0/0하는순간 바로 if절에 도달하기도전에 error가 뜨기때문에...
// let resultText = "\(firstNumber) / \(secondNumber) = \(resultNumber)"
//  myLabel.text = resultText
//  let resultSpeech = "답은 \(resultNumber) 입니다"
// let utterance: AVSpeechUtterance = AVSpeechUtterance(string: resultSpeech)
//
//   synthesizer.speak(utterance)            //음성출력전체부분을 if절 밖으로배면 resultNumber 상수가 적용 X.
//   }
            let calculator = Calculator(first: allNumbers().0, second: allNumbers().1, operation: .divide)
            myLabel.text = calculator.resultString
            
            speechResult(speechText: calculator.speechString)
        }
        
        
     }



// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
///// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
// 여기까지가 토요일에 있었던 보충스터디의 1~29번까지의 과정중 20번까지이다.
// 이제남은것들은
// 1. 위의 것들을 좀더 자유롭게 머릿속에서 꺼내쓰기위한 반복 코딩 == '체화과정'
// 2.  calculation, calculationOperaion(ENUM부분) 전부 빼서  '구조화'
// 3. 메서드 몇개 더 넣어보기  ex)제곱등등
//      일단은 위에것들이 익숙해지면 이나머지것들도 차근차근 도전하자
