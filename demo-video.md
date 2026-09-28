# 🎬 XMat3DSolidWork 전체 종합 시연 영상 (Full Demo)

반도체 웨이퍼 두께 측정 검사 장비(`WaferThickness.m3d`) 3D 모델링부터 **2D 파라메트릭 스케치 구속조건, Assembly/Part 계층 관리, 피처 계열 독립 Part 분리, 3D 뷰포트 조작, 그리고 다축 서보 모션 시뮬레이션**까지 시스템의 전 과정을 담은 38분 종합 시연 영상입니다.

<div align="center">
  <video width="100%" controls preload="metadata" poster="images/demo_poster.jpg" style="max-height: 520px; border-radius: 8px; box-shadow: 0 4px 16px rgba(0,0,0,0.15);">
    <source src="videos/XMat3DSolidWork_demo.mp4" type="video/mp4">
    이 브라우저는 HTML5 비디오를 지원하지 않습니다.
  </video>
  <p><em>💡 XMat3DSolidWork 전체 종합 시연 영상 (재생시간: 38분 36초, 1080p FHD)</em></p>
  <p>
    <a href="videos/XMat3DSolidWork_demo.mp4" target="_blank" class="badge badge-tech" style="text-decoration: none; padding: 6px 12px; font-size: 13px;">🔗 새 창에서 전체 원본 영상 보기 (78.8MB)</a>
  </p>
</div>

---

## ⏱️ 주요 챕터 및 시연 타임라인 (Chapter Breakdown)

| 챕터 | 재생 시간 | 핵심 시연 내용 | 세부 설명 |
| :---: | :--- | :--- | :--- |
| **1부** | **00:00 ~ 12:21** | **3D 솔리드 모델링 & 2D 파라메트릭 스케치** | • 베이스 프레임 및 구조물 생성<br>• 솔리드 면 위 스케치(Work on Face)와 2D 기하 구속조건(일치, 수평, 수직, 치수)<br>• 다각형 프로파일 돌출(Extrude) 및 컷/모따기 가공 |
| **2부** | **12:21 ~ 32:56** | **Assembly / Part 계층 & 서보 모션 티칭** | • 기구 단위별 Assembly 결합 및 부품별 Part 계층화<br>• CAD 스케치 라인을 기구 레일로 지정하는 모션 경로(Motion Path) 매핑<br>• 조그(Jog +/-) 제어 및 위치별 포지션 맵(Position Map) 티칭 데이터 저장 |
| **3부** | **32:56 ~ 35:13** | **3D 뷰포트 조작 & 표시 환경 설정** | • 인터랙티브 3D 뷰 큐브(View Cube)를 통한 시점 고속 정렬(Top, Front, Isometric)<br>• 우측 상단 PiP(Picture-in-Picture) 미니 시점 뷰 및 투영 방식(원근/직교) 전환 |
| **4부** | **35:13 ~ 38:36** | **독립 Part 분리 이동 & 다축 모션 실시간 시뮬레이션** | • [새 Part로 피처 계열 이동]을 통한 서브트리 무손실 분리<br>• [Maximize 3D View] 전체 화면 모드 전환<br>• 티칭된 다축 서보 기구(X축 이송부, Y축 갠트리, 회전 척)의 실시간 연속 구동 및 기구 간섭 검증 |

---

## 🛠️ 영상 속 핵심 구현 기술

* **초경량 독립 3D CAD 아키텍처**: 상용 CAD API나 무거운 상용 런타임 없이 C# 7.3과 OpenTK(OpenGL)로 밑바닥부터 구축
* **2D 기하 구속조건 솔버 (Geometric Constraint Solver)**: 점-선 일치, 직교, 평행, 치수 구속을 만족하는 기하 최적화 엔진
* **경로 라인 기반 모션 인터폴레이터**: CAD 모델 내의 2D 스케치 선을 실제 기구 레일 축과 1:1 결합하여 실시간 서보 모션을 가시화
* **무손실 부품 계층화**: 복잡한 CSG 가공 이력과 부모-자식 관계를 손상시키지 않고 자유롭게 새 Part로 분리·재배치

---

## 📖 관련 기술 블로그 바로가기

* 📘 **[1편: 자체 3D 솔리드 엔진을 직접 설계한 이유](01-why-we-build.md)**
* 📘 **[2편: OpenTK(OpenGL) VBO 고속 렌더링과 CSG 솔리드 파이프라인](02-opentk-vbo-rendering.md)**
* 📘 **[3편: 2D 파라메트릭 스케치 구속조건 솔버와 면 작업 평면](03-sketch-constraints-and-workplane.md)**
* 📘 **[4편: Assembly / Part 계층 구조와 다축 기구 모션 시뮬레이션](04-assembly-motion-simulation.md)**
