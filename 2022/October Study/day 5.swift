import Foundation

//--------------------------------------------------------------------
//--------------------------------------------------------------------
//                           10.5(목)
//                 1교시 (my ppt 69~75page)
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//오늘 배운'클로져Closures' 아직 내수준에 소화하기 참 쉽지 않았다.
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
//                 2교시 (my ppt 76 ~ page)
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//전역함수 - 우리가지금까지 만들어 왔던 바로 '그' 함수
//중첩함수 - 함수안에 함수
//**사실 지금까지 우리가 사용한 모~든 함수는 '클로저closure'였다는 출생의 비밀...두둥

// <클로저표현식> 은 다음과 같다
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


//---------------------------------------------------------------------
//  < 정렬 메서드 sorted(by: ) >
//---------------------------------------------------------------------


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

// < in-out 과정>에 대해 간단히 말하면
//  " in-out의 매개변수는 다음 과정을 거친다"
// 함수 호출 ---> 매개변수로 넘겨진 변수가 복사 ---> 함수의 Body에서 해당값을 수정
//      ---> 함수 반환시 수정값을 원본변수에 재할당 
// (위의 동작들은 copy-in/out  or  call by value result라고 불리움)


//클로져 에서 '파라미터'는 in-out파라미터일 수도 있지만.... 기봇값을 가질 순 없다.
// 그러나... 가변 프로미터의 이름을 지정할 경우 가변파리머터를 사용가능.
//클로저 표현구의 일반적인 형태는
//         { (파라미터) -> 리턴타입 in           --->. in 을 기준으로 앞부분 : 함수의 타입
//              statements   ~  ~      }                         in포함 뒷부분 : 함수의 Body
//      즉, 클로져의 바디의 시작은 'in 이라는 키워드'로 시작해서 
//          파라미터와 리턴타입의 정의가 끝날때까지이다

//---------------------------------------------------------------------

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


