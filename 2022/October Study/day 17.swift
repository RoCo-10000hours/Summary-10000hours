import Foundation


//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

Optional Binding(옵셔널 바인딩) 비교
 [ if let ] VS [ guard let ]

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


func printName() {
    var value: String?
    value = "jake"
    print(value)        //optional ("jake")
    if let name =  value {
        print(name)      // "jake"
    }
}

// if let 을 통한 옵셔널 바인딩시...해당 상수(name)
//의 경우에는  ///해당 if 블럭 안에서만 상수를 사용할 수 있다.

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


func buyFood(with money: Int?) {        //<---여기서 int는 매개변수이다
    guard let moneyInPocket = money, moneyInPocket > 5000 else {
        print("난 주머니에 돈이 없소")
        return
    }
    print("빵 살 돈 정도는 있소")
}


/* 우선, 매개변수로 INT타입이 들어오면 옵셔널인지 guard구문이 확인을 해준다
 guared구문은 예가 5000을 넘는지 빠르게 체크하고
 guard구문의 boold값에 트루일 경우 함수가 출력되고,
 그렇지 못하고
 1) nil 값일 경우..
 2) 5000 보다 작을경우..
 else조건을 출력한다. */

// [ guard구문 ] 의 특성 2가지 (1) bool값을 가지며 true일경우에만 넘어가고 그렇지못하면 else로..
//                         (2) else, 제어반환문(break, continue, return, throw 필수 동반
//                                   ------>'제어를 넘~겨주거나 반~환해주는 keyword 
//                         (3) 위의예시처럼 ,(콤마)를 통해 추가로 조건나열 입력가능
//                                    ------>물론, 여기서도 추가조건은 bool타입이어야함
//// 만~약에... 제어를 넘길 함수나 return 값이 없는 경우에는??
//                                ----> fatalError(_:file:line:)를 호출 필요.
 
 
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

//그렇다면  [ if let ] VS [ guard let ] 둘의 차이점은???
바인딩 된 상수 값을 guard 구문 실행 코드 아래부터 함수 내부의 지역상수 처럼 사용이 가능하다
    //쉽게 설명하면??
    // guard let ----> 해당 블럭 박에서도 '지역상수name'을 사용가능
guard let name = value else {
    return
}
print(name)
}
//이처럼 블럭 밖으로 나온 지역상수name

이다음내용은 내일이나, 주말에 추가 보충(의외로 내용이 깊음)
(source==> https://velog.io/@minni/if-VS-guard)
