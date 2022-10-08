import Foundation

//--------------------------------------------------------------------
//--------------------------------------------------------------------
//                           10.5(수)
//                 1교시 (my ppt 69~75page)
//---------------------------------------------------------------------
//---------------------------------------------------------------------
 오늘 배운'클로져Closures' 아직 내수준에 소화하기 참 쉽지 않았다

func functionA() -> () -> Int{
    var counter = 0
    func functionB() -> Int{
        return counter + 10
        }
        return functionB
}
let myClosure = functionA()
let result = myClosure()         //---> function A는 functionB라는 이름의
                                 //     함수를 반환(return)한다
print(result)                    // ---> 10출력
//      사실 '변수 counter'는 funcA종료동시에 업무가 끝나지만...
//          현재 funcB에의해 잡혀있는captured 상태이다(*연장근무*)
//여기서 Return type 은 첫줄의 0 -> Int     이부분이고,
//       중첩된 함수는  3째줄의 0 -> Int.    이부분이다.
//위의 코드를 말로 풀어보면
// funcB는 해당함수의 밖에서 선언된 counter란 변수에 의존한다
//그렇기에 'funcA는 클로저를 반환하고' 있다
//그런데 왜? '클로저'라고 부르는가????
//잡고있다captured = 가두고있다closed over = closure(전통적컴공어)
//---------------------------------------------------------------------

func functionA1() -> () -> Int{
    var counter1 = 5
    func functionB1() -> Int{       //A안에서B선언(중첩된함수)
        return counter1 + 30        //B외부에서 변수를 가져옴(클로져)
        }
        let result1 = functionB1()
        print("\(result1)")             //------> 35 출력
        
        return functionB1        //funcB()를 호출하는게아닌 functionB 값자체를 호출
}
let myClosure1 = functionA1()   
 print("\(myClosure1())")                //------> 35 출력
 
//---------------------------------------------------------------------

//여기서 조금더 확장해 나간다면???? 변수부분을 바꿔보자

func functionA2(counter2: Int) -> () -> Int{         //(**변화된 부분)
   //var counter1 = 5//                              //(**변화된 부분)
    func functionB2() -> Int{       //A안에서B선언(중첩된함수)
        return counter2 + 30        //B외부에서 변수를 가져옴(클로져)
        }
        let result2 = functionB2()
        print("\(result2)")             //------>35(x) 37(o) 
        
        return functionB2        //funcB()를 호출하는게아닌 functionB 값자체를 호출
}
let myClosure2 = functionA2(counter2: 7)             //(**변화된 부분)
let result2 = myClosure2()                          
print("\(myClosure2())")                        //37
print("\(result2)")                             //37

//---------------------------------------------------------------------


//funcA() 결과는 functionB return값!
//그렇기에 function에 프린트 한게를 더 넣는다면???

func functionA3(counter3: Int) -> () -> Int{        
    func functionB3() -> Int{  
        print("붙잡힌 counter는 \(counter3)입니다")             //출력1
        return counter3 + 30        
        }
        let result3 = functionB3()
        print("\(result3)")                                     //출력2
        
        return functionB3
}       
let myClosure3 = functionA3(counter3: 7)             
let result3 = myClosure3()                          
print("\(result3)")                                 //출력 1 && 2

//--------------------------------------------------------------------
//--------------------------------------------------------------------
// 
//                 2~3교시 (my ppt 76 ~ page)
//---------------------------------------------------------------------
//---------------------------------------------------------------------
/전역함수 - 우리가지금까지 만들어 왔던 바로 '그' 함수
/중첩함수 - 함수안에 함수
/**사실 지금까지 우리가 사용한 모~든 함수는 '클로저closure'였다는 출생의 비밀..*/

 <클로저표현식> 은 다음과 같다
//  1)컨텍스트에서 파라미터와 반환값 타입 유추
//     Inferring parameter and return value types from context
//   2)단일 표현식 클로저의 임시적 반환
//     Implicit returns from single-expression closures
//   3)약식인자 이름
//     Shorthand argument names
//     4)후행클로저 구문
//     Trailing closure syntax

//*cf 파라미터? 
//              func join(string s1: String, toString s2: String, withJoiner joiner: String)
//           --->  string tostring withjoiner.  외부 파라미터 / s1 s2 joiner 내부 파라미터

//  클로저 표현식이란 ? 기본 클로저 함수 형태에서 쭉~ 쭉~ 축약해 가는 과정


///---------------------------------------------------------------------
///---------------------------------------------------------------------
  < 정렬 메서드 sorted(by: ) >
///---------------------------------------------------------------------
///---------------------------------------------------------------------

//정렬메서드는
//1)클로저를 허용(단,배열내용과 동일한 타입의 두 인자를 사용하는)
//2)그리고 정렬 클로저는 1번째 value가 2번째 value 앞에 위치해야하면 true 
//                          그렇지않으면 false를 반환하는 Bool 값반환

let names = ["Charllate", "Andre", "Emoji", "Bouncil","Den"]
func backward(_ s1: String, _ s2: String) ->Bool{
    return s1 > s2
}
var reverseNames = names.sorted(by: backward) 
//      ----> 문자열에서 '값이 더 큼'의 의미는? (알파벳 순서가 '역순') --> 알파벳 '뒷순서일수록 큼'
//            이럴 경우 s1>s2 문자열일 경우 ---> s1이 앞파벳 '뒷순서'
//            그리고  s1>s2일때만 'true'를 반환한다    
print(reverseNames)         //-->'알파벳 역순'으로 출력됨


//참고로 정렬메서드에 함수를 없애면???
let names2 = ["Charllate", "Andre", "Emoji", "Bouncil","Den"]
var reverseNames2 = names2.sorted() 
print(reverseNames2)      //----> '알파벳 앞순서'로 출력됨

//즉, 위의 과정을 정리해보자면
//String값의 배열을 정렬하고 싶다 ---->  (String, String) -> Bool 타입의 함수 필요하다
//       ---->  sorted(by :)메서드가 필요하다 ---->이곳에 인자로 전달함
// **** 위의 예제는 아직 클로저로 표현한 식은 아니다 ****
// **** sort(by: )메서드를 이용한 그냥 본질적인 단일표현식함수(a>b)를 작성한것 ****

//---------------------------------------------------------------------

 < in-out 과정>에 대해 간단히 말하면
//  " in-out의 매개변수는 다음 과정을 거친다"
// 함수 호출 ---> 매개변수로 넘겨진 변수가 복사 ---> 함수의 Body에서 해당값을 수정
//      ---> 함수 반환시 수정값을 원본변수에 재할당 
// (위의 동작들은 copy-in/out  or  call by value result라고 불리움)


//클로져 에서 '파라미터'는 in-out파라미터일 수도 있지만.... 기본값을 가질 순 없다.
// 그러나... 가변 프로미터의 이름을 지정할 경우 가변파리머터를 사용가능.
//클로저 표현구의 일반적인 형태는
//         { (파라미터) -> 리턴타입 in           --->. in 을 기준으로 앞부분 : 함수의 타입
//              statements   ~  ~      }                         in포함 뒷부분 : 함수의 Body
//      즉, 클로져의 바디의 시작은 'in 이라는 키워드'로 시작해서 
//          파라미터와 리턴타입의 정의가 끝날때까지이다

//---------------------------------------------------------------------

/ * 단축 1) **

//let names = ["Charllate", "Andre", "Emoji", "Bouncil","Den"]
//func backward(_ s1: String, _ s2: String) ->Bool{
//    return s1 > s2  }
// ****     위의 전역함수를 클로저함수의 기본형으로 표현해보면 ****
reverseNames = names.sorted(by: { (_ s1: String, _ s2: String) -> Bool in
    return s1 > s2
})
print(reverseNames)                 //  전역함수를 이용했던 맨위의 방식처럼 같은 역순 결과가출력된다


// 위와 같이 표현이 줄어들게 된 이유는???
//  파라미터와 반환타입이 중괄호 안쪽 ... 
//          그러니깐 sorterd(by:{ } ) 해당 메서드의 안으로 들어왔기 때문이다

//                                                      ( ~ ppt 83page분량)
//---------------------------------------------------------------------

/ * 단축 2) **
//난 이것도 너무 지저분하게 길다 싶은가?? 싶으면 한줄로도 가능

reverseNames = names.sorted(by: {(_ s1: String, _ s2: String) -> Bool in return s1 > s2 })
print(reverseNames)
                            //그냥 2줄짜리를 1줄로 쭉 엔터없이 한것 
                            
//---------------------------------------------------------------------

/ * 단축 3) **
//최종의 최종.text
//배열이 String 문자열들로 채워진걸 알기 때문에

reverseNames = names.sorted(by: { (_ s1, _ s2) -> Bool in return s1 > s2 })
print(reverseNames)
                                        //String이라는 '타입추론'하게끔 다 뺐다

//---------------------------------------------------------------------

/ * 단축 4) **             
//컨텍스트로 타입유츄(inferring type from context)
/*정렬클로저 ---> 메서드에 인자로 전달됨--> 그렇기에 위의 단축3처럼 파라미터타입과
                                           반환되는 값의 타입을 유추가능*/
                //쉽게설명해서 정렬메서드란것자체가 '문자열타입 배열'에서 사용되기에
                //어차피 호출 되는건 '(string, string) -> Bool'타입의 함수라는 말
//즉, 이번엔 반환되는 값의 타입을 생략해보면

reverseNames = names.sorted(by: { s1, s2 in return s1 > s2 })
print(reverseNames)

//---------------------------------------------------------------------

/ * 단축 5) **
//퇴근하려고? 벌써?(feat.끝날떄까지끝난게 아님)

reverseNames = names.sorted(by: { s1, s2 in s1 > s2 })
print(reverseNames)

//---------------------------------------------------------------------

/ * 단축 6) **
// 여기부턴 사실 많이쓰이진않는다함(feat.그래도 쓸사람은 씀)
//짧은 인자이름으로 대체하는 방법인데

reverseNames = names.sorted(by: { $0 > $1 })
print(reverseNames)
                            //클로저표현식에선 첫번쨰 인자를 $0
                            //두번째 인자를 $1로 표현함 (일종의 약속)

//---------------------------------------------------------------------

/ * 단축 7) ** 
//최종오의(feat.수고했다)
//연산자 자체를 메서드로 만드는 방법

reverseNames = names.sorted(by: >)
print(reverseNames)

//---------------------------------------------------------------------
//마지막으로 덧붙여주신 강사님 advice!!
/*—-> 강사님왈: 축약이 모두 능사는아니다. 아무리 길더라도
내 스스로가 이해 할 수 있는 코드가 가장 좋은 코드이며
협업하는 동료들또한 이해할 수 있어야한다. 그 중간 적절점을
타협해가는 과정이 팀플레이team play */

                                                    //( ~ ppt 87page분량)
                                                    
//--------------------------------------------------------------------
//--------------------------------------------------------------------
// 
//                 3교시 (my ppt 87 ~ )
//---------------------------------------------------------------------
//---------------------------------------------------------------------


// 방금까지 배운 '문자열 정렬클로저'는 ----> < '후행클로저' > 이다
reverseNames = names.sorted(by: { $0 > $1 })
//후행클로저이기때문에 .... sorted(by:)메서드의 소괄호 바깥에서 작성가능
reverseNames = names.sorted() { $0 > $1 }

//후행클로저의 표현식이 함수와 메서드의 유일한 인자일경우?
                //---->함수 호출시 뒤에 () 생략가능하다
reverseNames = names.sorted { $0 > $1 }
print(reverseNames)

//이러한 '후행클로저'는 클로저길이가 길때 유용하다


//---------------------------------------------------------------------
//---------------------------------------------------------------------

// <<  map(_:) 메서드를 후행클로저에 활용해 보기 >>
/* map() ----> Array의 각 요소들을 하나씩 하나씩 꺼내서
               어떻게 처리할지를 정하는것! */
            
//---------------------------------------------------------------------
let digitNames: [Int: String] = [
    0: "Zero",
    1: "One",
    2: "Two",
    3: "Three",
    4: "Four",
    5: "Five",
    6: "Six",
    7: "Seven",
    8: "Eight",
    9: "Nine"
]

let numbers: [Int] = [16, 58, 510]

// ["OneSix", "FiveEight", "FiveOneZero"] 배열 만들기
let strings: [String] = numbers.map { (number: Int) -> String in
    var number: Int = number                   //매개변수로 가져온 number는 상수-->변수로변환필요(쉐도우변수)
    var output: String = ""
    
    repeat {
        output = digitNames[number % 10]! + output            //소숫점앞 맨 앞자리에 해당하는 
                                                             //문자열을 계속 앞에 더해주는 문자열 결합
                                                            //즉,16->6, 58->8, 510->0 이러식이
        number /= 10                                    //number는 Int이기 때문에, 10으로 나누면 소숫점 이하의 값은 버림
    } while number > 0                                      //즉, 16->1.6->1, 58 -> 5, 510 -> 51
    
    return output
}

print("\(strings)")             ///--> 출력시 ["OneSix", "FiveEight", "FiveOneZero"]
                
                
//cf.. )  // print("\(number % 10)")         
          // -------> number % 10 문구는 number를 10으로 나눈 나머지, 그러니까 소숫점 앞 맨 아랫자리수 한자리

          // 상기이 맵메서드는 배열에 각아이템을위해 클로저 표현식을 호출하는데
                //매핑할 배열의 값으로부터 클로저의 입력 파라미터인 'number'의 타입을 유추가능.
                // 따라서 'number'의 타입을 지정할 필요는 없음... 즉 생략가능했다는 이야기

          // 함수와 클로저의 파라미터는 -----> 항상상수(즉, 쉐도우변수되야함)


                             /*   (~my ppt.93page)
                                (이거 직전에 후행클로저 중복부분은 아직도
                                헷갈리니 다시 확인하길) */

                                
//---------------------------------------------------------------------
//my ppt 94~
//---------------------------------------------------------------------
  < 캡쳐값 Capturing Values) > 
//---------------------------------------------------------------------

/*클로저는 상수/변수를 캡쳐(capture)가능함
캡쳐가 가능하다??? ---> 해당 상수/변수가 범위 밖에 있떠라도
                         가져와서 참고가 가능해짐
우리가 생각가능한 가장 간단한 캡쳐 클로저형태는???
-----> 다른 함수의 내에서 작성되어지는 '중첩함수'
해당 '중첩함수'는 바깥함수에 있는 어떤인자/상수/변수든 캡쳐가 가능함! */

//강사늼의 tip!!
//일단, 기본틀을 우선 만들기를... 머리속에서 첫~끝까지 한번에
//가는 사람은 천재이다

//---------------------------------------------------------------------

//     func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    
//             func incrementer() -> Int {
        
//                 return 0
//               }
    
//               return incrementer
//              }

//이것처럼 기본틀을 잡아놓고 여기에서 로직을 진행해나가면된다
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal: Int = 0
    
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

print("\(incrementByTen())")         //--> 출력시 10
print("\(incrementByTen())")         // 10 + 10 = 20
print("\(incrementByTen())")         // 20 + 10 = 30
                        // < return --->뒤에서 이어지는 결과는 앞에서가져옴 >
//****주의점****                        
let incrementBySeven = makeIncrementer(forIncrement: 7)
print("\(incrementBySeven())")          // 37 (x) ?????
                                //기존과 분리되어 새로생성 ----> ' 7 '

//---------------------------------------------------------------------

// 위에서 캡쳐되어진 값들은 runningTotal 과 amount 이다
// 2개의 값을들 캡쳐한 후에 incrementer함수는 호출될때마다
// amount로 runningTotal 을 증가시키는 형태의 클로저로서
// makeIncrementer에의해 반환되어진다

//즉, 다시 설명하자면 파라미터(매개변수)가 따로 없는
//안에 존재하는 중첩함수는 runningTotal,amount를 참조reference하고있다
// 해당 '참조를 캡쳐하여' 함수내에서 사용중!

//---------------------------------------------------------------------
//--------------------------------------------------------------------


 < 클로저는 참조타입(Closures are Reference Type) > my ppt 98.

let alsoincrementByTen = incrementByTen     //이라고 또 할당할 경우
print("\(alsoincrementByTen())")     // 20 + 10  + 10 = 40
/*위의 코드는
  alsoincrementByTen와 incrementByTen 두 호출들은 같음을 보여준다.
  왜냐하면 2개무도 같은 클로저를 참조하기떄문에 
  둘다 증가하고 같은 러닝합계running sum를 반환한다.
  즉.............
  서로다른 2개의 상수or변수에 클로저를 할당한다면
  각각은 모두 같은 클로저를 참조한다는 의미를 보여준다*/
  

//---------------------------------------------------------------------
//--------------------------------------------------------------------


< 이스케이프 클로저 (Escaping Closures) >
/*클로저를 함수의 파라미터로서도 이용이 가능한데
 예를들어 completionHandler(매개변수명) 라는 
 클로저는 파라미터로 사용될경우
 파라미터 타입 앞에 @escaping
 이라는 키워드를 명시해야 한다*/
 
 
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
    
}               //***질문) ~handles ,~handle 왜다른가?
                ///맨아래줄을 해석해보면 
                //completionHandlers의 인스턴스에 completionHandler라는
                //매개변가 들어간건가?
                    ///-----<<<<<<<@@ 일단 skip.
/*그리고 이렇게 전달된 completionHandler는 main함수가
  끝나고 나중에 처리가된다.만약 여기에서
  @를 붙이지 않는다면 오류가 발생한다 */                   
                    


//추가적으로.... @escaping ~~~ '  self. ' 가 항상 동반된다
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()    // 함수 안에서 끝나는 클로저
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 } // 명시적으로 self를 적어줘야 합니다.
        someFunctionWithNonescapingClosure { x = 200 }  //*****여기서 self는 closure????
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"

completionHandlers.first?()
print(instance.x)
// Prints "100"


//---------------------------------------------------------------------
//--------------------------------------------------------------------

 < 뮤테이팅 mutating >

//일단 설명을하자면, 특성 메서드내에서 구조체or열거형 프로퍼티를 
//수정해야 할 경우 해당멤서드의 동작을 변경하는것!

//일단 이해가 안되니 여기에 적어놓고 두고두고 와서보면서 익숙해지자
struct Person {
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name.uppercased()
        self.age = age
    }
    
    func changeAge() { 
        age = 10  //----> errorr가뜬다 이부분이 
    }
}         /* -->1)person이라는 구조체는 name,age 프로퍼티소유
                 2)init통한 초기화                  
                  3)changeAge()라는 메서드소유
                    --------> 그러나 ...출력시 error ---? 왜?
값타입인 구조체에서는 메서드안의 값을 수정(X) 
이럴떄.......  <  mutating func changeAge() > 
                                       ----> 수정가능(o)
                                       
이후에 man이라는 인스턴스를 생성후 메서드에 접근하면? */
var mans = Person(name: "park", age: 30)        
man.changeAge()
print(man.age)      //----> 24 출력
/*초기화에선 24를 넣었지만 메서드를 통해 age가 10으로 
바뀌게된다 */
                    



//---------------------------------------------------------------------
//--------------------------------------------------------------------

여기부분까지가 swift강의 한사이클의 끝. 내일부터는 objective-c진도
                                                
                                                    (~ my ppt .106)


//---------------------------------------------------------------------
//--------------------------------------------------------------------




//--------------------------------------------------------------------
     스위프트 주말 보충특강 (클로저closures)
//--------------------------------------------------------------------


func addTwoInts(_ firstNumber: Int, _ secondNumber: Int) -> Int {
    return firstNumber + secondNumber
}

//print("\(addTwoInts(13, 2))")

func sayHello(afterFunc: (Int, Int) -> Int) {
    print("Hello world!")
    print("\(afterFunc(2, 4))")
}

// 함수를 직접 매개변수로 보내기
sayHello(afterFunc: addTwoInts)

// 인라인 클로저를 매개변수로 보내기
sayHello(afterFunc: { (firstNum: Int, secondNum: Int) -> Int in
    return firstNum + secondNum
})

// 클로저 매개변수 뒤로는 아무것도 더 매개변수 없으니까 후행클로저 문법으로 축약 가능
sayHello { (firstNum: Int, secondNum: Int) -> Int in
    return firstNum + secondNum
}

// 물론 클로저도 상수나 변수에 넣어서 매개변수로 보내는 식도 가능하다
let addTwoNumbers: (Int, Int) -> Int = { (firstNum: Int, secondNum: Int) -> Int in
    return firstNum + secondNum
}
sayHello(afterFunc: addTwoNumbers)

// 클로저 다이어트 대장정 돌입
sayHello { firstNum, secondNum in
    return firstNum + secondNum
}

sayHello { firstNum, secondNum in
    firstNum + secondNum
}

sayHello { $0 + $1 }

sayHello(afterFunc: + )



