# 🎬 XMat3DSolidWork 전체 시연 영상

반도체 웨이퍼 두께 측정 검사 장비(`WaferThickness.m3d`) 모델을 바탕으로, **Assembly/Part/Feature 계층 관리, 피처 계열 독립 Part 분리, 3D 뷰포트 조작, 그리고 다축 서보 모션 시뮬레이션**이 실시간으로 동작하는 전체 시연 영상입니다.

<div align="center">
  <video width="100%" controls preload="metadata" poster="images/demo_poster.jpg" style="max-height: 520px; border-radius: 8px; box-shadow: 0 4px 16px rgba(0,0,0,0.15);">
    <source src="videos/XMat3DSolidWork_demo.mp4" type="video/mp4">
    이 브라우저는 HTML5 비디오를 지원하지 않습니다.
  </video>
  <p><em>💡 XMat3DSolidWork 실제 동작 시연 영상 (재생시간: 3분 21초, 1080p 60FPS)</em></p>
  <p>
    <a href="videos/XMat3DSolidWork_demo.mp4" target="_blank" class="badge badge-tech" style="text-decoration: none; padding: 6px 12px; font-size: 13px;">🔗 새 창에서 원본 영상 보기</a>
  </p>
</div>

---

## ⏱️ 주요 시연 타임라인 (Timeline Breakdown)

| 재생 시간 | 핵심 시연 내용 | 상세 설명 |
| :--- | :--- | :--- |
| **00:00 ~ 00:40** | **검사 장비 모델 로드 & 트리 구조 확인** | • `WaferThickness.m3d` 장비 모델 로딩<br>• 베이스 프레임, 웨이퍼 진공 척(Chuck), 갠트리 이송부, 3D 변위 센서 어셈블리 계층 확인 |
| **00:40 ~ 01:25** | **피처 계열 이동 및 독립 Part 분리** | • `TransferX_Part`에 통합되어 있던 서브 프레임/기둥 피처 선택<br>• 트리 컨텍스트 메뉴 [새 Part로 피처 계열 이동] 실행<br>• `TransferXFrame_Part`, `TransferXColumn1_Part`, `TransferXColumn2_Part`로 서브트리 무손실 분리 |
| **01:25 ~ 02:05** | **3D 뷰포트 최대화 & 뷰 큐브 조작** | • [Maximize 3D View]를 통해 몰입형 전체 뷰포트로 전환<br>• 좌측 상단 인터랙티브 3D 뷰 큐브(View Cube)를 통한 평면도(Top), 정면도, 등각(Isometric) 즉각 전환<br>• 우측 상단 PiP(Picture-in-Picture) 미니 시점 뷰 연동 |
| **02:05 ~ 03:00** | **다축 서보 기구 모션 시뮬레이션 구동** | • [모션 실행] 트리거<br>• 티칭된 포지션 맵 데이터에 따라 X축 이송부, Y축 갠트리, 회전 척(Chuck)이 모션 경로 라인(Motion Path)을 따라 실시간 동시 연동 이동<br>• 충돌 여부 및 기구 동작 간섭 궤적 실시간 검증 |
| **03:00 ~ 03:21** | **모션 정지 & 뷰포트/원점 복귀** | • 실시간 [모션 정지(Stop)] 및 [모션 원점] 복귀<br>• [Restore View]로 작업 모드(트리 및 리본 메뉴) 복귀 |

---

## 🛠️ 영상 속 주요 기술 요소

* **OpenTK VBO 기반 실시간 고속 렌더링**: 복합 솔리드 및 컷/모따기 메쉬를 VBO에 캐싱하여 다축 모션 구동 중에도 안정적인 60FPS 유지
* **지능형 서브트리 Part 분리 알고리즘**: 상하위 의존성을 자동 추적하여 기하 형상 손상 없이 안전하게 새 부품 계층으로 분리
* **다축 서보 모션 인터폴레이터**: 2D/3D 공간상의 모션 경로 라인과 각 축별 서보 포지션 데이터를 결합하여 부드러운 다자유도 기구 동작 시뮬레이션

---

## 📖 관련 기술 블로그 함께 보기

* 📘 **[4편: Assembly / Part 계층 구조와 다축 기구 모션 시뮬레이션](04-assembly-motion-simulation.md)**  
  * 상용 솔리드웍스 수준의 부품 계층화 원리와 실시간 서보 구동 구현 비하인드
* 📘 **[2편: OpenTK(OpenGL) VBO 고속 렌더링과 CSG 솔리드 파이프라인](02-opentk-vbo-rendering.md)**  
  * OpenGL 정점 버퍼 구조와 돌출/모따기 메쉬 실시간 렌더링 원리
* 📘 **[3편: 2D 파라메트릭 스케치 구속조건 솔버와 면 작업 평면](03-sketch-constraints-and-workplane.md)**  
  * 솔리드 면 위 스케치(Work on Face)와 기하 구속조건 해결 원리
