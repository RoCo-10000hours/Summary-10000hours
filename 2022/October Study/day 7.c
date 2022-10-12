#import <Foundation/Foundation.h>


//-------------------------------------------------------------
//-------------------------------------------------------------
                 10.7(금)  / 4주차 (금요일)
                                     my ppt(10월-첫째주) 165 ~ 199page 
/                     1 ~ 3교시 
//-------------------------------------------------------------
//-------------------------------------------------------------
 <<Objective-C 둘러보는 시간 (2) >>
 
 함수Functions
 /*옵젝c에서 함수란 무엇을의미할까?
 - 작업을함께 수행하는 명령문그룹
 - 모든 Objective-C에서는 main()이라는 하나의 C함수가 존재
        (그리고 코드를 별도의 기능으로 나눌 수 있다)
- 함수선언은 컴파일러에게 함수의 이름,변환유형,매개변수를 전달해줌        
- Objective-C에서는 함수를 '메서드'라고 부름
- 프로그램에서 호출할 수 있는 많은 기본 메서드를제공
        (ex-다른 문자열을 추가하려면 appendString()메서드를 사용)
- 이러한 메서드는 =함수=서브루틴=프로시저 ... 다양하게 불리움 */

메서드의 정의 Defining a Method
//일반적으로 아래와 같은 형식을 지님
//(참고로 -마이너스는 클래스메서드를 의미)
-(return.type)method_name:(argumentType1)argumentName1   
joiningArgument2:(argumentType2)argumentName2...
joiningArgument:(argumentType)argumentName{
    body of the function
}


/스위프트 vs 오브젝트c
1) 
func myMethod(name: String, age: Int) 
    -> Void
myInstance.myMethod(name: "park", age: 13)


-(void)myMethodWithName:(NSString*)name (int)age
[myInstance myMethodWithName:@"park", age: 13]

