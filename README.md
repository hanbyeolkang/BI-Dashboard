# BI-Dashboard

## 프로젝트 구조
```
BI-Dashboard/
├── raw_data/                       # 원본(raw) 데이터 폴더
│   ├── boxoffice/                  # 일일 박스오피스
│   └── movieInfo/                  # 영화 상세 정보
│
├── scripts/                         # ETL, 전처리, SQL 쿼리 등 모든 스크립트
│   ├── cum_perform/                 
│   ├── daily/
│   ├── etl/                         # 데이터 추출 및 적재
│   ├── jsonpaths/                   # 데이터 매핑 정의
│   └── time_series_audience_script/
│
├── superset/                        # Superset 차트 및 대시보드
│   ├── cum_perform/                 # 영화별 총 관객수, 매출액, 상영일 수, 평균 관객수 등
│   ├── daily/                       # 일일 관객수, 매출액, 랭킹
│   └── time_series_audience/        # 개봉일별/주차별 관객수 차이
│
├── .gitignore
└──  README.md
```
