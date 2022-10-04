import Foundation


//당일 10.4(화) 복습


//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//1~3교시 분량
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

//오늘 배운것은 에러를 대처하는 '에러핸들링error handling'
//오류에는 여러 종류가있음
// 문법이 틀리거나 or 작동중(run time)오류거나 or "논리적오류"
//어떤 불가사의한 이용자가 터치버튼을 연속 1만번 작정하고 누름
//그리고 그걸로 error가 뜸.. 누구잘못??
//이용자? 개발자? --------------> 개발자의 잘못이다..억울하지만..
//이러한 통제할 수 없는 상황에 대비하는게 오늘 주제임
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//(***개발자의 연봉이 높은건… 다 이유가 있다… 책임을 많이 져야하기에…)
// (****그리고 그정도의 high level의 연봉을 받고싶다 ?
// 		————> 에러 핸들링 숙련도에 따라 달렸다
// ——>이는 지식정도의 문제가아니라, 쌓여있는 경험이 필요하다는 강사님의말.. 
//        실무에 들어가서 겪었을때.. 맞아봐야 당해봐야 알수있는 경험들… 
//        경력직,cto들의 연봉이 높은이유가 이거임… 오히려지식은 당신들이
// 	더 빨리 더 유연히 습득할것이다 그런데 위와같은 대처능력이 차이날뿐…)
// ((**그렇기때문에 앞으로의 커리큘럼과정에서 내가 만드는 코딩도 하겠지만,
// 남의 코딩,다른조들의 코딩들을 회고 & 피드백 & 리뷰 & 수정하는
// 시간에 적잖은 시간들이 할애될 것이다 ))
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

//swift에서 에러error를 처리하는 과정은 단순하다
// ios앱이 메서드내에서 원치않는 결과 발생 --> 에러(스로잉throwing)
//      --> 매서드가 던진(throwing)에러를 잡아서 처리
//( 그러나 앞으로는 표현의 오해를 막고자 '던진'이라는 표현보다는, 
//         '에러를 던진경우' === '에러 상황발생할 경우'로 표현하자)


//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//@@@ '의도적오류'가 발생할 수 있도록 상황을 미리 설정하는게 Point @@@@@
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
//에러 캐칭 비활성하는 방법 ---------> < try + ! >

try! transferFile()

//transfer() 아무리 실행해도 절대 error가 안날거야 그러니 do - catch, do - catch그냥 넘어가렴 친구야~~~”이런 개념이다
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



//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//4 ~ 교시 분량
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
