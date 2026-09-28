# XMat3DSolidWork

> **C# & OpenTK(OpenGL) 기반의 자체 파라메트릭 3D 솔리드 모델러 및 다축 기구 모션 시뮬레이션 시스템**

<p>
  <a href="https://choidaeyong1231.github.io/XMat3DSolidWork-blog"><img src="https://komarev.com/ghpvc/?username=choidaeyong1231-xmat3dsolidwork&label=Visitors&color=007acc" alt="Visitors" /></a>
  <a href="https://github.com/choidaeyong1231/XMat3DSolidWork-blog/issues/new"><img src="https://img.shields.io/badge/Q%26A-GitHub_Issues-brightgreen?logo=github&logoColor=white" alt="Ask Question" /></a>
  <a href="#/download"><img src="https://img.shields.io/badge/Download-Release_v1.0.0-blue?logo=windows&logoColor=white" alt="Download Release" /></a>
</p>

<p>
  <span class="badge badge-tech">C# 7.3</span>
  <span class="badge badge-tech">OpenTK / OpenGL</span>
  <span class="badge badge-tech">WinForms / Krypton Ribbon</span>
  <span class="badge badge-feat">2D Parametric Sketch</span>
  <span class="badge badge-feat">CSG Boolean & Chamfer</span>
  <span class="badge badge-feat">Multi-Axis Motion Simulation</span>
</p>

<div style="background: #f0f7ff; border-left: 4px solid #007acc; padding: 12px 18px; margin: 16px 0; border-radius: 0 6px 6px 0;">
  <strong>💾 공식 릴리즈 인스톨러 배포 중:</strong> NSIS 기반 원클릭 윈도우 설치 프로그램(`Setup.exe`) 및 검사 장비 샘플 모델이 제공됩니다. <br>
  👉 <a href="#/download" style="font-weight: bold; color: #007acc;">프로그램 설치 파일 다운로드 (Setup.exe, 약 2.1MB)</a>
</div>

---

## 📌 프로젝트 소개 (Introduction)

**XMat3DSolidWork**는 반도체 검사 장비, 자동화 기구 및 정밀 스테이지 개발 현장에서 고가의 상용 CAD(SolidWorks 등)에 의존하지 않고도, **독자적인 3D 솔리드 모델링 및 다축 서보 기구 모션 시뮬레이션을 실시간으로 수행**할 수 있도록 밑바닥(From Scratch)부터 직접 설계·구현한 독립형 엔지니어링 도구입니다.

기존 상용 CAD API의 무거운 런타임 오버헤드와 복잡한 라이선스 제약에서 벗어나, **초경량 독립 실행 환경에서 60FPS 실시간 OpenGL 렌더링, 2D 스케치 기하 구속조건(Constraint) 솔버, 어셈블리/파트 트리 관리, 그리고 실제 모션 티칭 데이터를 연동한 기구 동작 검증**을 일체화하였습니다.

---

## 🎬 데모 시연 영상 (Demo Video)

<div align="center">
  <video width="100%" controls preload="metadata" poster="images/demo_poster.jpg" style="max-height: 480px; border-radius: 8px; box-shadow: 0 4px 16px rgba(0,0,0,0.15);">
    <source src="videos/XMat3DSolidWork_demo.mp4" type="video/mp4">
    이 브라우저는 HTML5 비디오를 지원하지 않습니다.
  </video>
  <p><em>💡 XMat3DSolidWork 3D 모델링, 파트 분리 및 다축 모션 시뮬레이션 종합 시연 (38분 36초)</em></p>
  <p><small><a href="videos/XMat3DSolidWork_demo.mp4" target="_blank">🔗 새 창에서 원본 영상 보기</a> &nbsp;|&nbsp; <a href="#/demo-video">📖 4개 챕터별 상세 설명 보기</a></small></p>
</div>

---

## ✨ 핵심 기능 (Key Features)

| 대분류 | 주요 기능 | 세부 기술 및 알고리즘 |
| :--- | :--- | :--- |
| **3D 솔리드 모델링** | 기본 형상 및 2D 스케치 돌출 | 베이스(Base), 박스, 실린더, 구 프리미티브 생성 및 2D 다각형 프로파일 기반 고속 돌출(Extrude) |
| **CSG 불리언 & 가공** | 형상 감산 및 모따기 가공 | 돌출 컷(Extrude Cut), 모서리 모따기(Chamfer), 3D 기하 연산 및 CSG 트리 관리 |
| **2D 파라메트릭 스케치** | 선/사각형/원/점 & 기하 구속 | 일치, 수평, 수직, 직교, 치수 등 2D 기하 구속조건(Geometric Constraint) 솔버 및 외부 참조(External Reference) |
| **작업 평면 (Work Plane)** | 면 기반 스케치 평면 (Work on Face) | 솔리드 표면 법선 벡터 기반 작업 평면 자동 정렬, 시점 정렬(Align View), 180° 회전 및 오프셋(Offset) |
| **어셈블리 & 파트 계층** | Assembly - Part - Feature 계층 트리 | 부품별 독립 Part 분리, 트리 드래그/이동, 다중 선택 어셈블리 구성 및 투명도/가시성 개별 제어 |
| **다축 모션 시뮬레이션** | 서보 축 모션 티칭 및 연속 재생 | 모션 경로 라인(Motion Path) 지정, 서보 축 매핑, 조그(Jog +/-) 제어, 포지션 맵 저장 및 실시간 충돌/궤적 시뮬레이션 |
| **모던 Fluent UI** | Krypton Ribbon & 다국어 | MS Office 스타일 리본 인터페이스, 런타임 실시간 한/영 다국어 전환(`LanguageManager`), 환경설정 영속화 |
| **독자 포맷 (.m3d)** | XML 기반 파일 저장/복원 | 스케치, 구속조건, 솔리드 파라미터, 어셈블리 계층, 모션 티칭 포지션 데이터의 무손실 직렬화 |

---

## 🏛 시스템 아키텍처 (System Architecture)

```
┌────────────────────────────────────────────────────────┐
│               Krypton Ribbon Fluent UI                 │
│  [File]  |  [Modeling]  |  [View / Display]  |  [Lang] │
└───────────┬────────────────────────────────┬───────────┘
            │                                │
┌───────────▼───────────┐        ┌───────────▼───────────┐
│     Model TreeView    │        │  OpenTK 3D Viewport   │
│ Assembly / Part / Feat│        │  VBO 60FPS Rendering  │
└───────────┬───────────┘        └───────────▲───────────┘
            │                                │
┌───────────▼────────────────────────────────┴───────────┐
│             Core Geometry & Modeling Engine            │
│  - 2D Constraint Solver (Coincident, Horizontal, etc.) │
│  - Work Plane Alignment & Coordinate Projection        │
│  - CSG Extrude / Cut / Chamfer Mesh Generator          │
│  - Multi-Axis Motion Controller & Jog Interpolator     │
└───────────────────────────┬────────────────────────────┘
                            │
┌───────────────────────────▼────────────────────────────┐
│          .m3d XML Document Storage (.m3d)              │
└────────────────────────────────────────────────────────┘
```

---

## 📖 실전 개발기 목차 (Tech Blog Series)

* **[1편: 자체 3D 솔리드 엔진을 직접 설계한 이유](01-why-we-build.md)**
  * 상용 CAD 연동의 한계와 검사 장비 현장 맞춤형 경량 3D 도구 개발 배경
* **[2편: OpenTK(OpenGL) VBO 고속 렌더링과 CSG 솔리드 파이프라인](02-opentk-vbo-rendering.md)**
  * OpenGL 정점 버퍼(VBO) 구조, 실시간 법선 벡터 계산, 돌출/컷/모따기 메쉬 생성 알고리즘
* **[3편: 2D 파라메트릭 스케치 구속조건 솔버와 면 작업 평면](03-sketch-constraints-and-workplane.md)**
  * 2D 평면 기하 구속조건 해결 원리, 솔리드 표면 면 위 스케치(Work on Face)와 좌표계 변환
* **[4편: Assembly / Part 계층 구조와 다축 기구 모션 시뮬레이션](04-assembly-motion-simulation.md)**
  * 상용 솔리드웍스 수준의 부품 계층화, 모션 경로 라인 기반 실시간 서보 구동 및 조그 제어 구현
* **[5편: WinForms 장비 개발자를 위한 XConfigUtil & Configuration 재사용 아키텍처](05-xconfigutil-mvvm-architecture.md)**
  * WinForms와 WPF MVVM의 실시간 3자 동기화, 파라미터 UI 개발 비용을 '0'으로 만든 턴키 재사용 청사진
* **[.m3d XML 파일 포맷 사양](m3d-format-specification.md)**
  * 모델 형상 및 모션 데이터를 저장하는 XML 스키마 상세 구조
* **[Krypton Ribbon UI & 다국어 아키텍처](ui-architecture.md)**
  * Office 스타일 리본 컨트롤러, 실시간 한/영 리소스 스위칭 및 영속화 아키텍처
* **[Configuration & XConfigUtil 아키텍처](configuration-architecture.md)**
  * 단일 진실 공급원(SSOT) 모델 기반의 실시간 3자 동기화와 턴키 컴포넌트 재사용 사양
