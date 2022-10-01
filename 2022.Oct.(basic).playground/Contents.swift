import Foundation

// <<<<10.1(Sat)>>>>
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
