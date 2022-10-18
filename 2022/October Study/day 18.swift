
//--------------------------------------------------------------
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
        6주차 (화요일)
                  SwiftUI 인터페이스 및 커스텀view
                                        
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//--------------------------------------------------------------

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


//오른쪽에 있는 핸드폰이 프리뷰 부분이다
//Text("Hello, Ro-Co!") 다른 개발도구들은 바로 적용이 안됨
//컴퓨터가 너무 느릴떈 일단은 canvas좀 꺼놔도 된다고함..
//(실제로 예전 맥북은 느려서 그런식으로 하셨다는 강사님)
//.font(.largeTitle) <<--- 숫자로안한이유가 다있음
//애플의 가이드라인중하나.. 숫자로 하면 그거로만 고정되지만
// 저렇게하면 앱-환결성정-손쉬운사용에서 글시크기 키우면 그대로 키울수 있음

//VStack은 위아래로 길게는 10개까지 밖에 안됨
//List로 바궈야된 더 하려면. (그러나 아직은 안 배울예정)(심화)

Vstack ----> vertical
Hstack ----> horizontal

//  ContentView() 2개하고싶다? Group으로 묶음
// 사용자들의 환경설정이 워낙 다양하기에 그룹으로 묶어서
// 컨버스를 2개로 만드는거임

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
/처음 본 코드들

 그루핑(grouping)-----> 여러디바이스 타입에서 동시에 미리보기가 가능
 Group {
 ContentView()
    .previewDevice(PreviewDevice(rawValue: "iphone X"))
    .previewDisplayName("iPHONE x")
 
    .previewDevice(PreviewDevice(rawValue: "iphone 14"))
    .previewDisplayName("iPHONE 14")
 

//커스텀뷰 관련 코드들 복습

/*
 일반적으로는 Body 1개에 단하나의 뷰(text등등..)를 return함...
 그러나 VStack, Hstack, 폼(form)등을 사용하면 여러개의 뷰 배치가능
 (참고로 '스택안에 스택'넣는것도가능하다. 여러게층의 뷰가 생성가능함)
 */

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
 .font(.~)[
 .foregroundColor(.red)
 .padding()
 .border(color.blue, width: 0.2)
 .shadow(color: color.black, radius: 5, x:0, y:5)
 .background(color.white)
 
 .modifier(StandardTitle())
 
 Image(systemName:"~") <----Body프로퍼티에 포함되어있는 컴포넌트
        .resizable()
        .aspectRatio(contentMode: .fit) // fill도 있음 
 //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
 modifier 수정자 (일괄수정적용)
 struct StandardTitle: ViewModifier {
    //   func <#name#>(<#parameters#>) -> <#return type#> {   이렇게 나오면 이대로해주면됨
    //       <#function body#>
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .background(color.white)
    }
}
 
 이렇게 작성이 끝나면 필요한곳으로 이동해서
 Text("Text 1")
    .modifier(StandardTitle())    이런식으로 사용하면된다
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ





























//네임 view

import SwiftUI

struct NamesView: View {
    var body: some View {
        VStack {
            Text("↘️상호")
                .modifier(StandardName())
//                .font(.body)
                .padding()
            Text("↘️정우")
                .modifier(StandardName())
//                .font(.body)
 //              .padding()
            Text("↘️태영")
                .modifier(StandardName())
//                .font(.body)
//              .padding()
            Text("➡️예린")
                .modifier(StandardName())
//                .font(.body)
 //            .padding()
            Text("➡️다영")
                .modifier(StandardName())
//                .font(.body)
//               .padding()
            Text("➡️시현")
                .modifier(StandardName())
//                .font(.body)
//              .padding()
            Text("↗️광현")
                .modifier(StandardName())
//                .font(.body)
   //            .padding()
            Text("↗️두영")
                .modifier(StandardName())
//                .font(.body)
               .padding()
            
        }
//          .font(.body)      //여기서 한번에 가능
//          .fontWeight(.black)
//          .foregroundColor(Color.black)
        .border(Color.black)
        .background(Color.yellow)
    }
}



struct StandardName: ViewModifier {         //구조체 하나 생성 .프로토콜을 하나 따르게할건데 viewModifier에 따르는걸로
    func body(content: Content) -> some View {  //엔터치고 func body치니깐 그냥 viewModifier관련 모양을 보여주는 엑스코드
         content
            .font(.body)
            .fontWeight(.black)
            .foregroundColor(Color.black)
            .padding()
            .border(Color.blue)
    }                                               //위에서 만들걸 가져오고(content)그걸 다시 맨위루고사 '접붙이기'
        //그리고 &*#^* 리턴값없다?? 리턴을 해줄view가 이미 content에서 ..끝..
        //그래서 다른곳들에서도 return갑이 없는것
                                                    //@@@@@@@@@@@@@
                                                    //이내용이 p.179
}


struct NamesView_Previews: PreviewProvider {
    static var previews: some View {
        NamesView()
    }
}

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

// 콘텐츠view

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            TitleView()
            NamesView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
        }
 }


//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
  
    // 타이틀 View

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "figure.archery")
                .resizable() //크기를 정해주는 부분이지만 보통 ()만 단순히 하지는 않는다고한다
                .aspectRatio(contentMode: .fit) // fill로 할 경우 화면 꽉 채운다
                .foregroundColor(.red) //이미지의 색상변경가능하나 조건들이있으니 SF에서 확인하기
            Text("Team👉👉3")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(Color(hue: 0.787, saturation: 0.657, brightness: 0.969))
//                .font(.custom)
                .padding()
                .accentColor(.pink)
                .hoverEffect(.highlight)
            Text("Swift UI 실습")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(Color.black)
                .padding()
                .border(Color.blue)
                .padding()
                .border(Color.blue)
                //.shadow(color: Color.red, radius: 5, x:0, y:5)
            
            
            //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//            HStack(alignment: .leading) {
            HStack{
                Image(systemName: "figure.archery")
                Image(systemName: "figure.archery")
                Image(systemName: "figure.archery")
                Image(systemName: "figure.archery")
                    VStack{
                        Image(systemName: "figure.archery")
                        Image(systemName: "figure.archery")
                        Image(systemName: "figure.archery")
                    }
                    VStack{
                        Image(systemName: "figure.archery")
                        Image(systemName: "figure.archery")
                    }
                Image(systemName: "figure.archery")
            }
            
        }
    }

    struct TitleView_Previews: PreviewProvider {
        static var previews: some View {
            TitleView()
        }
    }
}