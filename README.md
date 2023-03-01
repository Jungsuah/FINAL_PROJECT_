# :flight_departure:[Together]🛬
파이널 프로젝트 '투게더 - 관광 종합정보포털'
<hr>

### :rocket: 실제 여행객들의 경험을 기반으로 맞춤 여행정보를 쉽고 간편하게 검색하세요!

![image](https://user-images.githubusercontent.com/110010716/222170743-4264ef29-be45-4e27-8a13-7287b9282ad3.png)



## 🧭투게더 | About Us
👉국내 여행지의 <b>정보를 한 번에 비교</b> 할 수 있고,<br>
👉맛집, 문화시설, 레포츠 등이 포함된 <b>추천 코스를 제시</b><br>
👉<b>한국관광공사 API</b>와 실제 여행객들의 경험을 기반으로<b>이용자 맞춤 여행 관련 정보를 제공</b>하여<br>
👉<b>국내 여행 환경을 개선</b>하고 <b>침체된 여행시장을 활성화</b>합니다.<br>
<br>

![image](https://user-images.githubusercontent.com/110010716/222170448-79e19e6b-bc9b-48c8-b730-2d896e6a862c.png)



### :movie_camera:구현 동영상 및 PPT | Google Drive [바로가기](https://drive.google.com/drive/folders/1RdLfbwmSQiJUSqqcsab5JzN1wkyX2W7k?usp=sharing)

<br>

## 🔭목차 | Contents
1. [개발일정](#-개발일정--project-period)
2. [아키텍쳐](#-아키텍쳐--architecture)
3. [UI 흐름도](#-UI-흐름도--UI-Flow)
4. [주요 기능](#-주요-기능--Main-Function)
5. [개발환경](#-개발환경--development-environment)
6. [ERD](#-erd--ERD)
7. [기능 구현](#-기능-구현)

<br>

## ⌚ 개발일정
- 2022.09.05 ~ 2022.09.19 프로젝트 기획
- 2022.09.20 ~ 2022.09.26 ERD 설계
- 2022.09.27 ~ 2022.10.08 UI / DB 설계
- 2022.10.05 ~ 2022.10.15 프론트 구현 / API 파싱
- 2022.10.10 ~ 2022.10.20 프로젝트 기능 구현
- 2022.10.18 ~ 2022.10.24 테스트
- 2022.10.25 ~ 2022.11.01 발표자료 작성
- 2022.11.02 프로젝트 발표

![image](https://user-images.githubusercontent.com/110010716/222173484-94bc0ea6-d714-4da9-84dd-6ffcb965cbe0.png)
<br>
<br>
<br>


## 🛠 아키텍쳐 | Architecture
![image](https://user-images.githubusercontent.com/110010716/222172798-960313ee-6f60-4267-845a-1c5bb19eae24.png)
  <br>
  <br>
  
## 🛠 UI 흐름도 | UI Flow
![image](https://user-images.githubusercontent.com/110010716/222172709-004cb3bc-cf44-4fba-b443-7678785c2bc7.png)
  <br>
  <br>

## ⚔ 주요 기능 | Main Function
### 
- 관광 정보 및 행사 | 축제 <b>검색</b> (키워드, 월별, 지역별, 여행 일자, 관광 타입, 분류체계에 따른 검색 기능)
- 관광 <b>상세 조회</b> (요약 정보, 사진 조회 / 리뷰 작성 및 찜하기/ 코스담기기능)
- <b>핫플레이스</b> (찜 개수 상위 10곳의 관광지와 음식점 추천 기능)
- <b>여행 지도</b> (테마 별 여행지도를 통한 위치 정보 조회/ 카카오 지도 API 사용)
- <b>여행 코스 만들기</b> (사용자 기반 여행코스 구성 가능)
- 커뮤니티 (게시글 검색, 작성, 수정, 삭제, 신고 기능 / 사진, 파일 업로드기능)
- <b>갤러리</b> (사용자가 업로드한 사진을 한눈에 모아보는 기능/ 찜하기 가능)
- 로그인 (일반/ 카카오 로그인 및 회원가입)
- 마이페이지 (회원 정보 수정 및 탈퇴 / 즐겨찾기 관리)
- <b>관리자 페이지</b> (전체 회원 수 확인 및 엑셀 다운/ 신고 게시글 조회 및 관리)
  <br>
  <br>

## ⛏ 개발환경 | Development Environment 
- 운영체제 : Window OS<br>
- 개발 툴 : Eclipse, Apache Tomcat 8.5, Oracle SQL Developer, Visual Studio code<br>
- 개발 언어 : Java , HTML5, CSS3, JavaScript, jQuery, SQL, JSP, Servlet, Ajax, Json, Gson<br>
- 소스 제어 관리 : GitHub<br>
- 협업 툴 : Slack, Discode, Zira<br>
- 프로토타이핑 툴 : ERD Cloud<br>
- Open API : Kakao API, 문화재청 API<br>
  <br>
  <br>
![image](https://user-images.githubusercontent.com/110010716/221635450-09d8d5d0-2c44-4e70-a215-85c744c7cdfc.png)
  <br>
  <br>




## 🔑 ERD | <a href="https://github.com/Jungsuah/SEMI_PROJECT_/commit/87cb735b2fd1da0583f5f9cf440c47543204a569">(ERD)</a>

![image](https://user-images.githubusercontent.com/110010716/221628382-92f235c4-8dee-4d9e-932e-9d8dadb979dc.png)

<br>


## :tv:기능 구현

### <a href="https://github.com/Jungsuah/SEMI_PROJECT_/tree/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/heritageInfo/controller">메인페이지 기능 소개</a>

![main1](https://user-images.githubusercontent.com/110010716/222136100-1e0ba414-90a9-41fd-a1b1-3fb6ff1df59b.gif)
<br>
#### 👉 상단 검색바에서 키워드로 검색 가능 
#### 👉 행사일정 정보 조회, 커뮤니티 글 최신순 조회, 사뿐코스, 사뿐몰 인기 상품 조회 가능

![main2](https://user-images.githubusercontent.com/110010716/222136261-1566824f-edcc-4850-849b-e135b8ef5db3.gif)
<br>
#### 👉 더보기 클릭 시 해당 기능 페이지로 이동 <br><br>
<br>
<br>


![main3](https://user-images.githubusercontent.com/110010716/222141509-708972db-ba43-4d59-b9b8-27c9b1f3ed59.gif)
<br>
#### 👉 인기 문화 명소는 회원들의 좋아요 갯수를 활용하여 기능 구현 <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/heritageInfo/dao/HeritageDao.java">(URL)</a>
#### 👉 로그인한 사용자가 좋아요를 누르면, 좋아요 개수가 자동으로 오르고,
#### 👉 상위 조회수 10곳의 문화재를 메인 페이지에서 확인 가능 <br><br>
<br>
<br>

### <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/heritageInfo/dao/HeritageDao.java">문화재 검색 기능 소개</a>
<br>

![search1](https://user-images.githubusercontent.com/110010716/222142847-14854b55-bdb2-4895-b447-879d917a0ba4.gif)
<br>

![search2](https://user-images.githubusercontent.com/110010716/222144092-ac1bf63d-92f4-4520-8a10-a76978ac36a3.gif)
<br>


#### 👉 상단 메뉴를 통한 문화재 검색 페이지 이동 시 전체 문화재 조회 
#### 👉 한 페이지 당 9개의 문화재 조회 페이징 처리 
#### 👉 검색된 항목 (대표이미지, 위치, 문화재명, 요약설명, 찜 개수) 확인 가능
#### 👉 조회된 문화재 클릭 시 상세 페이지로 이동
#### 👉 키워드와 체크박스를 활용한 5중 조건 검색 (키워드, 지역, 지정연도, 시대, 유형 분류)  <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/heritageInfo/dao/HeritageDao.java"> | 검색 SQL문 </a>
- 키워드 : 문화재 이름에 포함된 문자 있으면 조회 (선택)
- 지역 : 16가지 항목 중 하나라도 포함된 문화재면 조회 (미선택 or 중복 선택 가능)
- 지정연도 : 스크롤로 지정한 연도 범위에 포함된 문화재면 조회 (미선택 or 단일 선택 가능)
- 시대 : 17가지 항목 중 해당되는 문화재로 조회 (미선택 or 중복 선택 가능)
- 유형 분류 : 7가지 항목 중 해당되는 문화재로 조회 (미선택 or 중복 선택 가능)
- 전체 체크시 이전 선택 항목 사라지고 전체 선택으로 변경
<br>
<br>

### <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/heritageInfo/controller/HeritageDetailServlet.java">문화재 상세 기능 소개</a>
<br>

![detail1](https://user-images.githubusercontent.com/110010716/222152309-80dc4c3a-cc25-44df-93cc-9e5354d39517.gif)
<br>

#### 👉 분류, 시대, 소재지 등 문화재의 자세한 데이터를 확인
#### 👉 상단 갤러리에서 원본 크기의 문화재 이미지를 확인
<br>
<br>
<br>
  
![detail2](https://user-images.githubusercontent.com/110010716/222152296-49c6b9fc-bde7-45aa-9259-2c56921c6c7b.gif)
<br>
  
#### 👉 우측에서는 지도에 문화재 위치를 좌표로 구현 (경도와 위도 데이터 사용)
#### 👉 지도는 카카오 API를 사용하여 구현, 해당 문화재의 위치를 확인 <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/webapp/views/heritage/heritageDetail.jsp">(URL)</a>
#### 👉 하트 클릭시 해당 문화재 찜하고, 마이 페이지로 이동하여 찜목록 확인 <br><br>
<br>
<br>

![detail3](https://user-images.githubusercontent.com/110010716/222152150-10fcb8b0-ef1f-46e8-a9e2-918af5880b41.gif)

<br>

#### 👉 하단에서 리뷰 작성 기능<a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/heritageInfo/controller/HertiageReviewWriteServlet.java"> (URL)</a>
#### 👉 최근 4개의 리뷰 확인, 더보기 버튼으로 모든 리뷰를 확인 가능<br><br>
<br>
<br>
<br>

### <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/event/controller/FestivalServlet.java">월별 행사일정 페이지 기능 소개</a>

![detail1](https://user-images.githubusercontent.com/110010716/222153814-187e68b2-dde8-429e-9318-184549e881d7.gif)
<br>
#### 👉 월별 버튼을 눌러 문화 일정 확인 <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/event/dao/FestivalDao.java">(URL)</a>
<br>

![detail1](https://user-images.githubusercontent.com/110010716/222153824-d2a0ac99-e68d-4a79-9d64-344842ec9d7b.gif)
<br>

#### 👉 한 페이지 당 10개의 문화재 조회 페이징 처리 
#### 👉 url이 표기된 경우 클릭시 관련 행사 사이트로 이동
<br>
<br>
<br>


