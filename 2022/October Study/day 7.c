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

                                                my ppt ~167page
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

<< 메서드 정의 (2) >>

- 1) 반환유형 : '' return_type ''은 함수가 반환하는 값의 데이터 유형,
                일부메서드등은 값을 반환하지않고도 작업을 수행하는데 이럴땐
                return_type의 키워드는 '' void ''
- 2) 메서드이름 
- 3) 인수(Argument) : 함수가 호출되면 인수에 값을 전달함. 매개변수라고도함
- 4) 결합인수(joining argument) : 호출하는 동안 읽기 쉽고 명확하게하기 위함
- 5) 메서드본문 : 메서드가 수행하는 작업을 정의하는 명령문의 모음이 포함됨

-(int) max:(int) num1 secondNumber:(int) num2 {
    int result;
    if (num1 > num2) {
        result = num1;
    } else {
        reusult = num2;
    
    }
}
    return result;
//위의 코드는 2개의 매개변수 num1,2를 사용하고 두 매개변수 사이의 최대값을 반환

//Obective-C와 Swift의 비교 @@@@
- (void)myMethodWithMynaem: (NSString *)name myAge: (int)age {
                //name활용
                ///age활용
}
[myInstance myMethodWithMynaem:@"park", myAge:20]
//ㅡㅡㅡㅡㅡㅡㅡㅡ
func myMethod(myName name: String, myAGE age: Int) {
    print("\(nmae) \(age)")
}  
myInstance.myMethod(myName: "park",myAGE: 20)
  
  

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

<< 메서드선언method declarations >>

- 컴파일러에게 함수 이름꽈 메서드를 호출하는 방법을 알려줌
// 실제 본문은 별도로 정의할 수 있다
-(return_type)function_name:(argumentType1)argumentName1
joiningArgument2:(argumentType2)argumentName2 ...
joiningArgumentn:(argumentTypen)argumentNamen;

// 한 소스파일에서 메서드를 정의하고 다르파일에서 해당 메서드 호추시 선언이 필요
    // (이 경우엔 함수를 호출하는 파일의 맨 위에 함수를 선언해야한다)
-(int) max:(int)num1 andNum2:(int)num2;

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

<< 메서드호출 calling a method >>

- 옵젝c메서드를 생성하는 동안 함수가 수행해야 하는 작업에 대한 정의를 제공함
- 메서드를 사용하려면 정의된 작업을 수행하기위해 해당함수를 호출필요
- (프로그램이 함수 호출 ---> (프로그램제어)---> 메서드로 전달(메서드호출)
          --->정의된 작업수행 --> 반환문 실행 or 함수종료중괄호도달시 
         ---> (프로그램제어) ---> 주프로그램반환 )
- 매서드를 호출하려면 매서드이름과함께 필요한 매개변수를 전달하기만하며되고
  메서드가 값을 반환하면 반환된 값을 저장가능.  
  
                                                            my ppt~ 171page

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

<< 메서드호출 calling a method(2) >>
