## 1. 서비스 이름 및 간단한 소개 📱 
### To.0 (가제)
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
## 6. 아요 팀원들의 사진 📸
### Before 😎
|![KakaoTalk_Photo_2024-05-18-22-06-46](https://github.com/SOPKATHON-iOS-TEAM3/Sopkathon-iOS/assets/87434861/fb4b54b9-0499-456e-8c70-894c78b884ca)|![KakaoTalk_Photo_2024-05-18-22-06-51](https://github.com/SOPKATHON-iOS-TEAM3/Sopkathon-iOS/assets/87434861/2fa4cd81-faac-4c68-85bf-2857ed7240a0)|
|--|--|

### After
