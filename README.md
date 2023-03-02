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


## ⛏ 개발환경 | Development Environment 
![221910999-1b9fd5cf-dabc-4f05-9e66-85879e885c27](https://user-images.githubusercontent.com/110010716/222426179-6a1773d5-4f7a-4c19-84bf-8b65642b0511.png)
  <br>
  <br>



## 🔑 ERD | <a href="https://github.com/Jungsuah/FINAL_PROJECT_/commit/cab7900d3ec3eb9f63628e5c87a3c2c8c1fe9203">(ERD)</a>

![FINAL_PROJECT_ERD_2](https://user-images.githubusercontent.com/110010716/222177620-fa0d8639-bb1e-4620-9322-914fc3e1aedc.png)

<br>


## 🎨 기능 구현
<br>
들어가기에 앞서 모든 <b>mapper</b> 확인은 👉 <a href="https://github.com/Jungsuah/FINAL_PROJECT_/tree/master/FINAL_PROJECT_TOGETHER_SPRING/src/main/resources/mappers">Here</a>
<br>
<br>


### <a href="https://github.com/Jungsuah/FINAL_PROJECT_/blob/master/FINAL_PROJECT_TOGETHER_SPRING/src/main/java/com/kh/tour/tour/controller/TourController.java">1. 메인페이지 기능 소개</a>
<br>

![main1](https://user-images.githubusercontent.com/110010716/222428592-a015eee9-89d6-4968-9cc5-a6a209b1f702.gif)
<br>
#### 👉 관광정보 검색 버튼으로 키워드 검색 가능 
#### 👉 각 항목별 더보기 버튼 클릭 시 해당 항목별 메인페이지로 이동
<br>

![main3](https://user-images.githubusercontent.com/110010716/222429251-ddde74b6-a73f-43d3-8321-7c30accb79be.gif)
<br>

![main2](https://user-images.githubusercontent.com/110010716/222429196-a24dd4b5-b6fe-4a4d-b4a9-aee4fec8fd22.gif)
#### 👉 나만의 여행코스를 통해 회원들이 직접 만든 코스 소개
#### 👉 핫플레이스 목록은 회원의 좋아요를 많이 받은 관광지 및 음식점 기반 추천
<br>
<br>
<br>
<br>


### <a href="https://github.com/Jungsuah/FINAL_PROJECT_/blob/master/FINAL_PROJECT_TOGETHER_SPRING/src/main/java/com/kh/tour/tour/controller/TourController.java">2. 관광지 검색 기능 소개</a>
<br>

![search1](https://user-images.githubusercontent.com/110010716/222434343-216e201e-d52b-4cb1-a21f-beb882e38db1.gif)
<br>
#### 👉 상단 메뉴를 통한 관광 검색 페이지 이동 시 전체 관광지 및 부대시설 조회 가능 <a href="https://github.com/Jungsuah/FINAL_PROJECT_/blob/master/FINAL_PROJECT_TOGETHER_SPRING/src/main/java/com/kh/tour/tour/controller/TourController.java">(URL)</a>
#### 👉 한 페이지 당 9개의 관광 정보 페이징 처리 
#### 👉 조회된 항목 클릭 시 상세 페이지로 이동<a href="https://github.com/Jungsuah/FINAL_PROJECT_/blob/master/FINAL_PROJECT_TOGETHER_SPRING/src/main/webapp/WEB-INF/views/tour/infoDetail.jsp">(URL)</a>
<br>

![search2](https://user-images.githubusercontent.com/110010716/222434339-b377cff2-d00b-4ad7-8edd-bd8425efb0a6.gif)
<br>
#### 👉 검색된 항목 (이미지, 이름, 위치, 요약정보, 회원들이 남긴 별점) 확인 가능
#### 👉 검색 조건 (6중 검색 가능) - 동적 쿼리로 조건에 따라 쿼리가 변경 <a href="https://github.com/Jungsuah/FINAL_PROJECT_/blob/master/FINAL_PROJECT_TOGETHER_SPRING/src/main/resources/mappers/tour_total/tour_total-mapper.xml"> | 검색 쿼리문 </a>
- 키워드 : 검색 항목에 포함된 문자 있으면 조회 (선택)
- 날짜 : 달력으로 원하는 날짜 범위 지정 (미선택 or 단일 선택 가능)
- 지역 : 여러 지역 중복 선택 가능 (미선택 or 중복 선택 가능)
- 여행 타입 : 8가지 항목 중 해당되는 문화재로 조회 (미선택 or 단일 선택 가능)
- 대분류 : 7가지 항목 중 해당되는 문화재로 조회 (미선택 or 단일 선택 가능)
- 소분류 : 선택한 대분류에 따라 소분류 항목이 바뀜
<br>
<br>


### <a href="https://github.com/Jungsuah/FINAL_PROJECT_/blob/master/FINAL_PROJECT_TOGETHER_SPRING/src/main/java/com/kh/tour/tour/controller/TourController.java">3. 지역별 행사 검색 기능 소개</a>
<br>

![festival1](https://user-images.githubusercontent.com/110010716/222436474-9ddaf47e-c40b-4ef2-af07-e96e787e9803.gif)
<br>
#### 👉 검색 조건 (3중 검색 가능)  <a href="https://github.com/Jungsuah/FINAL_PROJECT_/blob/master/FINAL_PROJECT_TOGETHER_SPRING/src/main/resources/mappers/tour_total/tour_total-mapper.xml"> | 검색 SQL문 </a>
- 키워드 : 검색 항목에 포함된 문자 있으면 조회 (미선택 or 단일 선택 가능)
- 월별 : 원하는 월별 지정 (미선택 or 단일 선택 가능)
- 지역 : 여러 지역 중복 선택 가능 (미선택 or 중복 선택 가능)
#### 👉 행사 클릭시 행사 상세페이지로 이동



![festival2](https://user-images.githubusercontent.com/110010716/222437318-1da847a6-4807-4a80-b14e-fc943edd2a30.gif)
<br>
#### 👉 로그인 한 회원일 경우 하트 버튼으로 찜하기 가능 <a href="https://github.com/Jungsuah/FINAL_PROJECT_/blob/master/FINAL_PROJECT_TOGETHER_SPRING/src/main/java/com/kh/tour/tour/controller/TourController.java">(URL)</a>
#### 👉 슬라이드 형식으로 즐겨찾기 목록 확인 가능
<br>
<br>
<br>



### <a href="https://github.com/Jungsuah/FINAL_PROJECT_/blob/master/FINAL_PROJECT_TOGETHER_SPRING/src/main/java/com/kh/tour/tour/controller/TourController.java">4. 달력 행사 검색 기능 소개</a>
<br>

![calendar1](https://user-images.githubusercontent.com/110010716/222437417-c2fcc785-999e-44f0-bb1d-edda81c4ecec.gif)
<br>
#### 👉 달력 클릭시 진행되는 행사 조회 가능 
- 자바스크립트를 이용하여 행사 데이터를 달력에 보여줄수 있도록 구현<a href="https://github.com/Jungsuah/FINAL_PROJECT_/blob/master/FINAL_PROJECT_TOGETHER_SPRING/src/main/webapp/resources/vendor/calendar.jsp/js/bootstrap-calendar.min.js">(URL)</a>
#### 👉 행사 클릭시 행사 상세페이지로 이동
<br>
<br>
<br>





### <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/heritageInfo/controller/HeritageDetailServlet.java">5. 관광 상세 페이지</a>
<br>

![detail1](https://user-images.githubusercontent.com/110010716/222152309-80dc4c3a-cc25-44df-93cc-9e5354d39517.gif)
<br>
#### 👉 상세 정보, 이미지, 지도 확인
<br>


![detail2](https://user-images.githubusercontent.com/110010716/222152309-80dc4c3a-cc25-44df-93cc-9e5354d39517.gif)
<br>
#### 👉 하단에서 추천 관광 코스 확인
#### 👉 더보기를 통해 추천코스 상세페이지로 이동
<br>
<br>
<br>
  
![detail3](https://user-images.githubusercontent.com/110010716/222152296-49c6b9fc-bde7-45aa-9259-2c56921c6c7b.gif)
<br>
  
#### 👉 코스담기 클릭시 코스 생성 가능 
- 모달를 이용하여 새로운 코스 이름 설정 
- 생긴 코스에 항목 담아주기
#### 👉 생성된 코스는 나만의 여행코스와 마이페이지에서 조회 가능
<br>
<br>

![detail4](https://user-images.githubusercontent.com/110010716/222152150-10fcb8b0-ef1f-46e8-a9e2-918af5880b41.gif)
<br>

#### 👉 하단에서 리뷰 및 별점 부여 기능<a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/heritageInfo/controller/HertiageReviewWriteServlet.java"> (URL)</a>
#### 👉 회원들이 남긴 별점의 평점은 검색시 같이 확인 가능<br><br>
<br>
<br>
<br>

### <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/event/controller/FestivalServlet.java">6. 여행 갤러리 기능</a>

![gallery1](https://user-images.githubusercontent.com/110010716/222153814-187e68b2-dde8-429e-9318-184549e881d7.gif)
<br>
#### 👉 회원들이 사진 파일 업로드 가능 <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/event/dao/FestivalDao.java">(URL)</a>
<br>

![gallery2](https://user-images.githubusercontent.com/110010716/222153814-187e68b2-dde8-429e-9318-184549e881d7.gif)
<br>
#### 👉 하트 클릭시 빨간색(찜하기 유무)이 사라지지 않도록 ajax로 구현
<br>
<br>
<br>


### <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/event/controller/FestivalServlet.java">7. 여행 지도 기능</a>

![map1](https://user-images.githubusercontent.com/110010716/222153814-187e68b2-dde8-429e-9318-184549e881d7.gif)
<br>
#### 👉 투게더 자체 추천 코스는 여행코스, 회원들이 직접 만든 여행코스는 나의 여행에서
#### 👉 좌표가 점선으로 연결된 형태로 조회 
#### 👉 좌표 클릭시 상세페이지로 이동가능
<br>
<br>
<br>



### <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/event/controller/FestivalServlet.java">8. 나만의 여행코스 기능 </a>

![mycourse1](https://user-images.githubusercontent.com/110010716/222153814-187e68b2-dde8-429e-9318-184549e881d7.gif)
<br>
#### 👉 회원들이 직접 만든 여행코스는 일정, 테마별로 검색 가능
<br>

![mycourse1](https://user-images.githubusercontent.com/110010716/222153814-187e68b2-dde8-429e-9318-184549e881d7.gif)
<br>
#### 👉 상세페이지에서 코스정보와 원본 이미지 조회
<br>

![mycourse2](https://user-images.githubusercontent.com/110010716/222153814-187e68b2-dde8-429e-9318-184549e881d7.gif)
<br>
#### 👉 회원들의 만든 코스에 리뷰와 별점을 부여해 만족도 수치 확인
<br>
<br>
<br>


