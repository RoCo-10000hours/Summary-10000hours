
//
//  ViewController.swift

//  10.15.(보충스터디 UIkit)
//
//  Created by Ro-Co on 2022/10/15.
//


//주말 토~일 을 이용한 계산기앱 재복습 


// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//코드하기전 머릿속으로 계획하고있는 로직을 한번 읊어보는시간
//( ~~~~~~ ) (이부분들만 따로 또모아서 레시피로 보관해도될듯, 머릿속 로직들을, 하나하나수집하자)
//다 로직전개를 끝마친 후 이젠 코딩 시작 (코딩을 해가면서도 계속 머릿속의 필요한 로직 부분부분등을 수정및 추가 삭제)
//코딩을 막 배우기 시작한 지금부터 습관을 잡아놓자. 귀찮고 번거롭고 코딩시작시간이 오래시 걸리더라도...
// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//복습한부분 (맨아래부분은 강사님의 필기를 노트한 부분과 강사님의 코드레시피들)
// 기타 레시피는 : Desktop > 멋사실습(x-code) >2022년 > 10 >10.15 >red tag (총정리 게산기)
// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    @IBOutlet weak var myLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 여기는 화면이 띄워지는 동안 수행되는 액션들
    }

    @IBAction func pressPlussButton(_ sender: Any) {
        let firstText: String = firstTextField.text ?? ""  //if let을 쓰면 줄이길어짐
        let firstNumber: Int = Int(firstText) ?? 0         //firstFiled값을 integer화 시켜주기 위함
        let secondText: String = secondTextField.text ?? ""
        
        let secondNumber: Int = Int(secondText) ?? 0
        
        let resultNumber: Int = firstNumber + secondNumber
        let resusltText = "\(firstNumber) + \(secondNumber) = \(resultNumber)"  //결과값의 타입은---> string->
                                                                                //왜?---> " "
        myLabel.text =  resusltText
        
        
    }
    
    @IBAction func pressMinusButton(_ sender: Any) {
        let firstText: String = firstTextField.text ?? ""
        let firstNumber: Int = Int(firstText) ?? 0
        let secondText: String = secondTextField.text ?? ""
        let secondNumber: Int = Int(secondText) ?? 0
        
        let resultNumber: Int = firstNumber - secondNumber
        
        let resultText = "\(firstNumber) - \(secondNumber) = \(resultNumber)"
        
        myLabel.text = resultText
        
    }
    
    
    
    @IBAction func pressMultiplyButton(_ sender: Any) {
        let firstText: String = firstTextField.text ?? ""
        let firstNumber: Int = Int(firstText) ?? 0
        let secondText: String = secondTextField.text ?? ""
        let secondNumber: Int = Int(secondText) ?? 0
        
        let resultNumber: Int = firstNumber * secondNumber
        
        let resultText = "\(firstNumber) * \(secondNumber) = \(resultNumber)"
        
        myLabel.text = resultText
    }
    
    
    @IBAction func pressDivideButton(_ sender: Any) {
        let firstText: String = firstTextField.text ?? ""
        let firstNumber: Int = Int(firstText) ?? 0
        let secondText: String = secondTextField.text ?? ""
        let secondNumber: Int = Int(secondText) ?? 0
        
         //let resultNumber: Int = firstNumber / secondNumber
        //그런데 쌩으로 위의방식(+,-,*)대로 코드입력하면 0나누기0에서 error떳음
        //그래서 선택한 방법...아예 0을 나누지않을 상황을 만들기...즉, 0/0계산요청하면 빠꾸쳐버리기
        //0나누기 1,2,3 등은 무사히 되기에 두번째숫자에서 0을 선택할경우로 if구문사용
        if secondNumber == 0 {
            // print("0으로 나눌 수 없습니다") 이렇게나오려면 라벨부분을 수정하면된다
            //어떻게?? 제일처음 firstTexFiedl란 인스턴스에 text라는 메서드를 사용한 것처럼
            myLabel.text = "0으로 나눌 수 없습니다"
        } else {
            let resultNumber: Int = firstNumber / secondNumber      //이걸내린이유는 0/0하는순간 바로 if절에 도달하기도전에 error가 뜨기때문에...
            let resultText = "\(firstNumber) / \(secondNumber) = \(resultNumber)"
            myLabel.text = resultText
        }
    }
    
}

//여기까지가 일단 +,-,*,/기를 가장 현재 나의 수준에 맞게 하드코딩해 나가본 과정
//내일 해야할 부분은 
//1) 반복되는 부분들 줄여나가는 시도 2) tts기능 추가하기
//3) 제곱이나 나머지구하기 등의 또다른 연산기호추가 
//4) 구조화 (시키기)
//5) 숫자버튼활성화, . 버튼 추가

//6) 취소키, 백스페이스키 추가 , 결과호출(=)키 추가
//7) 다항연산
// 일단 내일가능한부분은 4~5번까지는 해내보는걸로 목표로삼자

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


//  ViewController.swift
//  10.15.(보충스터디storyboard(2))
//
//  Created by 앙겔로스 on 2022/10/15.
//

//IB = INTERFACE BUILDER의 약어
//1.진행한순서들((스샷들 참고))
//2.버튼들 배치하고(라벨은 결과표시창)
//3.핸폰내에 자판올라오게하기
//4.자판내에 숫자만 올라오게하기
//5.컨트롤눌러서 연결시는데 이름지을떈 그아래에바로나오는 type이름을참고
//6.한번 제대로되나 확인
//7. 왜 ?? "0" 사용한거지? 스샷부터 일단 확인 해당 것들을 줄이려고 나온게 이거임
//8.그후에 버튼 4개 과정 시작

///추가설명(7번) . (스샷들도 참고)
///firstText field /// let firsttext: stirng = firsttext field.text 쓰니간 아예 옵셔널이필요하다고
///경고가뜸... 그러면 if let if let 이렇게 해서 내려가야하는데.. 누군가 만들어냄 ?? "0" 이런 방식을
///즉,    firstFtield.text는 string?의 옵셔널 타입((왜옵셔널인지 아닌지는 걍 애플이 아예 만들어놓음)이므로 그냥 꺼내올수가 없다
///그래서 그대로 fristText에 복제할당하고
///nil이라서 실패혀면 ?? 뒤의 "0"을 복제당한다
//////이부분을 설명하시면서  아래 내려가면 UITextField! 이부분을 쭉끌고 우클릭하여 개발자 문서 들어가서 쭉아래내려가면
///// 걍 애플이 얘는 옵셔널타입이라고 대놓고 박아논걸 볼 수 있음

//9. 나눗셈부분 추가수정 , 0으로 나누면?
//if else를 이용했음
//10. 줄여나가보기  튜플함수 선언

/*func getNumbers() -> (Int, Int) {
let firstText: String = firstTextField.text ?? "0"
let firstNumber: Int = Int(firstText) ?? 0
let secondText: String = secondTextField.text ?? "0"
let secondNumber: Int = Int(secondText) ?? 0
 
return (firstNumber, secondNumber)
} */

//let firstNumber: Int = Int(firstText) ?? 0
// ---->firstNumber = getNumbers().0
//let secondNumber: Int = Int(secondText) ?? 0
// ---->firstNumber = getNumbers().1
//이걸로 다줄임
//11. 그다음과정 놓침
//12. 음성관련 코드 시작
/////((아, 참고로 왼쪽 파일들목록에서 viewcontroller인 swift확장자 파일을
/////그대로 쭉끌어대가 디코에보내면 긴 장문의 코드라도 보낼수있다. 안그러면 2번에 나눠서보내야함)

//13. 순수하게 INTERface builder의 항목들과 직접 연결되는 일만처리하도록 전부 분리함
//즉, 사칙연산같으 부분들만 남긴다..(왜?? 나중에 재활용(?ㅋㅋ)하기 위함)또 작업안하게.

//14. 이러시면서 임폴트아랫부분에 스트럭트(클래?스?)만들어 나가심
//여기부터 2차 수정들어갔으니 원본은 노션참고
//15. 쭉 써내려가시다가 그 위에 enum case casee 하셨음
//16. init을 해준 이유? 나중에 한번에 하기 위해그러다가 그 아래 self.firstNumber=first
//왜 ? 위에랑 이름 중복되서
//17. 그후에 플러스 버튼안에 let calculator = calculator(first~~_
//    let resultNumber: int 이부분 위아래 2줄 입력하고 그아래 resultlabel.TEXT이부분도 바꿧고
//그러니간 방금했던 2번째 줄 필요없다 생각하고 그냥 지우심. 그리고

//18.다시 < 구조체로 올라가 계산/ 연산 프로퍼티 만들어줌.>/// set 없이 get만 쓰셨고(왜??)
// 계산연산/ 화면상에 출력되는 결과 / 음성 이 3개만듬
//19. 그후에 스위치문 추가함 . 왜?.. 여튼 프러스 관련해서 리턴과 default리턴까지 하셨음.
//그 후에 아래 결과 스셨음. 여기까지 하고 스샷찍었으니 확인 바람 17:21분

//20.음성부분을 좀 심플하게하기위해 func speechResult( : ) { let } 이거로하고 이에대한 프로퍼티를 사칙연산버튼들에 넣고
//기존의 음성관련 길었떤 부분은 지움

//21.그러면 이제부턴 다시 같은 방시들로 -,*,/만들어나가는데 주의할점 몇가지있음
//나눗셈같은경우 if추가해서
//이렇게 switch문에 쭉 사칙연산 다하니깐... 엑스코드가 똑똑하게 default값 없어도 되겠는데하고 제안함 .. 그래서
//강사님도 그거그대로 눌러서 적용fix 하심
//22.출력결과 부분과 음성부분도 바꾸고 .. 아래내려가서도 마찬가지로 다 수정함
// 노션 2번째 recipe가 여기까지임

//23. calculation부분을 빼주기 ((구.조.화))
//file - new file - swift파일 선택해서 calculator(struct ~ 마지막선언 부분). calcOperation(enum 부분)다빼버림

//24.추가로 메서드 하나 더 추가한다면
//제곱(기호로는 ^ 로표시하고 계산도 이거임)을 또 넣고싶으면? Calcoperation부분에 넣고 calculator가서 여기도 넣고 ..
//그후엔 디자인에 제곱 넣고


//25.결국 뷰컨트롤에 나아래쪽 버튼 액션부엔(3줄남음)
/* @IBAction func pressPlusButton(_ sender: Any) {
 let calculator = Calculator(first: getNumbers().0, second: getNumbers().1, operation: .plus)
 resultLabel.text = calculator.resultString
 speechResult(speechText: calculator.speechString)
}       */

//26.이 세줄을 더 줄이고싶다??
//위에 함수에 넣었음 음성쪽 보면 쉽게 너(박상호)가 찾을거임
//2줄로 줄이셨음 show result(calc: )
////////여기까지가 노션 3번째 recipe와 구조체들

//27. 버튼을 하고싶다면? 이것도 구조화가능

//이렇게하면 버튼 눌렀을때  calculator 하나랑 출력 하나만 남음. 이걸 의도하셨던 실습이라고하심.구조분리하여

///28. 추가학습  그러면 나머지(remain)는???
///
//29. 문제점 발견 !! ^이표시가 제곱이 아니었음
//그래서 수작업시작 for in 으로 마지막 수정
/////레시피 4






import UIKit
import AVFoundation

class ViewController: UIViewController {
  let synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()
        
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //여기는 화면이 띄워질 떄 해야할 일들을 적는곳!
        
    }

    @IBAction func pressPlusButton(_ sender: Any) {
      //  let firstNumber: Int = Int(firstTextField.text)
        //이 숫자를 우리가 강제로 Inteager로 바꿔주기 위함
        //사실 이 값이 있을수도 없을수도있음 . 왜? 입력안하니깐.. 그러니 전부 이건 사실 옵셔널..
        //2가지 방법이 있따. if let let 2번 거치는 방법과
        //쌍물음표를 써서 옵셔널 바인딩을 건너 뛴 쉬운방법
        //그래서 결국 이렇게함
        let firstText: String = firstTextField.text ?? "0"
        let firstNumber: Int = Int(firstText) ?? 0
        let secondText: String = secondTextField.text ?? "0"
        let secondNumber: Int = Int(secondText) ?? 0
        
        let resultNumber: Int = firstNumber + secondNumber
        
        //print("\(firstNumber) + \(secondNumber) = \(resultNumber)")
        let resultText = "\(firstNumber) + \(secondNumber) = \(resultNumber)"
        
        resultLabel.text = resultText
        
        
        // 음성합성기를 이용해서 결과를 읽어보자!
        
              let speechText = "\(firstNumber) 더하기 \(secondNumber)는 \(resultNumber)입니다."
              let utterance: AVSpeechUtterance = AVSpeechUtterance(string: speechText)
              synthesizer.speak(utterance)
   }
    

    
    @IBAction func pressSubstractButton(_ sender: Any) {
        let firstText: String = firstTextField.text ?? "0"
        let firstNumber: Int = Int(firstText) ?? 0
        let secondText: String = secondTextField.text ?? "0"
        let secondNumber: Int = Int(secondText) ?? 0
        
        let resultNumber: Int = firstNumber - secondNumber
        
        let resultText = "\(firstNumber) - \(secondNumber) = \(resultNumber)"
        
        resultLabel.text = resultText
    }
    
    
    
    @IBAction func pressMultiplyButton(_ sender: Any) {
        let firstText: String = firstTextField.text ?? "0"
        let firstNumber: Int = Int(firstText) ?? 0
        let secondText: String = secondTextField.text ?? "0"
        let secondNumber: Int = Int(secondText) ?? 0
        
        let resultNumber: Int = firstNumber * secondNumber
        
        let resultText = "\(firstNumber) * \(secondNumber) = \(resultNumber)"
        
        resultLabel.text = resultText
    }
    
    
    //이부분 강사님 double이아닌 int로하심?????????
    @IBAction func pressDivideButton(_ sender: Any) {
        let firstText: String = firstTextField.text ?? "0"
        let firstNumber: Int = Int(firstText) ?? 0
        let secondText: String = secondTextField.text ?? "0"
        let secondNumber: Int = Int(secondText) ?? 0
        
        //0으로 나눌상황을 아예 안만들게 해주기
        if secondNumber == 0 {
            resultLabel.text = "0으로 나눌 수 없습니다."
        }   else {
                let resultNumber: Double = Double(firstNumber / secondNumber)
                
                let resultText = "\(firstNumber) / \(secondNumber) = \(resultNumber)"
            
            resultLabel.text = resultText
            }
        }
        
    }



//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

