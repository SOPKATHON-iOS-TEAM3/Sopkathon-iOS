## 1. 서비스 이름 및 간단한 소개 📱
### TO.0, Too
- 의미: Too = 함께라는 의미, 모르는 사람의 정보가 0이 되도록 돕겠다는 의미
- 간단 소개: 서로에 대한 사전 정보를 퀴즈라는 게임식 형태로, 미리 제공함으로써 첫 대화를 수월하게 도와준다.
## 2. 주요 기능 🛠️
- 친해져야 하는 사람의 숫자, 시각적으로 제공
- 본인의 정보에 대한 퀴즈 제작
- 퀴즈 제공자의 퀴즈 풀기

## 3. 팀원 역할 분담 ❤️‍🔥
| 이명진<br/>([@thingineeer](https://github.com/thingineeer)) | 박익범<br/>([@parkikbum](https://github.com/parkikbum)) | 서은수<br/>([@EunsuSeo01](https://github.com/EunsuSeo01)) | 김민서<br/>([@kms0233](https://github.com/kms0233)) |
| :---: | :---: | :---: | :---: |
| <img width="540" src="https://avatars.githubusercontent.com/thingineeer"/> | <img width="540" src="https://github.com/SOPKATHON-iOS-TEAM3/Sopkathon-iOS/assets/87434861/643377ae-620a-41a4-bbf3-5441b99038a9"/> | <img width="540" src="https://avatars.githubusercontent.com/EunsuSeo01"/> | <img width="540" src="https://avatars.githubusercontent.com/kms0233"/> |
| 홈 화면 및 초대 코드 뷰 구현 | 퀴즈 생성 및 링크 생성 뷰 구현 | 퀴즈 풀기 및 결과 뷰 구현 | 스플래시 및 온보딩 뷰 구현 |

## 4. 컨벤션 규칙과 브랜치 전략
> **Commit Message Rule**

`[Prefix] #IssueNumber - Description`

```
[Prefix]

[Feat] : 새로운 기능 구현
[Add] : 부수적인 코드 추가 및 라이브러리 추가, 새로운 파일 생성
[Chore] : 버전 코드 수정, 패키지 구조 변경, 타입 및 변수명 변경 등의 작은 작업, 파일 이름 변경
[Del] : 쓸모없는 코드나 파일 삭제
[Design] : UI 작업
[Fix] : 버그 및 오류 해결
[Refactor] : 전면 수정
[Docs] : README나 WIKI 등의 문서 개정
[Setting] : 프로젝트 세팅
[Comment] : 주석 추가, 삭제 (Only 주석)
```
- ex) [Feat] #5 - 서버 연결 구현

> **Issue Naming Rule**

`[Prefix] - Description`

- ex) [Feat] - 퀴즈 뷰 구현

> **Code Review Rule**

코드 리뷰를 최대한 빨리 달고 반영하자! (둥글둥글 말투로 해결하기)

- ex) 이거 왜 이렇게 짰어요? (X)
    해당 기능을 구현한 이유가 궁금합니다 ‼️ (O)

> **Branch Naming Rule**

`[Prefix]/#issuenumber`

- ex) [Feat]/#1

> **Git Flow**

1. 이슈 생성
2. 브랜치 생성
3. 브랜치 add, commit, push → PR 과정 거치기
4. 최소 1명 "Approve" 있어야 merge (강제 머지 금지 하면 솝트 제명 ~~bypass~~)
5. 머지 후 ( 해당 브랜치 바로 제거 )
6. pull 받아서 다음 이슈 진행

<br>

<details>
 <summary> ⭐️ Coding Convention </summary>
 <div markdown="1">       

 ---
 
### 들여쓰기 및 띄어쓰기

- 들여쓰기에는 탭(tab)
- 콜론(`:`)을 쓸 때에는 콜론의 오른쪽에만 공백을 둡니다.
    
    ```
    let names: [String: String]?
    ```
    

### 줄바꿈

- 함수를 호출하는 코드가 최대 길이를 초과하는 경우에는 **파라미터** 이름을 기준으로 줄바꿈합니다. (`control + M`)
    
    ```
    let actionSheet = UIActionSheet(
      title: "정말 계정을 삭제하실 건가요?",
      delegate: self,
      cancelButtonTitle: "취소",
      destructiveButtonTitle: "삭제해주세요"
    )
    ```
    
    함수 파라미터가 3개 이상인 경우도 이름을 기준으로 줄바꿈 합니다.
    
- `if let` 구문이 길 경우에는 줄바꿈하고 한 칸 들여씁니다.
    
    ```
    if let user = self.veryLongFunctionNameWhichReturnsOptionalUser(),
       let name = user.veryLongFunctionNameWhichReturnsOptionalName(),
      user.gender == .female {
      // ...
    }
    ```
    
- `guard let` 구문이 길 경우에는 줄바꿈하고 한 칸 들여씁니다. `else`는 `guard`와 같은 들여쓰기를 적용합니다.
    
    ```
    guard let user = self.veryLongFunctionNameWhichReturnsOptionalUser(),
          let name = user.veryLongFunctionNameWhichReturnsOptionalName(),
          user.gender == .female
    else {
      return
    }
    ```
    

### 빈 줄

- MARK 구문 위와 아래에는 공백이 필요합니다.
    
    ```
    // MARK: Layout
    
    override func layoutSubviews() {
      // doSomething()
    }
    
    // MARK: Actions
    
    override func menuButtonDidTap() {
      // doSomething()
    }
    ```
    

### 임포트

모듈 임포트는 알파벳 순으로 정렬합니다. 내장 프레임워크를 먼저 임포트하고, 빈 줄로 구분하여 서드파티 프레임워크를 임포트합니다.

import는 최소화한다. - ex. UIKit은 Foundation을 포함하고 있음

## then 으로 통일 ^^^^

```
import UIKit

import SnapKit
import Then
```

# 네이밍

### 클래스와 구조체

- 클래스와 구조체의 이름에는 UpperCamelCase를 사용합니다.
- 클래스 이름에는 접두사Prefix를 붙이지 않습니다.
    
    **좋은 예:**
    
    ```swift
    class SomeClass {
      // class definition goes here
    }
    
    struct SomeStructure {
      // structure definition goes here
    }
    ```
    
    **나쁜 예:**
    
    ```swift
    class someClass {
    // class definition goes here
    }
    
    struct someStructure {
    // structure definition goes here
    }
    ```
    

### 함수

- 함수 이름에는 lowerCamelCase를 사용합니다.
- 함수 이름 앞에는 되도록이면 `get`을 붙이지 않습니다.
- 매개변수 명은 함수명과 이어져서 이해하기 편하게
    
    **좋은 예:**
    
    ```swift
    func name(for user: User) -> String?
    ```
    
    **나쁜 예:**
    
    ```swift
    func getName(for user: User) -> String?
    ```
    

### 변수

- 변수 이름에는 lowerCamelCase를 사용합니다.

### 상수

- 상수 이름에도 lowerCamelCase를 사용합니다.
    
    **좋은 예:**
    
    ```
    let maximumNumberOfLines = 3
    ```
    
    **나쁜 예:**
    
    ```
    let MaximumNumberOfLines = 3
    let MAX_LINES = 3
    ```
    

### 열거형

- enum의 이름에는 UpperCamelCase를 사용합니다.
- enum의 각 case에는 lowerCamelCase를 사용합니다.
    
    **좋은 예:**
    
    ```
    enum Result {
      case .success
      case .failure
    }
    ```
    
    **나쁜 예:**
    
    ```
    enum Result {
      case .Success
      case .Failure
    }
    
    enum result {
      case .Success
      case .Failure
    }
    ```
    

### 프로토콜

- 프로토콜의 이름에는 UpperCamelCase를 사용합니다.
- 구조체나 클래스에서 프로토콜을 채택할 때는 콜론과 빈칸을 넣어 구분하여 명시합니다.
- extension을 통해 채택할 때도 동일하게 적용됩니다.
- 최대한 요구사항이 있는 프로토콜을 채택할 때는 extension에서 채택하고 구현합시다!
    
    **좋은 예:**
    
    ```swift
    protocol SomeProtocol {
      // protocol definition goes here
    }
    
    struct SomeStructure: SomeProtocol, AnotherProtocol {
      // structure definition goes here
    }
    
    class SomeClass: SomeSuperclass, SomeProtocol, AnotherProtocol {
        // class definition goes here
    }
    
    extension UIViewController: SomeProtocol, AnotherProtocol {
      // doSomething()
    }
    ```
    

### 약어

- 약어로 시작하는 경우 소문자로 표기하고, 그 외의 경우에는 항상 대문자로 표기합니다.
    
    **좋은 예:**
    
    ```swift
      let userID: Int?
      let html: String?
      let websiteURL: URL? URL(url: "asdasdasdasd")
      let urlString: String?
    
    ```
    
    **나쁜 예:**
    
    ```swift
      let userId: Int?
      let HTML: String?
      let websiteUrl: NSURL?
      let URLString: String?
    
    ```
    

### Delegate

- Delegate 메서드는 프로토콜명으로 네임스페이스를 구분합니다.
    
    **좋은 예:**
    
    ```swift
    protocol UserCellDelegate {
      func userCellDidSetProfileImage(_ cell: UserCell)
      func userCell(_ cell: UserCell, didTapFollowButtonWith user: User)
    }
    ```
    
    **나쁜 예:**
    
    ```swift
    protocol UserCellDelegate {
      func didSetProfileImage()
      func followPressed(user: User)
    
      // `UserCell`이라는 클래스가 존재할 경우 컴파일 에러 발생
      func UserCell(_ cell: UserCell, didTapFollowButtonWith user: User)
    }
    ```
    

## 클로저

- 파라미터와 리턴 타입이 없는 Closure 정의시에는 `() -> Void`를 사용합니다.
    
    **좋은 예:**
    
    ```swift
    let completionBlock: (**() -> Void**)?
    ```
    
    **나쁜 예:**
    
    ```swift
    let completionBlock: (() -> ())?
    let completionBlock: ((Void) -> (Void))?
    ```
    
- Closure 호출시 또다른 유일한 Closure를 마지막 파라미터로 받는 경우, 파라미터 이름을 생략합니다. (클로저가 하나인 경우에만! 두 개 이상인 경우 생략하지 말고 파라미터 이름을 명시해 줄 것.)
    
    **좋은 예:**
    
    ```swift
    UIView.animate(withDuration: 0.5) {
      // doSomething()
    }
    ```
    
    **나쁜 예:**
    
    ```swift
    UIView.animate(withDuration: 0.5, animations: { () -> Void in
      // doSomething()
    })
    ```
    

## 클래스와 구조체

- 구조체를 생성할 때에는 Swift 구조체 생성자를 사용합니다.
    
    **좋은 예:**
    
    ```swift
    let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    ```
    
    **나쁜 예:**
    
    ```swift
    let frame = CGRectMake(0, 0, 100, 100)
    ```
    

## 타입

- `Array<T>`와 `Dictionary<T: U>` 보다는 `[T]`, `[T: U]`를 사용합니다.
    
    **좋은 예:**
    
    ```swift
    var messages: [String]?
    var names: [Int: String]?
    ```
    
    **나쁜 예:**
    
    ```swift
    var messages: Array<String>?
    var names: Dictionary<Int, String>?
    ```
    

## 주석

- `///`를 사용해서 문서화에 사용되는 주석을 남깁니다.
    
    ```
    /// 사용자 프로필을 그려주는 뷰
    class ProfileView: UIView {
    
      /// 사용자 닉네임을 그려주는 라벨
      var nameLabel: UILabel!
    }
    ```
    
- `// MARK:`를 사용해서 연관된 코드를 구분짓습니다.
    
    Objective-C에서 제공하는 `#pragma mark`와 같은 기능으로, 연관된 코드와 그렇지 않은 코드를 구분할 때 사용합니다.

<br>

 </div>
 </details>

## 5. 폴더링 📁
```
├── Application
│   ├── AppDelegate.swift
│   ├── Base.lproj
│   ├── Info.plist
│   └── SceneDelegate.swift
├── Data
│   └── Dto.swift
├── Global
│   ├── Extension
│   ├── Literals
│   └── Resource
├── Network
│   ├── Base
│   └── Network.swift
└── Presentation
    ├── TabBar
    ├── ViewControllers
    └── Views
```

## 6. 시연 영상 🎥
|![Simulator Screen Recording - iPhone 13 Pro - 2024-05-19 at 08 29 11](https://github.com/SOPKATHON-iOS-TEAM3/Sopkathon-iOS/assets/87434861/df380f66-b538-4133-9ba0-3a3578067554)||
|--|--|

## 7. 아요 팀원들의 사진 📸
### Before 😎
|![KakaoTalk_Photo_2024-05-18-22-06-46](https://github.com/SOPKATHON-iOS-TEAM3/Sopkathon-iOS/assets/87434861/fb4b54b9-0499-456e-8c70-894c78b884ca)|![KakaoTalk_Photo_2024-05-18-22-06-51](https://github.com/SOPKATHON-iOS-TEAM3/Sopkathon-iOS/assets/87434861/2fa4cd81-faac-4c68-85bf-2857ed7240a0)|
|--|--|

### After 🤤
| <img width="788" alt="image" src="https://github.com/SOPKATHON-iOS-TEAM3/Sopkathon-iOS/assets/88179341/54b3facd-1354-4c00-87ba-192bef1cc03d"> |
|--|--|
