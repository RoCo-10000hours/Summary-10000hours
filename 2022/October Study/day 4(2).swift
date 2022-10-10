import Foundation


//당일 10.4(화) 복습 

//--------------------------------------------------------------
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
        4주차 (화요일)
                    1~3 교시 내용
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//--------------------------------------------------------------


오늘 배운것은 에러를 대처하는 '에러핸들링error handling'
//오류에는 여러 종류가있음
// 문법이 틀리거나 or 작동중(run time)오류거나 or "논리적오류"
//어떤 불가사의한 이용자가 터치버튼을 연속 1만번 작정하고 누름
//그리고 그걸로 error가 뜸.. 누구잘못??
//이용자? 개발자? --------------> 개발자의 잘못이다..억울하지만..
//이러한 통제할 수 없는 상황에 대비하는게 오늘 주제임
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
(***개발자의 연봉이 높은건… 다 이유가 있다… 책임을 많이 져야하기에…)
// (****그리고 그정도의 high level의 연봉을 받고싶다 ?
 		————> 에러 핸들링 숙련도에 따라 달렸다
// ——>이는 지식정도의 문제가아니라, 쌓여있는 경험이 필요하다는 강사님의말.. 
//        실무에 들어가서 겪었을때.. 맞아봐야 당해봐야 알수있는 경험들… 
//        경력직,cto들의 연봉이 높은이유가 이거임… 오히려지식은 당신들이
// 	더 빨리 더 유연히 습득할것이다 그런데 위와같은 대처능력이 차이날뿐…)
// ((**그렇기때문에 앞으로의 커리큘럼과정에서 내가 만드는 코딩도 하겠지만,
// 남의 코딩,다른조들의 코딩들을 회고 & 피드백 & 리뷰 & 수정하는
// 시간에 적잖은 시간들이 할애될 것이다 ))
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

swift에서 에러error를 처리하는 과정은 단순하다
// ios앱이 메서드내에서 원치않는 결과 발생 --> 에러(스로잉throwing)
//      --> 매서드가 던진(throwing)에러를 잡아서 처리
//( 그러나 앞으로는 표현의 오해를 막고자 '던진'이라는 표현보다는, 
//         '에러를 던진경우' === '에러 상황발생할 경우'로 표현하자)


//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
@@@ '의도적오류'가 발생할 수 있도록 상황을 미리 설정하는게 Point @@@@@
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


//Error 프로토콜을 따르는 열거형타입을 선언해본다면
enum fileTransferError7: Error{
  case noConnection7
  case lowBandWidth7
  case fileNotFound7
}        

//메서드나 함수가 '에러를 발생시킬 수(던질수throw)'있다는 선언은
func transferFile7() throws{
}                     //-->이 함수는 error possible 뜻

// (+cf.)결과반환하는 메서드/함수의 경우에는 thorows위치가 앞으로 오니 기억!
//func transferFile7() throws -> Bool{
// }

//그리고 그렇게 던진 메서드/함수는 'guard _ else' 와 'throw' 가 받아준다
//(@@ 참고로 함수에선 'throws', 그걸 guard로 받을때는 'throw' 
//.                                헷갈릴 수 있으니 스펠링 조심하자)
//이제 직접 상기의 것들을 적용하여 '고의적에러'를 발생시켜보면
//우선 적용을 위해 몇가지 '상수'값들을 선언해보자

//---------------------------------------------------------

let noConnectionOK = true
let noConnectionSpeed = 30.00
let fileFound = false

enum fileTransferError: Error{   
  case noConnection
  case lowBandWidth
  case fileNotFound          //그리고 error포-콜 따르는 enum
}  

func transferFile() throws{
  
    guard noConnectionOK else{
      throw fileTransferError.noConnection
    }                                   //true이기에 error(X) 다음(guard)으로넘어감
    guard noConnectionSpeed > 30 else{
      throw fileTransferError.lowBandWidth
    }                                   //false이기에  error
    guard fileFound else{
      throw fileTransferError.fileNotFound
      }                                 //false이기에  error

}

//---------------------------------------------------------

//매서드나 함수가 ------> 에러를 던지도록(=오류상황을 알려주도록) 'throws'를 이용하여 선언했는가?
//그럼 이것들을 호출하려면 어떻게 해야하나??? 일반적 방법으로는(x)

try transferFile()  

//위와같은 형태로해야 호출 가능하다
//쉽게 기억하려면......... try -> 도전 -> 확률적으로 실패할가능성이 있음 -->대비책세워야함
//그리고 'try구문'이외에도 던져진 에러들을 잡아 처리하는 또다른 호출법이 있다

func sendFile() -> String{
   do{
      try fileTransfer()
   } catch fileTransferError.noConnection{
       return "NO NETWORK CONNECTION"
   } catch fileTransferError.lowBandWidth{
       return "FILE TRANSFER TOO SLOW"
   } catch fileTransferError.fileNotFound{
       return "FILE NOT FOUND"
   } catch {
       return "unknown error"       //새로추가한 알수없는 에러와
   } 
     return "Succeful Transfer"     //모두다 에러가없을시나오는 리턴
}

print("\(sendFile())")            //-->"FILE TRANSFER TOO SLOW"
                                //    "FILE NOT FOUND" 출력됨


// 마치 'if ~else if ~else if' 처럼
//      'do ~ try ~ (catch - return) ~ return' 형태에 익숙해지자
//          <do 문이 try catch return return>을 감싸주는 형태...


//---------------------------------------------------------

//추천하는 사용법은 아니지만 일단 알아는 두길 원하는 부분
에러 캐칭 비활성하는 방법 ---------> < try + ! >

try! transferFile()

//transfer() "아무리 실행해도 절대 error가 안날거야 
//그러니 do - catch, do - catch그냥 넘어가렴 친구야~~~”이런 개념이다
//물론, 느낌표를 안쓰고 하려면 굉장히 길~~~어질수 있는데… 그래도 어쩔수없다
//그게 개발자의 숙명이다…라는게 강사님의 전언이며,
//힘들더라도 정석으로 걸어가기를...추천한다는 강사님

//---------------------------------------------------------


//어떤경우엔 '제어권을 반환'하기전에 그사이 텀에 특정 별도의 작업을 
//수행하야만 하는게 더 효율적일때가 있다.
//ex) 원본사진 ----> 업로드중 error (임시파일은 어디로?) ---> 인스타업로드실패
//      이럴경우 업로드되다가 중단되고 남은 임시파일은 삭제고 필요
//               즉, '사태수습'이 필요한데 이럴때 필요한것이 'defer'이다

func sendFile() -> String{
  defer{
    removeTempFiles()
    closeConnection()
  }

   do{
      try fileTransfer()
   } catch fileTransferError.noConnection{
       return "NO NETWORK CONNECTION"
   } catch fileTransferError.lowBandWidth{
       return "FILE TRANSFER TOO SLOW"
   } catch fileTransferError.fileNotFound{
       return "FILE NOT FOUND"
   } catch {
       return "unknown error"       //새로추가한 알수없는 에러와
   } 
     return "Succeful Transfer"     //모두다 에러가없을시나오는 리턴
}


//즉 'defer'를 이용함으로서 반환직전에 실행되어야하는 코드를 지정해준것이고
// 이로인해 매서드가 어떠한 반환을 하던간에 제어권을 반환하기 직전에는
//반드시 removeTempFiles & closeConnection 2개의 매서드가 항상 호출됨


//---------------------------------------------------------
//총평 : 
(**강사님왈 ‘함수 안에서는 최대한 모든 오류 상황을 
   throw로 알려줄 수 있어야한다는 의견 )
(**오류가 발생할 수있는 함수를, 사용하는쪽에서는 모든 오류 대응을 못하더라도
    최대한 많은 대응 가능하도록 해줄 필요가 있다)/



//--------------------------------------------------------------
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
   4 교시 내용
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//--------------------------------------------------------------


//swift 의 타입은 세가지의 기본그룹
//구조체    열거형     클래스
//앞에 2개는 (value type), 뒤에 1개는 (reference type)


//--------------------------------------------------------------

<< 정수(integer)와 부동소수점(floating-point)변환 >>

//만약에 'Int 타입인 정수' + 'Double 타입인 부동소수점'
//서로다른 숫자타입을 더해(+)줘야만 한다면???
// -------> 변환을 '명시적'으로 나타내야만 한다
let three = 3
let pointOneTwoThree = 0.123
let pi = Double(three) + pointOneTwoThree
print(pi)                     // 3.123 출력된다

//이걸을 '변환' 이라한다
//사실 해당 기능은 다른 언어들에서는 자동적으로 처리해주지만...
//우리 깐깐깐깐한 swift씨는 그렇지 않다
//그런데 만약 위에 예제는 정수 -> 소수였지만
//                   소수 ->정수일경우 반올림? 반내림?
// 둘다 아니다. 정답은 : '버림'
// 4.58 ---> 4,   -3.9 ---> -3
let integerPi = Int(pi)
print(integerPi)              //3.123(x) ,3(o)           


//---------------------------------------------------------------
//---------------------------------------------------------------

<<문자열 - 연산자 이용한 '문자열결합'>> 
let hello: String = "Hello"
let park: String = "Park"
let greeting: String = hello + " " + park + " ! "
print(greeting)             //Hello Park !    출력
                      //Hello(공백)Park(공백)!(공백)
//그러나 이것 이외에도 많은 방법들이 있으니 다양히 고려혀면되고,
//강사님의 경우엔
print("\(hello) \(park) !")                    
//이와같이 한다

//---------------------------------------------------------------

<<문자열 - 글자의 '대/소문자'를 연산자등호(==)로 식별>>
var isSameString: Bool = false
isSameString = hello == "Hello"
print(isSameString)         //true
isSameString = hello == "hello"
print(isSameString)         //false

//---------------------------------------------------------------

<<문자열 - 메서드를 통한 '접두/접미어'확인>>
// hasPrefix <------> hasSuffix
//문자열 전체를 검토하기보다 앞부분만 빨리빨리 검토하고 넘어가야 할때
//은근 자주사용 되는 매서드이다

let hello: String = "Hello"
let park: String = "Park"
var hasPrefix: Bool = false
hasPrefix = hello.hasPrefix("He")
print(hasPrefix)                      //같음 ---> true
hasPrefix = hello;hasPrefix("HE") 
print(hasPrefix)                      //다름 ---> false

//---------------------------------------------------------------

<<문자열 - 프로퍼티isEmpty를 이용한 '빈문자열'확인>>
//참고로 공백(space)도 하나의 문자이다 ""과 " "는 다르다

var isEmptyString: Bool = false
greeting = "HAHAHAHA"
isEmptyString = greeting.isEmepty
print(isEmptyString)                //false
greeting = ""
isEmptyString = greeting.isEmepty
print(isEmptyString)                //true 

//---------------------------------------------------------------

<<문자열 - 프로퍼티count를 이용한 '문자열길이'확인>>
print(greeting.count)          // 0 (isEmpty -> count=0)
greeting = "안녕하세요"
print(greeting.count)           //5
greeting = "안녕 ! "             //5


추가사항 
//1) nil은 빈문자(X)
//2)만약 이러한 기능들이 업으면....? 앞자리글자 따로구하고 함수, if, while , ...



//--------------------------------------------------------------
//---------------------------------------------------------------
      5~6 교시 내용 
//---------------------------------------------------------------
//--------------------------------------------------------------

 << 집합 Set >>
// 순서와 상관없이 같으타입의 다른 값을 저장가능함
//.... 즉, ( 순서x & 중복x )
//순서가 없기에 index로 요소를 불러와 사용하긴 힘들다

var letters = Set<Characher>()
//의미하는바는? 캐릭터charachter인데 set의 형태로 저장할거야 라는 의미
var favoriteGenres: Set<String> = ["Ballad", "Rock", "K-POP"]
// array배열과의 차이는? 순서x,중복x

//---------------------------------------------------------------

<<집합 - '아이템 갯수' count프로퍼티로 찾기>>

var favoriteGenres: Set<String> = ["Ballad", "Rock", "K-POP"]
print("I like \(favoriteGenres.count)genres of music")   //카운트(count)는 3이출력된다
//좀더 응용해서 '카운트(count)'를 이용해 isEmpty프로퍼티를 사용해보면
if favoriteGenres.isEmpty{
  print("I have No favorite musice genre")
} else{
  print("I have favorite music genre")
}
//또, 응용하면 'insert프로퍼티'를 호출해 항목추가
favoriteGenres.insert("Jazz")

//---------------------------------------------------------------

//계속이어서 가보자면
/<<'remove 메서드'를 사용해 항목제거를 가능>>

//해당집합set에 아이템이 있을경우 삭제하거나 값을 반환하고 없으면 'nil'을 반환
var favoriteGenres2: Set<String> = ["Ballad", "Rock", "K-POP"]
if let removeGenre = favoriteGenres2.remove("Rock") {
      print("I dont like \(removeGenre)")
}   else{
      print("Nothing")
}
                          // 출력 ---> i don't lik Rock anymore!
                          //즉, 성공했으면 -------->ROCK
                          //만약 실패했으면 nil --->else
  print(favoriteGenres2) // 출력 ---> "K-POP", "Ballad"


//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// if let에 대한 다시 상기!!!
 if let myName = name {
    print("\(myName)")
}   else("nil입니다")     //-->myName이 name이면 name으로 출력하고
                        //그렇지않으면 nil~ 을 출력하라
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 
//---------------------------------------------------------------

<< 'contain 메서드'를 이용해 집합내 특정아이템 유뮤 판별 >>
if favoriteGenres2.contains("Funk"){
  print("I like new thing")
} else{
  print(" what that genre")
}               //출력---> what that genre            

//---------------------------------------------------------------
//---------------------------------------------------------------

<<'집합반복iterating Over Set>>

//for-in루프를 이용한다!!
/* 그러나..... Set 타입은 한가지 문제가있다. 바로 순서가 (X)
그렇기에 '집합요소를 연산자를 사용해정렬을 행하는 sorted()'라는 메서드활용 */

for genre in favoriteGenres.sorted(){
    print("\(genre)")
}

//---------------------------------------------------------------

<<집합 연산 수행 Performing Set Operations>>

/*
1) 연산자 ==  두 집합이 같은 값을 포함했나?확인시 사용
2) isSubset(of:)   3)isSuperset(of:)
4) isStrictSubset(of:) 4)isStrictSperset(of:)
5) isDisjoint(with:)        */

let girlIdol: Set = ["newjeans","ive"]
let allIdol: Set = ["bts","txt","newjeans","ive"]
let newIdol: Set = ["ab","cd","ef"]

girlIdol.isSubset(of: allIdol)          //true
allIdol.isSuperset(of: girlIdol)        //true
allIdol.isDisjoint(with: newIdol)       //true --->교집합이 없으면 true


//---------------------------------------------------------------------------------
//---------------------------------------------------------------------------------


<< 열거형 enum >>
//간단하게말해서 열거형은 '값들의 집합'으로 이루어진 Type
//파이에대해 설명하는 열거형type을 코딩하면
enum PieType {
    case Apple
    case Cherry
    case Peanut             //Apple,Cherry,Peanut 값
}                               //단,set처럼 중복은(x)

let favoritePie = PieType.Apple
//QnA. 그러면 favoritePie의 type은?? PieType 이 되는셈이다
//                  let favoritePie: PieType = PieType.Apple
                                            //  (타입)   (값)

//이러한 열거형은 각각의 값들을 매칭하기에 좋은 switch문과 잘 어루린다
/*왜???? switch ----> 1)switch문은 모든 case를 포함해야함
                      2)각각의 값은 명시적이든 or default: case거나 반드시 처리해야함
                      3)C언어와달린 case들이 다른 case로 빠지지않고 일치되면 바로 실행. 끝 */
let name: String
switch favoritePie {
    case .Apple:            //--->type을 알기에 그냥 이름만 써도됨(점만찍은 상황)
        name = "Apple"
    case .Cherry:
        name = "Cherry"
    case .Peanut:
        name = "Peanut"
}
  
//---------------------------------------------------------------------------------

/*좀더 응용해 본다면
enum은 case에 연관된 rawValue를 가질수있다 
일단 코드예제를 작성해보면 */
enum PieType {
    case Apple = 0      //rawValuef를 0으로 지정해두면 그다움값들은 알아서 값 갖는다
    case Cherry         //-->1        
    case Peanut         //-->2     
}                           //**rawValue 와 index 는 다르다!!!
                        //여기까지는 이해했는데 그 아래부터는 헷갈림
let pieRawValue =  PieType.Peanut.rawValue      
if let PieType = PieType(rawValue: pieRawValue)

/* 일단 위의 코드들을 완전히 이해하기 위해서는 'if let'에대해 다시한번 짚어보자*/

//-------        -----------         ---------        ---------      ----------------
//-------        -----------         ---------        ---------      ----------------
//-------        -----------         ---------        ---------      ----------------
Optional Binding?  옵셔널에의해 래핑된값을 강제로 언래핑하면---> error발생
                   그래서 이를 안전하게 벗기기위한 방법을 옵셔널바인딩이라한다
                   
1) guard let : '''nil이 아닐떄만 관심을 갖겠어''' ,                   
                에러인경우와 아닌경우를 나눠서 처리하기위해 사용됨
                
func twice(price: Int?) {
    guard let price = price else { return }     //조건이 true가 아닐때 else를 실행
    print(2 * price)                            //else안에는 return,throw등이 들어감
}                                               //옵셔널바인딩시에는 함수의 매개변수와 동등한 이름의 변수를 만들 수 있음
                                                    //----> func twice(price: Int?) {
                                                     //  func twice(price: Int?) {    ----------------> 첫째줄 price = 둘째줄 2번째 price     
                                                     //     guard let price = price else { return }
                                                     //.    print(2 * price)  }             ---------> 둘째줄 1번쨰 price = 셋째줄 price

즉, guard let 은 에러처리를 먼저한후 에러가있으면 코드 중지시킴



2) if let : ''' nil 일때도 nil이 아닐때도 과님을 갖겠어''' ,
             nil이면 요렇게 처리하고, 아니면 또 그결과에따라 처리하고
             다시말해 옵셔널의 결과에 따라 각각 피드백을 주고싶다는 강한 의지
             
func twice(price: Int?) {
    if let price = price {
        print(2 * price)
    } else {
        print("price 없음")
    }
}             

//-------        -----------         ---------        ---------      ----------------
//-------        -----------         ---------        ---------      ----------------
다시 윗부분으로 돌아가서 
//열거형 enum -case의 rawValue 설명을보면
/* 1) 타입이 명시된 enum을 가지고 rawValue를 사용하여
      pieType의 인스턴스를 요청할 수 있다
   2) 그리고 위의 값을 enum타입을 초기화 할 수 있다
      이것은 enum의 실제 case에 상응하는 원시값이 없을 수 
      있기 때문에 옵셔널을 반환한다
   3)  따라서... 이 경우가 옵셔널 바인딩의 좋은 예다 */
// 다시 이 글을 읽었을떈 확실히 이해했기를 바라며 주석을 남겨둔다

                                                             ~my ppt 41page

//---------------------------------------------------------------------------------
//---------------------------------------------------------------------------------
    7 교시 
//---------------------------------------------------------------------------------
//---------------------------------------------------------------------------------

<< 프로퍼티 관찰자 property observers>>

/* 프로퍼티관찰자? 프로퍼티의 값이 변경되는지 관찰하고 응답
                   프로퍼티의 현재값에 새로운 값과 같더라도 프로퍼티의 값이 설정될땐 호출됨
                    
                    사용처 ?
                        - 정의한 저장된 프로퍼티
                        - 상속한 저장된 프로퍼티
                        - 상속한 계산된 프로퍼티 (get , set)                 */
    이러한 프로퍼티 관찰자를 정의하는 방법은 2 가지 선택사항을 가지거나 둘다도 가능
    1) willSet : ''' 값이 저장되기 직전에 호출''' 
                 //willset 관찰자를 구현할경우 상수파라미터로 새로운 값이 전달된다
                 //willset 구현의 일부로 이 파라미터에 특정 이름 가질수 있다
                 //파라미터명내에 소괄호를 작성하지 않을경우 파라미터는 << 'newValue' >>의 기본 파라미터명으로 만들어진다
    2) didSet : '''  새로운 값이 지정되자마자 호출'''
                 //유사하게 didset 관찰자를 구현시 예전 프로퍼티 갑을 포함한 상수파라미터가 전돨됨
                 //파라미터명을 사용하거나 oldValue의 기본 파라미터 명을 사용할 수 있다
                 //did 관찰자내의 프로퍼티에 값을 할당시 새로운 값으로 방금 설정한 값을 대체함
     /* will get/ did get은 없다.. 왜냐하면 가져온걸 전달만 할뿐이지 변화가 있는건아니기 때문이다  */
     
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}     
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// willset -----> 200, didset -----> 200
stepCounter.totalSteps = 360
// willset -----> 360, didset -----> 160
stepCounter.totalSteps = 896
// willset -----> 896, didset -----> 536 = (896-360) 
                                          //(( 직전의 totalstep(=WillSet값)값인 360이 oldvalue이다 ))

**지금 이 개념들을 get~ set~ 과 헷갈리면 (X)
'VAR TOTALSTEPS: INT = 0'
을 보면 알수 있듯이 연산프로퍼티(X), 저장프로퍼티(O)


//---------------------------------------------------------------------------------
//---------------------------------------------------------------------------------

<< 제너릭 Generic >>

/* 제너릭코드(Genericode)는? 
   - 제너럴[ General 단어에서 유래
   - 정의한 요구사항에 따라 모든타입에서 동작할수 있는
     유연하고 재사용도 가능한 함수와 타입을 작성할 수 있다
   - 중복을 피하고 명확하고 추상적인 방식으로 의도표현가능
   - d우리가 지금까지 알게모르게 많이 써왔음 이걸 (Array, Dictionar 둘다 제너릭 콜렉션)
        - (** 신문기사보면 김모씨, 이모씨, A군, B씨…의 가상의 인물이 있는데 그런개념)
        - (**매번 int에대한 sum나오고 , float에대한 ~, double에대한~, ….번거로움)
        - (***여러개의 함수로 만들어야 될것을 하나로 퉁쳐서 만들수 있게함).    */

즉, 정리하자면 -----> "어떤 타입이든 받아서 처리하는 보.편.함.수"

[ QnA?   Generic  vs  Any  ]
/* any는 뭐가들어오든지 ok
generic은 뭐가들어오든 ok 그리고 내가 처리해줄게 yes sir
또한,
any는 타입의 이름
generic은 맥가이퍼knife(어떤 타입이건간에 일단 들어오기만하면 오류안나게 내가 해결해볼래~) */

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b 
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), anotherInt is now \(anotherInt)") //-> 출력 ~107, ~360이

//위의 코드들을 설명해보자면
/* 위에선 아직 generic은사용 되지않았다
위함수의 목적은 a 와 b의 값을 서로 바꿔서 a는 b가 되고 b는 a가되고..
이 함수는 in-out파라미터를 사용하여 서로의 변수Int값을 바꾼다

유용하다면 유용할 수도 있지만 '문제'는 Int값만 사용이 가능하다
만약 2개의 String 2개의 Doutble값을 바꾸길원한다면 그만큼의 더많은 함수생성이 필요하다
이런식으로말이다 swapTwoInts(_: _:), swapDoubles(_: _:),  swapTwoStrings(_: _:) ~~~~
이럴땐 어차피 함수들의 body는 동일하기에 
모든타입의 2개의 값을 바꾸는 '하나의 함수'로 작성하면 간편하다
여기에서 사용되는게 */ -----> 제너릭generic 코드

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b 
    b = temporaryA
}                       //나는 제너릭 함수이다. '의의 type' 그냥 T라고 쿨하게 부를게
                        //근데 왜 T ? .... 그냥 관습적으로 쓰인다고함
                        //a,b 모두 같은타입인 T에 속해진다
                        // '꺽쇠T'를통해 이 함수는 임의이 타입이름이라고 swift에게 명한다 
                        [ 원리?? T로 사용한 타입은 함수에 전달괸 값의 타입으로부터 '유추' ]


//기타 QnA? 
// in-out Int ---> call by reference

                                                                   ~my ppt 51page

//---------------------------------------------------------------------------------

<< 제너릭 함수 generic Functions 추가 설명>>

(**만약에 처음에 코드짤때 앞으로 들어올진 모르겠지만 아마도 이것저것
들어올것 같은데??? 그런후 바로 generic을 아래 처럼 짜는게아니다...
우선 처음에 짯던 것처럼 짠 후에 필요할경우 generic으로 바꾸면된다

(**즉, generic제너릭이 처음부터 생각해야만하는 만능칼이고 
    무조건 먼저 필요해 이런게 아니라... 
	비유하자면 과일깎을때 '만능kinfe'가아닌 '과도'를 우선 사용하는것처럼)
    (추가적으로 타입이 필요할떄 ‘확장형’으로 만드는게 제너릭generic이다)

 ((이렇게 확장하는 식으로 코드 짠다고 한다))

/* cf)
Any는 일종의 타입중 하나이고
generic의 <T> 는어떤 타입으로든 이용가능한 상태인 함수이다 */


//---------------------------------------------------------------------------------

var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)        //-->swapTwoInts가 swapTwoValues가 됨

var someString = "hi"
var anotherString = "hello"
swapTwoValues(&someInt, &anotherInt)

//위의 코드에서 알 수 있듯이
// 제너릭함수는 애래쪽의 변수들에 할당된 타입에 따라
//              위쪽의 제너릭함수들의 타입이 추론된다

//---------------------------------------------------------------------------------

<< 타입 파라미터 이름 짓기??? >>

일반적으로는 타입파라미터와 제너릭타입간의 관계를 이용하는데
예를들어 --->//  Dictionary<Key, Value>
             //  Array<Element>       
                                    이와같은 경우엔선 T가 가아닌                
                                    설명이 포함된 이름을 사용했다

그러나 의미없는 관계가 없을때는??
위의 코드에서 처럼 T,K,R,U,V등 '단일문자'를 사용하여 지정하는것이 일반적




//---------------------------------------------------------------------------------
//---------------------------------------------------------------------------------
        8 ~ 9 교시                          my ppt 56page ~ .
//---------------------------------------------------------------------------------
//---------------------------------------------------------------------------------

<< 프로토콜 지향 프로그래밍 >>

/* swift는 클래스가아닌 프로토콜 지향언어이다 
   "swift is a Protocol-Oriented Programming Language" */
   
// 클래스 calss --> 내가 누구의 속성을 물려받았는가? ---> 나의 정의 ---> 객체지향
// 프로토콜     ---> 내가 무엇을 하는 존재인가? ---> 프로토콜지향  
   
//사람과 원숭이가 채택하는 프로토콜을 만들어본다면
protocol Talkable {
    var topic: String { get set }
    func talk(to: self)
}

struct Person: Talkable {
    var topic: String
    var name: String
    
    func talk(to: Person) {
        print("\(topic)에대해 \(to.name)에게 이야기합니다")
    }
}

struct Monkey: Talkable {
    var topic: String
    
    func talk(to: Monkey) {
        print("우끼기끼끼 \(topic)")
    }
}

//위의 코드들을 줄이기 위해선 
/// 중복되는 메서드 함수 구현은 ' extension으로'미리 구현해줄 수 있다
protocol Talkable {
    var topic: String { get set }
    func talk(to: self)
}

extension Talkable {
    func talk(to: Self) {
        print("\(to) 라고하는 \(topic)")
    }
}
 
struct Person: Talkable {
    var topic: String
    var name:  String
}
struct Monkey: Talkable {
    var topic: String
}

let roco = person(topic: "swift", name: "roco")

roco.talk(to: rome)
//이렇게 하나의 프로토콜을 만들어두고 , 초기구현을 해둔다면
//여러타입에서 해당기능을 사용원할때마다 프로토콜을 채택하기만하면된다
//그런데 마약에 초기구현된 ㅍ로토콜이외의 동작을 원한다면???
//그냥 추가 재정의 해주면된다 ((( override (X) )))
                                //-->왜?? 함수개념이 아니기에 override는 아니다

//---------------------------------------------------------------------------------
protocol Flyable { func fly() }         //1번 프로토콜 . fly함수 구현

extension Flyable {                             //fly함수에 기능추가
    func fly() {
        print("파닥파닥")
    }
}

protocol Runable { func run() }          //2번 프로토콜 

extension Runable {
    func run() {
        print("쌩에에엥~")
    }
}

Protocol Talkable { func talk() }        //3번 프로토콜 

extension talk {
    func talk() {
        print("나랏말씀이듕극에달아")
    }
}


sturct Bird: Flyable, Runable { }
let bird = Bird()
bird.fly()
bird.run()

sturct Person: Runable, Talkable { }
let persion = Person()
person.run()
person.talk()


//------------------------------------------------------------------------------------------------------------------------------------------------------------------

<< 다시비교하는 객체지향 vs 프로토콜지향 >>

객체지향 : class사용, 상속으로 계층화, override로 메서드 추가/대체, 하나의객체는 단일상속만가능,
           reference type, 메모리공유로 적은메모리할당(공유경제)(그렇기에..의도치않은 갱신을 막기위한 lock기능 필요)
           멀티스레드/프로세스에 약점
           
프로토콜지향 : struc.t & enumm사용, 동일속성부여, extension으로 동일메서드구현, 하나의 객체에 여러 프로토콜 부여가능           
               value type, 매번복제로 많은 메모리사용(지연복제로 이를 극복, 요즘 시대가 발점함에따라 메모리용량 확보많이됨)
               멀티스레드/프로세스에 강점
               
//참고 cf(아직 잘이해안되는부분이지만 일단 적어두겠음)
//프로토콜과클래스는 다르며 클래스였으면 youngman : run, swi, talk,..., energetic
//지연복제? 복사하는 타이밍을조절하는 게으른lazy 복사기술, a=b로 일단 겉으로만 표시해두고
//          만약 a내용이 수정되면 삐리릭 하고 그때가서야 작업처리

**우리가 활용할 객체가 class기반인지 , sturct기반인지 반드시 참고하고 사용할 필요가있다**

[ 프로토콜에서 하는건 메서드를 구현을 하는게 아니라 요청하는것이고 
그걸 받아서 struct에서 메서드가있으면 구현하고 혹은
extension에 있으면 그걸 가져오고 그것도아니면 
그냥 struct에서 새로메서드를 추가하면됨 ]

//------------------------------------------------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------------------------------------------------------                                                                            
                                                                    my ppt ~ 88page

//---------------------------------------------------------------------------------
//---------------------------------------------------------------------------------


(추가자료)
//주말 swift 보충특강에서 나온 프로토콜 관련 예시코드 아래내용

// protocol을 따르는 객체라면 이런 거는 해줘야...
protocol Walkable {
    var shoes: String {get set}
    func walk()
    func breath()
}

protocol Talkable {
    
}

protocol Flyable {
    
}

// 중복되는 메서드 함수 구현은 extension으로 미리 구현해줄 수 있다
//원래는 이거 고양이 맨아래 짜르르 붙어있었음
extension Walkable {
    func breath() {
        print("숨쉬는 중")
    }
}

// 사람은 걸을 수 있으니까 Walkable 프로토콜을 따르게 하자
struct Person: Walkable, Talkable {
    var name: String = "홍길동"
    var shoes: String = "고무신"
    
    func walk() {
        print("\(name)이 \(shoes)를/을 신고 걷고 있습니다.")
    }
}

var ned = Person()
ned.name = "ned"
ned.shoes = "나이키 에어조던 한정판"
ned.walk()
ned.breath()

struct Cat: Walkable, Flyable {
    var stewardName: String = "고길동"
    var shoes: String = "맨발"
    
    func walk() {
        print("고양이 님께서 집사 \(stewardName)와 함께 \(shoes)을/를 신고 걷고 계십니다.")
    }
}

var myCat = Cat()
myCat.stewardName = "슈렉"
myCat.shoes = "장화"
myCat.walk()
myCat.breath()



//---------------------------------------------------------------------------------




