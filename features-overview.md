# 주요 기능 & UI 둘러보기 (Features Overview)

XMat3DSolidWork는 엔지니어가 복잡한 기구 형상과 모션 관계를 가장 빠르고 직관적으로 검증할 수 있도록 설계되었습니다.

---

## 1. 모던 Fluent 리본 인터페이스 (Ribbon Tabs)

Office 제품군과 유사한 **Krypton Ribbon**을 채택하여 작업 단계별로 기능을 체계적으로 분류하였습니다.

### 1) 파일 (File) 탭
* **새로 만들기 (New)**: 작업 중인 모델을 초기화하고 새 프로젝트 시작
* **열기 (Load)**: `.m3d` XML 모델 파일 불러오기
* **저장 (Save) / 다른 이름으로 저장 (Save As)**: 스케치, 솔리드 형상, 어셈블리/파트 트리, 모션 설정 직렬화

### 2) 모델링 (Modeling) 탭
* **작업 기록 (History)**: `Undo` / `Redo` 다단계 작업 히스토리 스택 지원
* **솔리드 생성 (Solids)**:
  * `Create Base`: 장비 베이스 지지대 생성
  * `Add Box` / `Add Cylinder` / `Add Sphere`: 기본 3D 프리미티브 추가
  * `Chamfer Edge`: 솔리드 모서리 C-Chamfer 모따기 가공
  * `Delete Solid`: 선택한 솔리드 피처 제거
* **모션 (Motion)**:
  * `Motion Setup`: 모션 축-파트 매핑 대화상자
  * `Run Motion` / `Stop Motion`: 시뮬레이션 동작 제어
  * `Home Position`: 모든 구동축을 원점으로 복귀
* **작업 평면 (Work Plane)**:
  * `Align View`: 작업 평면과 화면 시점을 수직으로 정렬
  * `Flip View`: 작업 평면 반대편 시점으로 180° 반전
  * `Rotate 180`: 평면 기준 180° 회전
  * `Clear Plane`: 활성화된 작업 평면 해제
  * `Plane Offset`: 작업 평면을 법선 방향으로 미세 오프셋 이동

### 3) 보기 (View) 탭
* **투영 (Projection)**: 3D 투시뷰, 정면(Front), 측면(Side), 평면(Top) 직교 투영 전환
* **줌 & 원근 (Zoom / Perspective)**: 슬라이더를 통한 1~500% 배율 및 카메라 화각 실시간 조절
* **표시 옵션 (Display)**:
  * 좌표축(Axes), 바닥 코너 축(Base Corner Axes), 축 레이블(Axes Titles) 토글
  * 경계 프레임(Frame), 좌표 평면(Coord Planes) 가시성 토글
  * 미니 오리엔테이션 축(Mini Axes), 미니 PIP 오버뷰 토글
  * 면에서 작업(`Work on Face`) 모드 활성화/비활성화
* **모델 설정 (Model Config)**: 조명, 음영, 렌더링 세부 옵션 구성

### 4) 언어 (Language) 탭
* **한국어** / **English** 원클릭 실시간 UI 다국어 전환 (종료 후 재실행 시에도 영속 유지)

---

## 2. 계층형 모델 트리뷰 (Model TreeView)

좌측의 트리뷰는 파라메트릭 CAD의 핵심인 **종속성 및 계층 구조(Dependency Hierarchy)**를 완벽하게 표현합니다.

```
Model
 ├── Base_Part (기본 고정체 파트)
 │    ├── Base [Z] (1200x1200x100)
 │    ├── Sketch_1 [2D Line] [Construction]
 │    └── Sketch_4 [2D Rectangle] [Profile]
 │         └── Extruded Solid 4 [Extruded Z]
 ├── TransferY_Part (Y축 이송 파트)
 │    └── Extruded Solid 1
 │         └── Sketch_TransferY [Motion Path]
 ├── Chuck_Assembly (척 어셈블리)
 │    ├── ChuckSupport_Part
 │    └── Chuck_Part
 └── 3DSensor_Assembly (3D 센서 어셈블리)
      ├── TransferX_Part (X축 이송 파트)
      └── Sensor_Part
```

* **우클릭 컨텍스트 메뉴**:
  * 피처 이름 변경, 상세 정보 확인, 색상 변경
  * 피처 편집, 삭제, C-Chamfer 모따기
  * **[새 Part로 피처 계열 이동]** / **[기존 Part로 피처 계열 이동]**: 독립 기구 파트로 손쉽게 분리
  * **[선택 Part로 Assembly 구성]**: 다수의 파트를 모션 구동 단위인 어셈블리로 묶기

---

## 3. 고속 3D 뷰포트 (OpenTK Viewport)

* **마우스 조작 네비게이션**:
  * `우클릭 드래그`: 3차원 궤도 회전 (Orbit Rotation)
  * `휠 스크롤`: 카메라 줌 인/아웃 (Zoom In/Out)
  * `휠 클릭 드래그`: 화면 평행 이동 (Pan)
* **스마트 스냅(Snap)**: 정점(Vertex), 모서리 중점(Midpoint), 원 중심(Center) 자동 기하 스냅
* **화면 최대화 토글**: 3D 뷰포트만 전체 화면으로 확장하여 시뮬레이션 몰입도 극대화

---

## 4. 하단 도킹 콘솔 & 모션 티칭 패널

* **Debug Console**: 솔리드 생성, 구속조건 연산, 파트 이동 등 모든 이벤트 로그 실시간 출력
* **모션 설정 Data 탭**:
  * 모션 축 목록 (LM1, LM2 ...) 및 타겟 어셈블리/파트 매핑
  * 티칭 위치 목록 (Pos1, Pos2, ... PosN) 추가/삭제
  * **조그 이동 (+ / -)**: 지정된 이동 스텝(Step) 단위로 실시간 기구 조그 이동 및 즉각적인 3D 뷰 반영
