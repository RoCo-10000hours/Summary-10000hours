import Foundation


//10.3(sunday)
//1~2주차 복습(rewind)
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

//8bit ---> 1byte
//64bit --> 64차선의 도로



//타입: 정보가 저장되는 '형식'
//변수: 타입을 사용해 지정한 값을 '저장하는 곳'
//-데이터 타입이 필요한 이유??? : 메모리 공간을 차지하는 내용들의 타입에 따라 미리 필요한 크기만큼 자리를 잡아주기위함 --->그냥 미리 자리 확보해두기 위함이라고 익혀두자




//여러줄의 문자열을 출력하고 싶다??----> 삼중 따옴표!!!
var multipleline = """
 안녕하세유, 만나서 반갑습니다,
nice to meet and glad happy to meet u
"""
print(multipleline)


//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


//그다음 학습한것이 <<<<'튜플Tuple'>>>>
// ----->내가 아직도 실전에서는 헷갈리는 개념 @@@@@@@
//특징들을 일단 나열해보면
//1.추석선물꾸러미(여러타입값들이 튜플내에 저장 가능함)
//2.그렇기에 여럿값들을 하나의 항목으로 임시적으로 묶음
//3.결국 ...이로인해 하나의 함수에서 ===> 여러값들을 반환하는데 사용 가능!
let mytuple = (5, "hi", 3.3)
                  //지금 위의줄 자체가 하나의 함수이기에
print(mytuple)    //지금과같은 출력은 의미x mytuple이아닌 무엇을 적어도
                  //프린트가 된다
print(mytuple.2)//이런식으로 해줘야 튜플의도를 살리는 예제이다.   
                //의도대로 하나의 함수에서 여러값들을 반환받기가 가능함을 보여주는 예시였음.


//(**참고로교재에선 과정을 하나더 추가해서 한다 )
let myString = mytuple.1
print(myString)         //이런식으로 말이다...          
//이걸 응용해서 각각의 값들에 미리 변수를 설정해두면?
let(myInt, myString1, myDouble) = mytuple  ///이런식으로하면 된다.
//각각의 값들에게 순서대로 '이름을 부여해서' 필요할때마다 꺼내쓰는 개념...
//그런데.......이걸 번거롭게 다~ 적어야 할까??
// 쉽게말해서 꺼내 쓸떄마다 미리 다부여하고 꺼내고 , 또 새로설정하고 꺼내고..
//이런 번거로움을 피할 수 있게 해주는게 아래와같은 형태이다
let(_, _, myString2) = mytuple


//위의 방법이 튜플을 사용할떄 각각의 값들에 '네임'을 부여하는 2번째 방법이라면,
//마지막 3번쨰 방법이 '강사님이 주로 쓰시는 방법'이라고 한다
//바로 애초에 생성할떄 '네임'을 부여해주는 것이다
//** 이방법이 '협업'을 하시기에 가장 좋았떤 방법이었기 떄문이시라고 한다
let mytuple2 = (count:5, message:"hi", percent:3.3)
print(mytuple2.count)


//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


//이거 다음으로 익힌게 <<<옵셔널 타입>>>
//옵셔널이 중요한 이유가.... 이게 거의 Swift의 철학을 담고있기 때문이라고 강사님이 말하신다. 다른언어에는 없다고 한다
//공부해보니깐 일단, 이건 우선 형태를 먼저 봐야한다
            var index: Int?
// 뒤에 '물음표' 보이는가????    
//'변수'를 선언할때 '데이터 타입 뒤쪽에' '물음표를 붙이면' 형태가 끝이다
// 왜?????????????
//변수or상수의 뒤쪽에 값이 '할당'되어 있지 않을경우, 불안전하고 일관되지않은
//접근방식으로 설정되지만 "물음표"를 통해 <안전하고,일관된>접근방식을 갖게된다...
// --------------> 정수형(옵셔널)타입 이라고 한다

// 우리들의 컴퓨터는 이 타입의 값을 2가지로 인식한다
//(정수 or nil)
//원래대로 정수를 할당하면 정수값을 갖게되는것이고
//어떤값도 할당되지 않은 옵셔널은, 'nil'의 값을 갖게 되는 것이다.
//(**)즉, <'nil타입의 값' or '정수타입의 값'>
//쉽게 설명하면..... 있으면 있는대로 없으면 없는대로 굴러가게 해줌


//이렇게 옵셔널된 'nil타입의 값'에 값을 부여한다면????
//이걸 용어로는 해당값으로 옵셔널 내에서 '래핑wrapped'되었따고 한다
//용어에 쫄지 말자.. 난지금 덜 익숙할 뿐이다. 자주 마주치자
     index = 3        //<---3이란 값으로 래핑된 모습
//그리고 우리는 이제부터 이 래핑된 값을 사용할떄마다
//'강제언래핑forced unwrapping'을 한다...고 부르자

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

//그리고 실전에서 사용할때는 '느낌표(!)'를 활용한다
var colors: [String] = ["red", "blue", "white", "purple"]
if index != nil{              //참고로 왼쪽형태 그대로 띄어쓰기 맞춰야함
    print(colors[index!])
}   else{ 
    print("there is no index number")
}                     /// 출력되는 값 ---> purple
//여기서 드는 궁금증..... 꼭 강제언래핑(!)를 써야 Purple값이 나오나?
//      print(colors.3)        튜플처럼했는데 일단 이거는 안됬음
//  let mycolors = colors.3
//   print(mycolors.3)         요방식도 안됨
//// 할당된 값을 '강제언래핑(!)' 형태가아닌 직접 접근하여 호출하면
//error생길 확률이 커진다고 한다. 
//비유하자면 강제언래핑은 일종의 폭탄들어있는 선물상자를 착각해서 뜯을 우려가 
//있기에 자주 사용되는 명령어는 아니라고 한다! <강제로 포장 뜯지 말자!!>

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

//그럼 선물이 궁금한데 어떻게 해야 상자를 뜯지?
//이럴때를 위한 방법이 있다.
// @@@@<<< 옵셔널 바인딩 optional binding에 관하여 >>>@@@@


// 우선 말로 풀어서 쉽게 비유하자면,
// "똑똑똑 optional name님 안에 계신가요??... 계신다면 나오실떄 constant name이라는 이름을 명찰달고 나와주실래요??"
//이걸 코드로 나타내보면
// if let constanName = optionalName{
// }        
// if var constanName = optionalName{
// }       //이렇게 나타낼 수 있다.. 
           //이걸 우리가 만들었던 color배열에 적용하면??
index = 2
if let myValue = index{
    print(colors[myValue])
}   else{
    print("there is no index number")
}                         //이러면 무사히 white 출력된다
/////이런식으로 if let A = B{}
//형태를 이루고 자주나온다. 마치 for _ in ...처럼
//그러니 형태를 익혀두는것도 추천한다

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

//추가로 더 들어가보자면....옵셔널이 여러개 있다면?????
var pet1: String?
var pet2: String?
pet1 = "dog"
pet2 = "cat"
if let firstPet = pet1, let secondPet = pet2 {
    print(firstPet)
    print(secondPet)
}   else{             //*주의) else 앞뒤로' } { '가 있는데 계속 실수중
    print("no pet")     // pet2를 아예 없앨경우 출력되는 "no pet"
}
// 참고사항 1) pet2 = nil   -----> "no pet"
// 참고사항 2) 콤마(,)대신 &&를 넣으면? 2가지 모두 충족해야만하기에 error
// 이걸 한번더 응요해서 '조건문'에 카운트 까지 넣을수도 있다
let petCount = 10
if let firstPet = pet1, let secondPet = pet2, petCount > 1 {
    print(firstPet)
    print(secondPet)
}   else{             
    print("no pet")     
}
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

// 추가로 if let & if var 예시를 좀더 비교해서 알아두면...
var name2: String?
name2 = "Minji"

if var myName2 = name2{
  myName2 = "Daniel"
  print("\(myName2)")
} else{
  print("other Nwjs members")
}                               //---> Daniel 

if let myName3 = name2{
  print("\(myName3)")
} else{
  print("other Nwjs members")
}                               //---> Minji

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


//끝으로 옵셔널의 주의점!!!
// nil 을 사용할 수 있는건 -----> 옵셔널 뿐이다
//그렇기에 아래 3가지 모두 error
//      var myInt = nil       (x)
//      var myString = nil    (x)
//      let myConstant = nil  (x)
//즉, 옵셔널이 아닌 변수 or 상수에는 nil을 할당할 수 없다
//     선언부에서 물음표로(?) 옵셔널 결정을 미리 해야한다

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

//////옵셔널에 대한 마지막 첨언
//굳이 옵셔널을 쓰지않더라도 원하는값을 직접넣어 바로초기화 하는게 편하지않나??
//이런 질문에대한 대답은---->
//(*nill이란 '포스트잇 붙여넣은 상태의 박스'가 옵셔널!!!)
  //(우리가 편해서 하는것이라고 하기보단)
    //(안정성을 위해 메모리를 미리 부여하는것이라고 일단 이해)


//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ



//@@@@<<<Any, AnyObject, Nil에 관하여.....>>>@@@@
// : Any    ---> 타입 Any는 모든타입ok
//               그러면 지금까지 내가 배운건 헛수고??
//               그건 아니다 차차 알게 됨
//우선,간단히라도 설명하자면....
//swift언어특성상 타입에 엄격함! 그런데 만약 위의 것들을쓰게되면
//해당타입으로 선언된 변수를 가져다 쓰기위해서는
//매번 타입 및 변환을 해줘야만 한다 ----> 오류error 발생 가능성 커짐

//*cf) Any는 그냥 Any로서 모든타입가능한것뿐이지 다른 타입들과 상하관계는 X
//아래의 예시가 그걸 보여주는 예제이다
var someAny: Any = 100
someAny = "어떤 타입도 ok"    //String
someAny = 123.123          //Float,Double
//let someDouble: Double = someAny    --> error

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

// : AnyObject   ----> Any보다 좀더 '한정적'
//                     클래스의 인스턴스만 할당가능  
class someClass {}      //이런 클래스가 있다면,
// var someObject: AnyObject = someclass()//<---클래스의 인스턴스  
//위의 처럼은 가능하지만....아래처럼은 안된다
//someAnyObject = 123.123    