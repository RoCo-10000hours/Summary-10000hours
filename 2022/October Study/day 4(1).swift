import Foundation

// <<<<10.2(Sunday)>>>>(1)
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
            3주차(월-금) 강좌들 
                   복습(rewind)
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
(이번주 월,화 수업요약 및 복습).
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


func buildMessageFor(_ name:String, count:Int) -> String{    //함수의"선언"
    return "\(name),you are customer number\(count)"
    //return다음에 ()로도 가능하지만 예제에서는 없음.그래도실행가능한걸 확인했고, 그냥한칸 띄워만 주자!
}
// **return 이라고치면 뒤에 이어지는 결과들은 앞에서 가져온다는 뜻**
//print(buildMessageFor(name: "roco", count: 7))
// 만약에 return을 빼면 어떻게 될까?
//ror: MyPlayground3.playground:7:5: error: cannot convert return expression of type '()' to return type 'String'  <------- 이런 error 발생
//print(buildMessageFor(name: "ppph", count: 3))
//
//let message: String = buildMessageFor(name: "you", count: 2)
//print(message)
//**정리하면 함수의 형태는 func 이름(매개변수:타입, 매변:타입) --> 반환결과타입{ 반환되어지는결과 }. //:선언:**
let message2: String = buildMessageFor("you", count: 2)
print(message2)

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


//이번엔 _ 를 이용함.(**주의점 _ 다음에 한칸 띄워야한다)
func buildMessageFor2(username name:String, usercount count:Int) -> String{
    return "\(name),you are customer number\(count)"
}
let message3: String = buildMessageFor2(username: "PPPDISC", usercount: 231)
print(message3) //매개변수parameter의 지역매개변수명과 외부매개변수명을 이용한 모습
                //주의점은 외부매개변수명을 사용했다면 반드시 "함수 호출"을 할떄는 그걸 써줘야함
//let message4: String = buildMessageFor2(name: "rprprp", count: 245)  -->error

//함수에 디폴트 매개변수 설정하면,
func buildMessageFor4(name:String = "who", count:Int) -> String{
    return "\(name),you are customer number\(count)"
}
let message4: String = buildMessageFor4(count: 3)
print(message4)

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

//cf. 함수에 매개변수로전달된 것들은 '변수'로 착각하기 쉽지만 '상수'로 취급되어진다
//var myvalue = 10
//func doubleValue(value:inout Int) -> Int{
//    var value = value                   //그렇기에 이 상수의 값을 바꾸고싶으면 아래에var로 변수선언해야한다
//    value += value
//    return value
//}
//print("\(myvalue)")
//print("\(doubleValue(&value: 10))")
//print("\(myvalue)")

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

///아래쪽이 예시의 방법인데 왜안되는걸까요?
var myvalue = 10
func doubleValue(_ value: inout Int) -> Int{
    var value = value                   //그렇기에 이 상수의 값을 바꾸고싶으면 아래에var로 변수선언해야한다
    value += value
    return value
}
print("\(myvalue)")
print("\(doubleValue(&myvalue))")
print("\(myvalue)")
 
///
///
func orderStarbucks() -> String {
    print("스타벅스 주문")
  return "카라멜마끼야또"
}

func orderMegaCoffee() -> String {
  print("메가커피 주문")
  return "꿀아메리카노"
}


var orderCafe: () -> String = orderStarbucks
print("손님 주문하신 \(orderCafe()) 나왔습니다")
orderCafe = orderMegaCoffee
print("손님 주문하신 \(orderCafe()) 나왔습니다")

//closer표현식
let sayHello = {print("Hello")}
sayHello()
//원래는 이런식이었어야한다
func sayHello2(){
    print("hello")
}
print("\(sayHello2())")

//*객체 = 인스턴스 = house ==> 인스턴스.~ ex) expert.moveforward()라는 메서드를 붙였음.

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ



// <<<<10.1(Sat)>>>>(2)
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
(이번주 화,수 수업요약 및 복습)
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


<< 함수의 형태 >>
// func animals(name: String, number: Int) -> String{
//   `~~`
// }
/<클래스의 형태는?>
//class 새로운클래스이름: 부모클래스이름 {
   //프로퍼티/인스턴스 메서드/타입 메서드


class Bankaccount{
    var accountBalalnce: Float = 0
    var accountNumber: Int = 0
    //위의것은 뱅크클래스의 프로퍼티이고 아래는 매서드이다
    //그런데 다른것의 매서드가아님 바로 위의 잔고와숫자들의 매서드이므로
    //class. <---이것을 표시하여 코드치진 않는다
    func displayBalcne{
      print("balance is \(accountBalalnce)")
      print("number is \(accountNumber)")
      
    }
}

/그리고 이것들을 ...'클래스인스턴스 선언하기와 초기화를 원하면'   --------->
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
var account1: Bankaccount = Bankaccount()

//이렇게 나온 결과물들이 저장되는게아닌 초기화가 되어서 다시 생성되기를 원한다면?
//강사님의 표현을 빌리자면, :생성하는 시점에 해야할 초기화 작업이 있을수 있따면??
//그럴떈 classs의 매서드를 이용한다. 어떤 매서드? "init"

//14행 아래쪽에 이렇게 넣으면 된다
      init(number: Int, balance: Float){
        accountNumber=0
        accountBalalnce=0
      }

//그렇다면 순서대로 생성된 클래스(12)와 프로퍼티(13~14) 매서드(19~20)
//그리고 인스턴스(?)<--여긴좀 헷갈림 (26)
//책에선 'aaount1'이게 인스턴스라고하고
//클래스인스턴스.프로퍼티 or 클래스인스턴스.매서드()

//그리고 아예 값도 지정 가능하다고한다 var account1.accountBalance = 5.292
//**참고로 계좌입금가능한 총합설정했떤max는(ppt참고), 클래스인스턴스.매서드의
//형태가아닌, 직접클래스르라져와서  클래스.타입매서드 이형태로 호출해야한다

/<그다음 내가 헷갈린건 저장과 연산 프로퍼티인데>
//저장프로퍼티는 계좌번호,이름 같은것으로 '상수나 변수에'담기는 값이다!
//반면 연산프로퍼티는 현재잔액(수수료뺀나머지)같이 값을 설정하거나 가져오는 시점에서
//결과값이 변경되어 연산로직이 필요할떄 쓰이면 좋다
//***getter게터를 생성하고 '선택적'으로 setter메서드를 생성하며,이곳에 연상을 수행할코드가 담긴다

class Bankaccount2{
    var accountBalalnce2: Float = 0
    var accountNumbe2r: Int = 0
    let fees: Float = 25.00   //수수료를 새로 프로퍼티에 추가하면

    var balancelessFees: Float = {  //책의 표현을 빌리자면        '현잔액-수수료'를 빼는 연산프로퍼티를 반환하는 게터를              추가했다고한다.
        get{
            return accountBalalnce2 - fees
        }
        set{
              accountBalalnce2 = newBalance -fees
        }
    }

    func displayBalcne2{
      print("balance is \(accountBalalnce2)")
      print("number is \(accountNumber2)")
      
    }
}

/ < 프로토콜?? --->클래스가 충족해야하는 최소한의 요구사항들의 규칙들 >

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
/<<10.2(일) 이번주 수,목 분량 (1)>>>
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


>>>>>>> sub1-again:2022.text/October Study.swift
class Bankaccount{
    var accountBalalnce: Float = 0
    var accountNumber: Int = 0
    let fees: Float = 25.00   //수수료를 새로 프로퍼티에 추가하면

    var balancelessFees: Float = {  //책의 표현을 빌리자면        '현잔액-수수료'를 빼는 연산프로퍼티를 반환하는 게터를              추가했다고한다.       
        get{        
            return accountBalalnce - fees
        }
        set{ 
              accountBalalnce = newBalance -fees
        }
    }
    init(number: Int, balance: Float){
        accountNumber = number
        accountBalalnce = balance
     }
    func displayBalcne{
      print("balance is \(accountBalalnce)")
      print("number is \(accountNumber)")
      
    }
}

//이상태에서 기존의 Bank account 이외에 추가로 '저축하는 게좌'를 넣어야한다면?
//class savingAccount {~} 이렇게 처음부터 다시 쭉 써내려가면 비효율적이다
//그래서 나온게 지금 이야기할 개념인 슈퍼-서브클래스관계이다

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

class savingAccount: Bankaccount {
  //-->풀어설명하면, saving~를 선언하고 부모클래스를 bank~로지정한것이다
    //이럴 경우 bank~ 의 모든 속성,매서드를 상속받는 서브클래스가 된다
      var interestRate: Float = 0.0
      func calculateinterate() -> Float{
        return interestRate * accountBalalnce
      }

//그런데 만약 여기서 ...상속받은 매서드들중 필요없는건 지우고 싶다면????
//그럴때를 위해 나온개념이 '오버라이드override'->> 덮기+쓰기
//주의할점은 return,매개변수등의 타입이 일치해야만한다


    override func displayBalcne{
      print("balance is \(accountBalalnce)")
      print("number is \(accountNumber)")
      //여기에 추가로
      print("prevailing interest is \(interestRate)")
    }   //이러면 displayBalance라는 슈퍼클래스의 매서드를
          //savingaccount라는 서브클래스만의 다시쓰여진 매서드가 된다
  ///그런데....만약 이조차도 코딩써내려가는게 귀찮다면???
  //왜냐하면 print print print... 이렇게 3번을 써야하기때문에 이걸 위해나온게
  //super . ~~ 이다 !! 적용해보면

    override func displayBalcne{
      super.displayBalcne()
      print("prevailing interest is \(interestRate)")
    }

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


//그러면 슈퍼클래스에 있던 init?은 이역시도 상속이되는데 하위클래스에서는
//새로운 변수가 추가가 되어지기에 이는 따로 추가해넣어야한다
//다시말해 saviingAccount는 이자율에대한 새로운 변수가 필요하다

    init(number: Int, balance: Float, rate: Float){
          interestRate = rate
          super.init()(number: numebr, balance: balance)
    }     //슈퍼클래스의 init이 맨 마지막으로 온 이유는?
    //일단은 이해안가지만. 초기화과정에서 발생할수있는 잠재적 문제 해결위해서란다..
}  

//그러면 이제부터 이렇게 만들어진 하위클래스를 사용해볼까??  -------->

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


/ 즉, :::::::하위클래스 초기화하기::::::::

let savings1 = savingAccount(
              number = 12345
              balance = 5000.0
              rate = 0.09
)
print(savings1.calculateinterate())
savings1.displayBalcne()

//<익스텐션 extension>>
//하위클래스를 생성하지 않고 기존클래스에 매서드,init, property,  get/set등의기능을 추가하여 사용가능하다

// extension 클래스네임
extension Double {
    var squared: Double{
      return self * self
    }
    var cubed: Double{
      return self * self * self
    }
}       //Double이라는 클래스에 제&세제곱값을 반환하는 프로퍼티생성
let myValue: Double = 3.0
print(myValue.squared)


//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


<<구조체에 관하여..>>
//키워드가 class에서 ' sturct '로 바꼈을뿐 기본구조는 공통되는점이 많다.
//중요한건 공통점이아닌 무엇이 다른지 차이점에 대한 개념을 알아두는것!
//구조체 인스턴스 ==> 값value 타입 , copy개념 (즉, 수정시 원본영향x)     
//클래스 인스턴스 ==> 참조reference 타입, shared개념 (즉,수정시 원본도변함)
struct sampleStruct{

  var name: String
  
  init(name: String){
        self.name = name
  }
}
let myStruct1 = sampleStruct(name: "MARK1")
var myStruct2 = myStruct1     //**mystruct1을 복사하는 mystruct2
myStruct2.name = "David"    //값타입이기에 원본에 영향이 없으므로 출력하게되면 아래처럼 나온다.

print(myStruct1.name)    //각각 출력시 Makr1
print(myStruct2.name)             //David


//------>>>이것들을  그대로 keyword만 class로 바꾼다면?
class sampleStruct{

  var name: String
  
  init(name: String){
        self.name = name
  }
}
let myStruct1 = sampleStruct(name: "MARK1")
var myStruct2 = myStruct1    
myStruct2.name = "David"
print(myStruct1.name)    //각각 출력시 David
print(myStruct2.name)             //David
//즉, 원본까지 영향을주게되는 공유경제!
//왜??????
//동일한 인스턴스에대한 reference(참조)체 이기 떄문이다
///클래스 -->상속이 가능,애초에 상속을 염두해두고 만드는거기도하지만 여튼
//          상속 + 프로토콜 (option)
//구조체 ---> 상속자체가 x, 그렇기에 프로토콜만을 이용함



//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
<<10.2(일)(2) 이번주 목,금 분량 >>>
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


/배열초기화, 배열시킬경우 각각의 값들을 할당받음
//타입은 꼭 써야할까? 내부에서 자체적으로 타입추론하는경우도 있음

var treeArray: [String] = [ "Pine", "Oak", "Yew" ]
print(treeArray)
var treeArray2 = [ "Pine", "Oak", "Yew" ]
print(treeArray2)    
var treeArray3: Array<String> = [ "Pine", "Oak", "Yew" ]
print(treeArray3)     //이 3개는 같은 값이 출력된다

var newarray = [String](repeating: "반복", count: 10 )
print(newarray)

//기존의 배열 2개가 같은 타입으로 나열될경우 그 두 배열을 합치기 가능
let firstArray = ["a", "b","c"]        //[String]타입
let secondArray = ["d", "e", "f"]      //[String]타입
let thirdArray = firstArray + secondArray
print(thirdArray)

///추가로 배열이 비어있는지 확인해줄수 있는데 그러기위해선
//불리언(true,false) 타입인 isEmpty(프로퍼티)를 이용한다. 예를들자면
var colors = ["red", "green", "yellow"]
  if colors.isEmpty{
  }
  if colors.count < 1{

  }                         //사실 위아래는 같은의미이다. 그러나 위쪽방식을 쓰기를 추천한다고 되어있음

////*<<<기본 용어팁 (conunt 사람이 셀때, index 컴터가 셀떄)>>>>
print(treeArray[0]) ////----> 0이라는 index ---> 1번 자리 카운트


//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


/랜덤섞기 ----> 셔플(shuffled)매서드를 사용해보자

let randomColors = colors.shuffled()
print(randomColors)
// var randomColors2 = colors.shuffled()
// print(randomColors)          -->var도 해봤는데 이건 error남


//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

/배열에 새로운 항목을 "추가"하고 싶으면?????
//위의 셔플() 매서드처럼 어펜드()매서드를 이미 애플이 편의상 만들어둠!!
colors.append("black")
print(colors)
//만약 여러개를 넣고싶다?
// colors.append("white", "purple")
// print(colors)          ---->이렇게하면 error 그래서나온게 아래방식
colors += ["white","purple"]
print(colors)

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


/위의 방식과는 살짝 개념적으로 다른것으로는 "삽입"이 있따"
//추가는 사람이 임의로 index를 결정못했지만 삽입의 경우 지정이가능하다
colors.insert("gold", at: 0)
print(colors)     //gold라는 새 항복이 0이라는 index에 추가되었음
//마찬가지 개념으로 순서를 콕 찝어서 항목삭제가능 2가지 유형으로 익혀두자
colors.remove(at: 0)
colors.removeLast()
colors.removeFirst()
//colors.removeSecond()    <----실험 결과 이건 안됨
print(colors)

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

/반복문 + 배열===> 배열반복하기
//형태를 잘봐두자 아래의 예시를
//배열들을 바로바로 프린트하는 for 구문이다. 다시봐도 헷갈림...(-_-)
for color in colors{
    print(color)
}             //for in --->하나씩 꺼내서 처리하기
    //print안에 colors(x)color(o)-->? 변수명이 color이기에(?)...
    //여튼 이러면 결과물은 남은 색깔들을 "" 부호없이 종열로 한줄씩 출력됨

let mixedArray: Any = ["hi", 22, 0.2]
print(mixedArray)

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ



/<<딕셔너리> 얘는 key-value로 쌍을 지어이루어져있다

var bootDict: [String : String] = [
                                 "100-234" : "harry potter1",
                                 "100-235" : "harry potter2"
]
print(bootDict)
//빈배열의 딕셔너리도 생성가능 이럴떈.. 아래처럼한다
var bootDict2 = [String : String]()
//**근본적인 질문????????@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//8***8****8 이렇게 빈 배열등을 만들어내는 생성하는 이유는 무엇인가??
//이는 설계이다... 무슨설계?? ---->문자열 key와 문자열 value를 저장하기위해
//설계된 빈 딕셔너리를 만들기 위해서이다!!!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

var bootDict3 = [1: "newjeans",
                 2: "ive",
                 3: "nmixx"]
print(bootDict3.count) //딕셔너리 항목개수를 알려주는 '프로퍼티'
print(bootDict3[3])     
print(bootDict["100-234"])  //딕셔너리들의 value에 접근하는방법이다
//그런데 만약 지정되니 key가 오타이거나 아니면 아예 없으면?
//default 값을 정해주어서 따로 안내해주도록하자
print(bootDict["100-234", default:"not found"])//harry potter1
print(bootDict["100-000", default:"not found"])//not found 출력됨
// 접근을 알았으니 이번엔 갱신을 할차례!! 새로 덧씌워 보자!!
bootDict["100-234"] = "holly shit!"
print(bootDict["100-234", default:"not found"])//holly~로 바뀜
//이렇게도 해볼 수 있따
bootDict.updateValue("happy day", forKey: "100-234" )//happyday!!
print(bootDict["100-234", default:"not found"])

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


/배열의 추가 append 삽입 insert 제거 remove 매서드가 있었던것처럼
/딕셔너리는???
//굉장희 형태가 쉽다
//딕셔너리변수[키] = 값
bootDict3[4] = "bts"  //형태만보면 아까 덧씌우는거랑 똑같음
print(bootDict3)
//삭제하기는?  value----> nil 을 넣어주면됨다.
bootDict3[4] = nil
print(bootDict3)        //bts항목이 삭제가 된다
bootDict3.removeValue(forKey: 3)
print(bootDict3)          //nmixx 항목도 삭제가된다.. 
///마지막으로 배열과 마찬가지로 반복을 원해?? 이것 역시 for 구문
//그러나 단순 for 구문이 아닌 'tuple'을 이용한다!!!
//----------->
// for (bookIdAndTitle) in bookdict{
//     print("book id:\(bookid), title:\(title)")
// }
//이러면 책 dict항모을 모두 가져다가 각각의 키와 값을 출력하게 된다!

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


//@@@**** 추가
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//예제 3번 조원들의 정답!--->>
headLine(3)

let favoriteArtists : [String] = ["뉴진스","아이유","아이유","tom misch","프나","Benson boone","수지","tyga"]

let dict = Dictionary(uniqueKeysWithValues: zip(names, favoriteArtists))
//uniqueKeysWithValues 초기화를 위해서... (**ppt136page참고하자)
for (k,v) in dict {
    print("\(k) : \(v)")
}
//이를 통해 [조이름 : 좋아하는 아티스트]딕셔너리를 생성할떄
//내가 했던 것처럼 조이름을 일일이 다쓰지 않아도 된다
//..이쪽 세계에 들어왔으면 이에 맞춰 나의 기존 사람식 사고를 컴퓨팅식 사고로 바꿔야만 하는구나 생각한 계기
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
