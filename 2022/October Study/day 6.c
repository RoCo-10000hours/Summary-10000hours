#import <Foundation/Foundation.h>

//-------------------------------------------------------------
//-------------------------------------------------------------
//                   10.6(목)
//                      1 ~ 4교시 
//-------------------------------------------------------------
//-------------------------------------------------------------
// <<Objective-C 둘러보는 시간>>
/* 
옵젝C에서 자주 등장하는 NS란
Next Step 줄임말....스티브잡스가 창업했던 회사이름
여튼 NS를 넣은 이유는 NSobject의 상속을 받아서
만들어 졌기 때문이다
*/

//-------------------------------------------------------------

/*내가 항상 swift할때 맨위에 적던 import Foundation
이런걸 '기초프레임워크'를 불러온다고한다
자주 사용되는 클래스등을 뭉탱이로 뭉쳐 미리 모아둔것이다
그걸 import로 불러왔던것이다 */

//-------------------------------------------------------------

//실제 코드를 보면서 설명해보면
@interface SampleClass:NSObject
- (void)sampleMethod;                //메소드를 선언하는 방법을 보여준다
@end

@implementation SampleClass           //인터페이스 SampleClass를 구현
- (void)sampleMethod {                //sampleMethod의 구현
    NSLog(@"hello, World! \n");             //출력
} 
@end

int main() {                            // 프로그램 실행시작되는 주.요.함.수
    SampleClass *sampleClass = [[SampleClass alloc]init];
    [sampleClass sampleMethod];             //sampleClass.sampleMethod() '(feat.swift버전)'
    return 0;                           //메인함수종료.0값반환
}

                                        //void--->The type void (타입무효) 
                                                 //   : 사용할 수 있는 값이 없음을 나타냄

/* 
0)interface SampleClass:NSObject ---> 인터페이스를 만드는 방법을 보여준다.
                                    모든 객체의 기본클래스인 NSObject를 상속한다  
1) - (void)sampleMethod; -----> 메소드를 선언하는 방법을 보여준다
                                (즉, 메서드의 이름을 정하는 부분)
2)   @end                ------> 인터페이스의 끝을 표시
3)   @implementation SampleClass ---->인터페이스 SampleClass를 구현하는 
                                      방법을 보여준다
4) - (void)sampleMethod { }     ------> sampleMethod의 구현을 보여준다
5)    NSLog(@"hello, World! \n")     ---> 프린트를 위해 NSLog를 찍고
6)    @end.               -------> 구현의 끝을 표시
7)   int main() { }       ----> 프로그램 실행시작되는 주.요.함.수
8)   return 0;            ------> main() 함수를 종료하고 값 0을 반환.    */

//-------------------------------------------------------------

**스위프트는 위에서부터 쭉내려오지만.. 옵젝은 그렇지않다
실제로 코드 작성할 떄도 강사님은 전처리 맨위 한다음 바로 내려와서 메인부터 함수 만드심
** @end로 묶인 기준으로 --------> 맨위 : '선언부'
                                  중간 : '구현부'
                                  
/ 추가tip____>>> [sampleClass sampleMethod]; 부분을 swift로 바꾸면?
                  sampleClass.sampleMethod() 가 된다 */
                  
//-------------------------------------------------------------

/*스위프트는 위에서부터 쭉내려오지만.. 옵젝은 그렇지않다....
이말의 이미를 다시 생각해보자면 
코딩 하셨떤 순서가 '전처리기명령' ---> 메인함수 열어주고 그안에 return 0; 만 넣고
        -=->  선언부 코딩(메서드선언)  ---> 구현부 코딩(인터페이스와 매서드 구현)
                ---> 출력코딩  -------> 그 후에 처음에 만들어둔 주요함수로와서 그곳에 
                                        샘플클래스를 가져옴....맞나??? 선언부부터인지 구현먼저인지...
                                        
 */ 일단은 큰 틀만 잡자...               
  alloc , void, 이런건 일단 제쳐두고
                    
//-------------------------------------------------------------

((목차별 간당 정리))
  -예약어(Keywords)
  
  -[ 데이터 타입 (basic, 열거, void, 파생(포인터,배열, ...)) ]
  
  -정수타입(Integer type)
    
  -타입별 차지하는 바이트크기는?
    -----> < sizoeof > 를 활용한다!!!!!
   
   int main(){
       NSLog(@"Storage size for int : %d\n", sizeof(int));
       return 0;
       
   }                 //출력값 : Storage size for int : 4
   
   -부동소수점 타입
   -void타입 1) return값이 없을때 사용됨
             2) 공백값이 나타날떄.. int rad(void)
                        ---->그러나 실제론 () 이렇게 더 많이 쓰임
                        
    -변수선언 (Variable Declaration)
    
    - extern (아직 정확한이해는 힘들지만, 다른곳에서 선언된 변수를 가져올 수 있음)                                    
    
    -상수(리터럴literal)                                   
    
    -정수리터럴 (대표적인 C언어 상수)
    
    -문자상수( \\ ---> \ , \' ---> '. \""--->""
                \n ---> 줄바꿈 , \t ---> 탭    )
                
    -문자열 리터럴(String Literal)
       *) 'h' char리터럴, "hello" 문자열리터럴, 
           @"hello" NSString 

//-------------------------------------------------------------
     
 -상수 정의하는 2가지 방법          
   1) #define 전처리기                                    
     형태--> #define identifier value.  //(identifier = 식별자)
            #define Length 10
            #define WIDTH 5    
   2) const 키워드
     형태--> const type Variable = value;
             const int Length = 10;
             const int WIDTH = 5;                          
                                        
//              그런데 상수명을...왜 다르 대문자로??
                        // 그게 국룰입니다 (in C언어계열)
 int main() {
   const int  LENGTH = 10;
   const int  WIDTH  = 5;
   const char NEWLINE = '\n';
   int area;  
   
   area = LENGTH * WIDTH;
   NSLog(@"value of area : %d", area);
   NSLog(@"%c", NEWLINE);

   return 0;
}


 //-------------------------------------------------------------
//-------------------------------------------------------------
//                   
//                      5 ~ 8 교시 
//-------------------------------------------------------------
//-------------------------------------------------------------  