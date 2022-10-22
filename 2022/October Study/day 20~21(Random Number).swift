 
//
//  Created by Ro-Co on 2022/10/20.
//
//-------------------------------------------------------------------------------
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
        6주차 (목요일)
                  SwiftUI [랜덤으로 뽑힌 숫자 만들기]
                                                    실습project
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//-------------------------------------------------------------------------------
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

day 20 ~ 21(Random Number)


import SwiftUI
//1)
//view 프로토콜을 따르는 contentView 구조체를 선언한다
struct ContentView: View {
    
    /// /2)
    // body라는 연산 프로퍼티 변수는 'View 프로토콜'. .. 을 따른다
    // some은 당장 생각하지 말자. 그냥 그런거다
    
    ////  6)
    //바인딩될 데이터는 무조건 'State'라는 프로퍼티래퍼를 쓰고
    //내부에서만 호출되도록 'private'라고 걸어준다
    //내용이 바뀌니 당연히 let아닌 'var'
    //그리고
    //초기값("")정해주기
    @State private var myText: String = ""
    
    
    var body: some View {
        //// 3)
        // body의 get 연산값은 지금은 VStack을 만들어
                // 반환하는 것이다.
                // set이 없이때문에 get 키워드는 생략 가능하다
        //get {             <---생략됨
        // return에 앞서 다른 수행될 코드가 없기때문에
                    // return도 생략가능하다
        //return VStack~.         <--생략
        //이런이유들로 vstack 2개가 즉, stack2개가 못들어가는이유에대한 답변
        
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
                .font(.headline)
                .fontWeight(.heavy)
            //// 4)
            //print("hello,world")---> 왜안됨? 위에서부터 쭈루룩 내려오면서
            //코드를 일지만 이부분은 하나의 덩어리로 그냥 보여주는역할
            //일종의 하나의 그림으로 인식하지 하나하나실행할 명령어로 인식(X)
            
           ////  7)
            //여기 아래의 '텍스트 필드'에서 입력되는 내용은
            //고스란히~ 실시간으로~ myText에 반영이된다
            //이것을 우리는.       -------> '바인딩' 이라한다.
            TextField("아무거나입력.placeholder기본색은 회색", text: $myText)
           ////  5)
            //참고로 이런거끌어올때 '+'누르는 방식으로 하는걸 부끄러워말길...
            //("아무거나입력")이부분이 기본값이거나 그런건 (x)--->  그저 placeholder로 아무것도 입력안되어있을떄 상시 보여주는값
            //텍스 필드를 집어넣고 help quick누르니깐 이 내용이나옴 아래쪽에
            //Topics
            //            Creating a text field with a string
            //            init(LocalizedStringKey, text: Binding<String>)
            //            Creates a text field with a text label generated from a localized title string.
            //            Available when Label is Text.
            //주목할건 'Binding'이부분.. 아예 대놓고 바인딩써야된다..라함.. ----? $ 표시 그리고 맨위로올라가서 @state로 선언해줌
            
            
            //// 8)
            //이제 $myText라고 바인딩한 곳에서 변경을 가하면
           Text(myText)
            //body가 전체적으로 새로 그려질 것이다.
            //그떄그떄 myText를 반영하게 된다.
            //즉....지금까지의 과정은--------> TextField의 text부분이----> @state의 myText와 일치되어가는 과정이다.
            //(추가실험... 만약 요기 바로위의 Text(myText)이부분을 없애면 스크린샷확인((궁금하지?@@ㅋㅋ 확인하게 될걸??))
            //즉...다시 요약한다면.... <<body안에서 변수의 값을 변경해주어야한다 했을때 @State를 붙여줘야 한다고 이해>>

        }
            
            
            
            
                .padding()
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            
        }
    }
    




//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//'아이폰용'은 딱하나의 콘텐트뷰만가능. 시작은..
//사실은 이런형태이다


//struct ContentView: View {
//    var body: some View {
//        get {
//            return VStack {
//                VStack {
//                    Text("Hello, world!")
//                        .font(.headline)
//                        .fontWeight(.heavy)
//            }
//                .padding()
//        }
//
//    }
//





//-------------------------------------------------------------------------------

import SwiftUI



///// 1)
//일단 구글에서 검색해보심 swift randomNumber 그리고... 그중에서 어 뭔가 눈에 잘들어오는 만만한거 가져오심
//

struct ContentView_2: View {
    
    ////2)
    //적용하여보면 일단 아래처럼 쓸 수 있음
//    var randomInt = Int.random(in: 0..<10)
    
    ///// 28))
  //  27)번의 이유로 위에는 비활성
    var randomInt_1 = Int.random(in: 0..<10)
    var randomInt_2 = Int.random(in: 0..<10)
    var randomInt_3 = Int.random(in: 0..<10)
    var randomInt_4 = Int.random(in: 0..<10)

    
    /// 5)
    // @State private var userInputString: String = ""
    
    //12) 11번으로 위의 코드 다시씀
    //왜??/ 공식문서 강사님이 검색해보니 double 써야된대서...??
//    @State private var userInputValue: Double = 0.0
    //26))으로인해 위에는 비활성화
    
    ////27) 그러면 당연히 랜덤숫자도 하드코딩해야겠지??
    
    
    //// 26)
//    @State private var userInputValue_1: Double = 0.0
//    @State private var userInputValue_2: Double = 0.0
//    @State private var userInputValue_3: Double = 0.0
//    @State private var userInputValue_4: Double = 0.0
//
    
    ////30))  randomInt와 userinputValue가 타입이달라서 아래처럼 바꿈
    @State private var userInputValue_1: Int = 0
    @State private var userInputValue_2: Int = 0
    @State private var userInputValue_3: Int = 0
    @State private var userInputValue_4: Int = 0
    
    
    
    
    
    ////8)
    ///여기를 결과를 보여줄 문자열을 만들어주는 연산 프로퍼티를 만들어볼까?? get이용해서??
    ////29))  번을 이유로  이 아래 코딩 전부 삭제
    ///ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    ///(결과를 보여줄 문자열을 만들어주는 연산프로퍼티... 이런식으로 꼭 주석 달기를)@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
//    var resultString: String {
//        get{
//
//            //            if String(randomInt) == userInputString {
//            //13)  12번으로인해 아래도 쫙 다바꿔줌 위에는 무효하고
//            //            if randomInt == userInputValue {
//            //14)  int값해줘야한다고 에러나옴 그래서 위에또 없애고 아래로
//            if randomInt == Int(userInputValue) {
//                return "맞습니다"
//            }
//            return"다릅니다"
//        }
//    }
   //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    ////29))
    //상기의 이유로
    //아래처럼 바꿈
    var resultCount: Int {
            get {
                var correctCount: Int = 0
                
                if randomInt_1 == userInputValue_1 {
                    correctCount += 1
                }
                
                if randomInt_2 == userInputValue_2 {
                    correctCount += 1
                }
                
                if randomInt_3 == userInputValue_3 {
                    correctCount += 1
                }
                
                if randomInt_4 == userInputValue_4 {
                    correctCount += 1
                }
                
                return correctCount
            }
        }
    
    
    
    
    
    
    
    
    
    var body: some View {
        VStack {
            
            
            //// 18))
            //{-------ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ ------- 슬라이더바는 픽커이후로 지우셨기에 일단 비활성해둠
            
//            //11)
//            //이젠 슬라이더 하나 만들어볼까??
//            Slider(value: $userInputValue, in: 0...9, step: 1)
//
//
//            ////4)
//            // 텍스트필드 가져오기
////            TextField("숫자를 입력하세요", text: $userInputString)
            /// 15)당연히 위의것도 아래처럼 바꿈 ,,..근데 왜 textfield가아닌 text가 된거지?
//            Text("현재 선택은 \(Int(userInputValue))입니다")
////            ------- ---------------------- ------------------------------------------------------ ----------------   }
            
            
            //// 3),   6)  5번으로인해 이부분이 갑자기 에러가 생긴모습
            //Text("\(결과값)")
            //7)그래서 여기도 위의값으로 바꿔주면 에러안뜸
            //Text(userInputString)
            //9)
            //위의 걸 아래걸로바꿔줌 8번을 만들었으니
//            Text("\(resultString)")
            //10)여기까지하면 일단 텍스입력필드 입력마다 맞다,틀리다가 나옴
            
            
            
            
            //// 19) 참고로
            // ForEach이부분은 for구문과 같은효과
            //그리고 여기까지의 모습을 일단 스크린샷@@@@ 찍어둠
            Picker(selection: $userInputValue_1, label: Text("숫자를 선택하세요")) {
                            ForEach(0..<10, id: \.self) {
                                Text("\($0)")
                            }
                
                        }
                    ////25)
            ///휠말고다른걸로
                        //.pickerStyle(.wheel)
                        .pickerStyle(.segmented)
                    ////  23)
                      //없앴음  .padding()
            
                    ////  24)
                        //또다른건 또머없을까? 픽스타일을 바꿔보락? 하고 이것저것 눌러보시는 강사님
                        //그러면서 segmented로 바꾸셨음
            
                    //25) 그런데 여기까지 일단 얼추 디자인은 꾸며봤는데 문제가 생김...
                        // userInputValue의 모든 값들이 같이 변동됨..
                        //그래서 하신선택.. 좀 노가다이긴하지만 전부 바꿔줌1,2,3,4,로 그럴러면 당연히
                        //state도 추가해야겠지?
            
            
            
            
            
            //// 21) 자물쇠 4개모양으로 만들어 봅시다 (
            //// 22) Hstack으로 복사 붙여넣기한걸 조정한후 크기등을 조절해볼까?(h,v 스택은 개인 취향) ㅋㅋㅋ
            
            Picker(selection: $userInputValue_2, label: Text("숫자를 선택하세요")) {
                            ForEach(0..<10, id: \.self) {
                                Text("\($0)")
                            }
                
                        }
                        .pickerStyle(.wheel)
                        .padding()
            
            Picker(selection: $userInputValue_3, label: Text("숫자를 선택하세요")) {
                            ForEach(0..<10, id: \.self) {
                                Text("\($0)")
                            }
                
                        }
                        .pickerStyle(.wheel)
                        .padding()
            
            Picker(selection: $userInputValue_4, label: Text("숫자를 선택하세요")) {
                            ForEach(0..<10, id: \.self) {
                                Text("\($0)")
                            }
                
                        }
                        .pickerStyle(.wheel)
                        .padding()
            
            
            
            
            
            
            //// 20)
            Text("현재 선택은 \(userInputValue)입니다")
            
            
            
            
            //// 16)
            //15번과같은이유로 위의코드도 바꿈?? 아니 얜 그대로임
            Text("\(resultString)")
            ///왜?? 얘는 맞다 틀리다를 보여주는 부분이기떄문이고 15번쪽은 숫자를 보여주는 부분이다
            ///혹시 텍스트필드 없앤이유도 슬라이드바부분때문에 없앤건가?? 중간에 흐름살짝 놓쳤었음...
            
            /// 17) 이제 해볼건 픽커 추가해보기...... 그럴려면 일단은 슬라이드바 없애셨음.
                
        }
    }
    
    struct ContentView_2_Previews: PreviewProvider {
        static var previews: some View {
            ContentView_2()
        }
    }
    
}