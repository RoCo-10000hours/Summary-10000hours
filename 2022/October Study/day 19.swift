//
//  ContentView.swift
//  3-test
//
//  Created by Ro-Co on 2022/10/19.
//

//-------------------------------------------------------------------------------
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
        6주차 (수요일)
                  SwiftUI [스택과 프레임]
                                   < 도서명 : SwiftUI 기반의 ios 프로그래밍>
                                                (page 181 ~ 219)
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//-------------------------------------------------------------------------------
실습 result : https://github.com/RoCo-10000hours/Summary-10000hours/issues/7#issue-1415012986
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ



//자주 사용해보면서 익혀나갈 것들 [미완]

1) .onAppear(perform: {         //레이아웃 안에서 뷰가 나타나거나 사라질 때 초기화/초기화해제 작업수행위한 '인스턴스 메서드'
                    //---> 뷰가 나타났을 떄 수행되는 코드
    })

  .onDisppear(perform: {
                    //---> 뷰가 사라졌을 떄 수행되는 코드
})


2) V/HStack 등의 안에 있는 '컴포넌트'를 스택선언부에 직접넣거나하려면
    =====> 마우스드래그 + command + 클릭            //개인취향차이

3) Spacer()         // ------> 공간을 차지하긴하지만... 보이지는 않는뷰/ (대문자시작)
VStack(alignment: .center, spacing : 15) {
    ~~~~~~~
}
    ======> 위에다가 놓으면 다른것들이 아래쪽으로 쭉~ 밀리고
            아래에다가 놓으면 위로 쭉 ~밀어내고
*꿀팁
HStack으로 텍스트를 가로방향 나열할경우 중간중간 살짝 띄워져있음
왜?? 기본할당된 spacer()값이 숨어 있기떄문에 ...따라서이것을
(spacing : 0)해버리면???? 붙어버림                          // (소문자시작)
또.. 마약에 spacer()를 이 두 텍스트 사이에 넣어버리면?
양쪽으로 글자들이 서로 쭉 밀려남
|(text1)      공 백       (text2)|
사이사이에 넣어버리면?
|(text1)   공백   (text2)   공백|
위와같은 형태가 나온다

4) padding()
leading top bottom trailing 전방향에 여백을 줄 수 있는데,
파란색 네모박스에 bottom방향으로 여백을 적용시키면?
----->bottom부분만 여백으로 깍여나감

                                                    ~ 188page












//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

import SwiftUI

struct ContentView: View {
    
    var colors: [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black", "Red", "Green", "Blue"]

    @State private var colorIndex = 0
    
    @State private var rotation: Double = 0
    @State private var text: String = "Welcome to SwiftUI"
    
    var body: some View {
        VStack {
            Spacer()
            Text("Hello, World")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(self.rotation))
            //단순히 바인딩 설정이 아닌 회전에 대한 상태프로퍼티에 할당되있는 값을
            //가져오는 것이므로 프로퍼티앞에 $붙이지 x
                .animation(.easeInOut(duration: 5))
                .foregroundColor(self.colors[self.colorIndex])
            Spacer()
            
            AsyncImage(url: URL(string: "https://blckbirds.com/wp-content/uploads/2021/10/pexels-kammeran-gonzalezkeola-6128227-2.jpg"), scale: 5.0)
                //.frame(width: 3, height: 3)       //왜... 프레임으론안되고...scale론 되는건지...
            
//            AsyncImage(url: URL(string: "https://pixabay.com/ko/vectors/토끼-회색-만화-귀여운-155674/")) { image in
//                            image.resizable()
//                        } placeholder: {
//                            ProgressView()
//                        }
//                        .frame(width: 300, height: 200)       //같은조 정우님의 '클로저 방식'
            
            Divider()
            Slider(value: $rotation, in: 0 ... 360, step: 0.1)//슬라이더의 범위와 증가폭
                .padding()
            
            
            TextField("Enter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
           
            
            Picker(selection: $colorIndex, label: Text("Color")) {
                ForEach (0 ..< colornames.count) {
                    Text(self.colornames[$0])
                        .foregroundColor(self.colors[$0])
                }
            }
            .padding()
        }
        .padding()
    }
    

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AsyncImage<Content> where Content : View {
    AsyncImage(url: URL(string: ))
        .frame(width: 200, height: 200)
}


