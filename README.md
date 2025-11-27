# 37-COLLABORATION-iOS-MELON
>🍈 DIVE SOPT 37기 합동세미나 모바일 앱 4조 iOS 멜론말랑 🍈

##  iOS Developer
| **메론빵 소녀** | **조영서** | **김수민** | **이승준** |
| :---: | :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/980a5d5b-2472-4159-862c-e256f8ecc6ab" width="170" alt="멜론 앱 UI 스크린샷 1"> | <img src="https://github.com/user-attachments/assets/81be4c6d-705f-4796-b233-4f19948a94cc" width="170" alt="멜론 앱 UI 스크린샷 2"> | <img src="https://github.com/user-attachments/assets/5f2c0cc7-6329-4e48-973a-0f4aa35551ce" width="170" alt="멜론 앱 UI 스크린샷 3"> | <img src="https://github.com/user-attachments/assets/c1c0a6dd-0e98-4eb0-8f1b-d42c888f044a" width="170" alt="멜론 앱 UI 스크린샷 4"> |
| `Identity` | `iOS Lead`<br>`MixUp 탭` | `iOS Developer`<br>`ForYou 탭` | `iOS Developer`<br>`Home 탭` |

## 🍈 시연 영상

| **Home** | **MixUp** | **ForYou** | 
| :---: | :---: | :---: | 
| <img src="https://github.com/user-attachments/assets/97a27c26-9f7b-43fa-88a5-415b763888ac" width="300" alt="멜론 앱 UI 스크린샷 1"> | <img src="https://github.com/user-attachments/assets/5838a1e5-3896-4e98-a118-664555b17904" width="300" alt="멜론 앱 UI 스크린샷 2"> | <img src="https://github.com/user-attachments/assets/4e79959f-ef24-44c4-8d06-273d1df4c72d" width="300" alt="멜론 앱 UI 스크린샷 3"> | 

## 🛠️ Library & Stack

| 기술 | 설명 |
|-----------|------|
| **UIKit** | 안정적이고 레퍼런스가 풍부하며 실무 적합한 UI 프레임워크 |
| **MVC** | View·Controller 중심 구조로 직관적인 흐름 구성 및 소규모 프로젝트에 적합 |
| **Moya** | 추상화된 API 구성, 테스트 용이성, 요청 관리 편의 |
| **Kingfisher** | 이미지 캐싱과 네트워크 병목 방지 |
| **Git, GitHub** | 브랜치 전략 기반 협업, PR·코드리뷰 활용 |
| **Figma, Notion** | 디자인·기능 흐름 시각화 및 문서화 협업 |


## 🌱 Git Flow
<img width="600" alt="image" src="https://github.com/user-attachments/assets/a3d1dc46-77cb-4dee-97db-7114dbedf9f3" />

- 작업의 기본 브랜치는 `develop` 브랜치로 설정합니다.
- 이슈 번호에 맞는 `feature` 브랜치를 `develop`에서 분기하여 작업을 진행하고, 작업이 끝나면 PR을 `develop` 브랜치로 올립니다.

## 📣 Convention
### Branch
`태그/#이슈번호-작업하는 파일`
```
feat/#1-loginUI
```

### Tag
| 태그 | 사용 |
|-----------|------|
| `init` | 초기 커밋시 사용 |
| `feat` | 새로운 기능 구현 시 사용 |
| `fix` | 버그나 오류 해결 시 사용 |
| `docs` | README, 템플릿 등 프로젝트 내 문서 수정 시 사용 |
| `setting` | 프로젝트 관련 설정 변경 시 사용 |
| `add` | 사진 등 에셋이나 라이브러리 추가 시 사용 |
| `refactor` | 기존 코드를 리팩토링하거나 구조 개선 시 사용 |
| `chore` | 중요도가 낮은 기타 변경 작업 시 사용 |

### Commit Message
1. 태그는 반드시 **소문자**로 작성합니다.
2. 내용은 한글로 작성합니다.
3. 제목이 **50자**를 넘지 않도록, 간단하게 명령조로 작성합니다. 설명이 필요한 경우 description에 작성합니다.
```
[feat] 로그인 기능 구현
```
## 📁 Foldering
```
├── 📁 Application
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
├── 📁 Global
│   ├── 📁 Base
│   ├── 📁 Components
│   ├── 📁 Extensions
│   ├── 📁 Resource
│   │   ├── 📁 Font
│   │   └── Assets.xcassets
│   └── Info.plist
├── 📁 Network
│   ├── 📁 API
│   ├── 📁 Base
│   ├── 📁 DTO
│   └── 📁 Service
├── 📁 Presentation
│   ├── 📁 Core
│   ├── 📁 ForYou
│   ├── 📁 Home
│   └── 📁 MixUp
```

## ☄️ Trouble Shooting
