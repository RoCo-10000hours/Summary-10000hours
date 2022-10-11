
#import <Foundation/Foundation.h>

//----------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------
        5주차
        (10월2째주)(TUe)
                    Objective-C (3회차 강의)
                                        my ppt 1 ~ 33page
//----------------------------------------------------------------------------------------------

 << 구조체 struct >>

swift -> Struct ->객체,타입 -> 인스턴스
obj-c -> struct(소문자) -> 타입(x)
//obj-c에서는 배열을 사용할 경우 ---> 같은종류의 여러데이터항복 보유할 변수유형을 정의가능
//obj-c에서 구조체struct를 사용할 경우---> 다른 종류의 데이터항목을 결함할 수 있는 사용자정의 데이터 변수유형을

1) 정의
- sturct문 사용해야함
- 이런 struct문은 프로그램에 대해 둘 이상의 멤버가 있는 새데이터 유형을 정의함
//형식은 아래와같음
struct [structure tag] {
    member definition;
    member definition;
    ....
} [one or more structure variables];
-일단,,, 구조체태크 부분은 선택사항임
//book 구조를 선언하는방법은 아래와같음
struct Books {
    NSString "title",
    NSString "author",
    NSString "subject"
    int book_id;
} book;

//----------------------------------------------------------------------------------------------

2) 구조체 멤버 접근 (accessing structure members)
-멤버? swift로 따지면 '인자'같은..?
-이러한 멤버에 엑세스하려면? ---> . 을 사용한다
                                //(엑세스연산자)
- .의 사용위치는?---> 구조변수(Books)이름고 구조멤버사이(title,author,..)                                
int main(){
    struct Books Book1;    //type Books의 Book1이란 선언
    struct Books Book2;
}

Book1.title = @"object-c";   
Book1.author = @"ned";
Book1.subject = @"tutorial";
Book1.book_id = 64952

NSLog(@"Book 1 title : %@\n", Book1.title);
NSLog(@"Book 1 author : %@\n", Book1.author);
NSLog(@"Book 1 book_id : %d@\n", Book1.book_id);
                            //----> Book1 title : object-c ~ ~ 출력됨

//----------------------------------------------------------------------------------------------

3) 함수의 인수로서의 구조체 (structures as function arguments)
//다른 변수나 포인터를 전달할 때와 유사한 방식으로 구조체를 함수 인수로 잔당가능



//----------------------------------------------------------------------------------------------

4) 구조체에 대한 포인터(pointers)
//형식은?
struct Books *struct_pointer;
//이제 위의 포인터 벼수에 -----> 구조체 벼수의 주소를 저장가능
//그리고 그 구조 변수의 주소를 찾으려면 아래의 형식이 필요
struct_pointer = &Book1;    //--->구조이름앞에 &연산자
//이 구조에 대한 포인터를 사용하여 멤버에 엑세스하려면 아래의 형식 필요
struct_pointer->title;

//----------------------------------------------------------------------------------------------

5) 비트필드(Bit Fields)
//사용시 구조에서 데이터를 '패킹'저장가능
//변수뒤에 ' :bit length  '를 넣어 사용하는 형식
// 메모리나 데이터저장이 중요할 떄 특히 유용함
struct packed_sturct {
    unsigned int f1:1;          //1비트 플래그
    unsigned int f2:1;
    unsigned int type:4;        //4빝트
} pack;
                    


//----------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------
 
 << 전처리기 preprocessors >>
- #define : 정의된 내용으 대체를 하는 전처리기 '매크로'
- #include : 다른파일의 특정헤더를 삽입
- #undef
- #ifdef
- #ifndef
- #if

#define MINIMUM_ARRAY_LENGTH 30
            ---->OCPP에 MINIMUM_ARRAY_LENGTH의 인스턴스를 30으로바꾸도록 지시함
            --->이를 통해 가독성도 높아짐
#import <Foundation/Foundation.h>
            ---->OCPP에게 Foundation Framwork에서 Foundation.h를 가져와서
                 현재 소스파일에 텍스트를 추가하도록 지시

//----------------------------------------------------------------------------------------------

1)전처리기 연산자operators
-문자열화(#) 
  //이 연산자는 지정된 인수 또는 매개변수 목록이 있는 메크로에서만 사용할 수 있음
-매개변수화된 매크로로 더 간단하게 코드 재작성가능
int square(int x) {
    return x*x;
}
//------> 위의 코드를 아래로 재작성가능
#define square(x) ((x)*(x))

-매크로에 인수가 이미 있다면? ---> #define지시문을 사용하여 정의해야함
   //인수목록은 괄호로 묶여있고, 매크로 이름 바로뒤에 와야함
   //매크로 이름과 여는 괄호사이에는 공백허용(x)

//----------------------------------------------------------------------------------------------

2)미리 정의된 매크로

- _DATE_ : mmm dd yyy형식의 문자리터럴
- _TIME_
- _FILE_
- _LINE_
- _STDC_


//----------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------
  
  << typedef >>
  
// typedef라는 키워드를 사용하여 ----> 유형에 새이름을 지정
typedef unsigned char BYTE;   //1바이트숫자에대해 BYTE라는 용어를 정의한 상황
//----> 위의 유형정의 후에 식별자인 BYTE를 unsigned char유형의 약어로 사용가능
BYTE b1, b2;
///--->아래의예제를 보면서 익혀보기를

[[code recipe]]
/*
struct Books {
    NSString *title;
    NSString *author;
    NSString *subject;
    int bookId;
};

typedef struct Books BOOK;
 
이렇게 나눠서 쓸 걸 한번에 쓰자면...
*/
typedef struct Books {
    NSString *title;
    NSString *author;
    NSString *subject;
    int bookId;
} BOOK;

@interface SampleClass : NSObject
- (void)updateBookInfoTitle:(BOOK)books;
- (void)printBookInfo:(BOOK)books;

- (void)updateBookTitle:(BOOK *)book;
- (void)descriptionBookInfo:(BOOK *)book;
@end

@implementation SampleClass

- (void)updateBookInfoTitle:(BOOK)books {
    books.title = @"Hello World";
}

- (void)printBookInfo:(BOOK)books {
    NSLog(@"%@", books.title);
    NSLog(@"%@", books.author);
    NSLog(@"%@", books.subject);
    NSLog(@"%d", books.bookId);
}

- (void)updateBookTitle:(BOOK *)books {
    books->title = @"Hello Objective-C";
}

- (void)descriptionBookInfo:(BOOK *)books {
    NSLog(@"%@", books->title);
    NSLog(@"%@", books->author);
    NSLog(@"%@", books->subject);
    NSLog(@"%d", books->bookId);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BOOK book1;
        
        book1.title = @"C언어 프로그래밍";
        book1.author = @"데니스 리치";
        book1.subject = @"C언어 학습 공식도서";
        book1.bookId = 1234567;
        
        SampleClass *sampleClass = [[SampleClass alloc] init];
        
        // 값으로 복제시킬 매개변수 - call by value
        [sampleClass updateBookInfoTitle:book1];
        [sampleClass printBookInfo:book1];
        
        // 포인터 참조값으로 알려주고 직접 건드리게 할 매개변수 - call by reference
        [sampleClass updateBookTitle:&book1];
        [sampleClass descriptionBookInfo:&book1];
    }
    return 0;
}


//----------------------------------------------------------------------------------------------

<< typedef  VS  #define >>
- #define은 데이터 유형에 대한 별칭을 정의하는데 사용됨
- typedef는 유형에만 기호이름을 부여하도록 제한됨
- 반면에 #define은 1을 ONE으로 정의할 수 있는 것처럼 값의 별칭을 정의하는데에도 사용가능
- typedef 해석은 #define 문이 전처리기에 의해 처리되는 컴파일러에 의해 수행됨
 
   // 상기와 같은 대안들이 있기에 #define이 덜쓰이는 것처럼
   // 실제로 define은 위험도가 높아서 덜 쓰인다고 하심 강사님도
   

//----------------------------------------------------------------------------------------------

<< typedef와 구조체 >>

//구조체는 한번 선언해놓고 ---> 자주반복하여 사용 
//   ---> 그렇기에 구조체 타입을 typedef로 만들어 사용하는것이 일반적



//----------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------

<< 타입캐스팅 type casting >>

- 한 데이터 유형에서 다른 데이터유형으로 변수를 변환하는 방법
//에를들자면 긴 값을 간단한 정수에 저장? ---> '' long to int ''를 입력
//아래처럼 캐스트 연산자를 사용하여 명시적으로 값을 한 유형에서 다른유형으로 반환가능
(type,name)expression

- CGFloat : 32비트의 경우 float기본유형에서 파생된 부동 소수점 연산을
            수행하기 위해 CGFloat을 사용하고 ... 
            64비트의 경우에는 double을 사용한다 ...
//-----> 캐스트 연산자가 하나의 정수 변수를 다른 정수 변수로 나누는것이
//        부동 소수점 연산으로 수행되는 예시를 아래에 쓰면...
int main() {
    int sum = 17, count = 6;
    CGFloat mean;
    
    mean = (CGFloat) sum / count;
    NSLog(@"value of mean : %f\n", mean );
    
    return 0;   
}                                       //value of mean : 3.400000 출력됨

/* 추가설명으로 ... 위에서 캐스트 연산자가 나눗셈보다 우선하므로 sum값은 먼저
   double유형으로 반횐됨 ----> 그리고 마지막으로 count로 나누어 double값을 생성
  
  유형 변환은 컴파일러에 의해 자동으로 수행되는'암시적' or 캐스트를 사용한 '명시적'  */
  

//----------------------------------------------------------------------------------------------

<< 정수로 끌어올리기 integer promotion >>

//정수 승격은 int.. 또는 unsigned int보다"작은" 정수 유형의 값이 int또는 unsigned int로 변환되는 프로세스




                                                            my ppt  ~ 15page
//-----------------------------------------------------------------------------------------------

<<일반적인 산술 변환>>

//해당값을 공통유형으로 캐스팅하기 위해 암시적으로 수행
/* 
int -> unsigned int -> long ->  unsigned long -> unsigned long long 
  -> float -> double -> long double         */
- 컴파일러는 먼저 정수승격을 수행
- 피연산자의 유형이 여전히 다르다? 그러면 다음계층의 가장 높은 유형으로 변환<<일반적인 산술 변환>>


//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

<<로그 Log>>

1) NSLog 메서드
int main() {
    NSLog(@"Hello, world\n")
    return 0;
}
// LOG는 swift의 print같은 단순한 출력이 아니다
// swift의 'dump'와 좀 더 밀접하다
// 특정앱의 특정상태를 보여주는.... 출력이라기보다 '기록'


2)라이브 앱에서 로그 비활성화(Disabling logs in Live apps)
// 앱에서 사용하는 NSLog때문에 디바이스의 로그에 출력되고, 라이브빌드에서 로그를 인쇄하는것은 비추천
// 따라서 로그를 인쇄하기위해선 유형정의를 아래와같이 수행
#if DEBUG == 0
#define DebugLog(...)
#elif DEBUG = -1
#define DebugLog(...) NSLog(_VA ARGS_)
#endif

int main(){
    DebugLog(@"Debug log out custom");
    NSLog(@"NSLog gets printed always");
    return 0;
}   


//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

<<오류처리 error handling>>

// NSerror는 오류코드 또는 오류문자열만 사용하여, 가능한 것보다 더 풍부하고 확장가능한 '오류정보를 캡슐화'
// Foundation프레임워크에서 사용가능한 NSError클래스가 제공됨

1) NSerror      

~18page.





