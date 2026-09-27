# [4편] Assembly / Part 계층 구조와 다축 기구 모션 시뮬레이션

> **단순한 3D 모델링을 넘어, 장비의 실제 모터 축 제어와 티칭 데이터를 1:1로 검증하는 실시간 다축 기구 시뮬레이션 엔진**

---

## 1. Assembly - Part - Feature 3계층 아키텍처

단일 솔리드만 다루는 일반 뷰어와 달리, 반도체 검사 장비는 수십 개의 구동 축과 브라켓, 센서 헤드로 이루어진 **복합 어셈블리(Assembly)**입니다.

XMat3DSolidWork는 체계적인 3단계 계층 구조를 제공합니다:

```
[Assembly] (독립적으로 이동 가능한 기구 단위, 예: 3DSensor_Assembly, Chuck_Assembly)
   │
   └── [Part] (개별 부품 단위, 예: TransferX_Part, SensorSupport_Part)
         │
         └── [Feature] (솔리드 피처 단위: Sketch → Extrusion → Cut → Chamfer)
```

### 파트 분리와 어셈블리 구성
* 베이스 바디 위에서 모델링된 피처들을 언제든지 **[새 Part로 피처 계열 이동]** 컨텍스트 메뉴를 통해 독립된 기구 파트로 손쉽게 분리할 수 있습니다.
* 복수의 파트를 선택한 후 **[선택 Part로 Assembly 구성]**을 실행하면 모션 구동의 대상이 되는 독립 기구 유닛으로 결합됩니다.

---

## 2. 모션 경로(Motion Path)와 다축 서보 매핑

XMat3DSolidWork의 가장 독창적인 기능은 **CAD 내 스케치 라인을 실제 모터의 레일(Motion Path)로 직접 활용**한다는 점입니다.

```
       [스케치 라인 (Sketch_TransferX)] ──────┐
                                              │ (Path 지정)
                                              ▼
[서보 축 정의 (LM1, LM2)] ─────────► [Motion Definition]
                                              ▲
                                              │ (Target 지정)
       [대상 기구 (Assembly: 3DSensor)] ──────┘
```

1. **모션 축(Motion Definition) 생성**:
   - 축 명칭: `LM1` (Chuck Y 이송), `LM2` (3D Sensor X 이송)
   - 타겟 타입: `Assembly` 또는 `Part`
   - 타겟 ID: 이동시킬 어셈블리/파트 지정
   - 이동 경로(Path): 스케치상의 2D Line 피처 ID 지정
   - 반전(Reverse) 플래그 지원
2. **실시간 보간 및 3D 변환 (Transform Interpolation)**:
   - 지정된 이동량 $d$에 대해 경로 라인의 방향 벡터 $\vec{V}_{\text{dir}}$을 따라 대상 부품에 속한 모든 솔리드의 정점들을 실시간 선형 변환:
     $$P_{\text{new}} = P_{\text{initial}} + d \cdot \vec{V}_{\text{dir}}$$
   - 회전축 모션의 경우 오일러 각 또는 쿼터니언(Quaternion) 회전 변환 적용

---

## 3. 조그 제어 (Jog Control)와 포지션 티칭 (Position Teaching)

장비 제어 PC의 조그 펜던트처럼 소프트웨어 상에서 직접 조그 이동을 제어할 수 있습니다:

* **스텝 조그 (+ / -)**:
  - 하단 모션 패널에서 이동 스텝(예: `5.00mm`, `10.00mm`)을 입력하고 **`+`**, **`-`** 버튼을 누르면 해당 축이 지정 스텝만큼 즉각 전진/후진
  - 마우스를 누르고 있는 동안(MouseDown) 부드럽게 연속 가감속 주행하는 연속 조그 타이머 탑재
* **포지션 티칭 (Position Teaching)**:
  - `Add Position` 버튼을 눌러 현재 기구들의 다축 위치 좌표를 `Pos1: LM1(0, 70), LM2(65, 0)` 형태로 스냅샷 기록
  - 저장된 포지션 목록을 순차적으로 재생(`Run Motion`)하여 기구 간 간섭 및 충돌 구간을 육안으로 사전 검증

---

## 4. 실전 트러블슈팅: 피처 계열 분리 시 Part 경계 보존 이슈

### 문제 상황
사용자가 베이스 파트의 특정 브라켓 피처(`Sketch_4`)를 **[새 Part로 피처 계열 이동]**하였을 때, 상위 기구물인 `TransferX_Part`의 피처들까지 새 파트로 빨려 들어가 `TransferX_Part`가 빈 껍데기가 되고 모션 연동이 끊어지는 현상이 발생했습니다.

### 원인 분석
* `TransferX_Part`의 시작 스케치(`Sketch_13`)가 하부 브라켓의 표면 위에서 그려졌기 때문에, 기하학적 참조인 `Sketch_13.ParentId`가 하부 브라켓 솔리드를 가리키고 있었습니다.
* 하위 종속 피처를 수집하는 `CollectSubtreeIds` 함수가 **Part 소속 경계를 검사하지 않고** `ParentId` 참조만으로 전체 트리를 무조건 탐색했기 때문에, 이미 다른 Part(`TransferX_Part`)로 분리되어 있던 피처들까지 새 Part ID로 덮어씌워버린 것이 원인이었습니다.

### 해결책
```csharp
// 수정 후: 시작 피처와 동일한 Part 소속인 피처만 재귀 수집하도록 방어
private void CollectSubtreeIds(string rootId, List<string> ids, string szSourcePartId = null)
{
    if (string.IsNullOrEmpty(rootId) || ids.Contains(rootId)) return;
    ids.Add(rootId);
    foreach (XSolidObject s in _view3DPlotCtrl.SolidObjects.Objects)
    {
        // 다른 Part 소속의 피처는 경계를 넘어가지 않고 수집에서 제외
        if (szSourcePartId != null)
        {
            string sPartId = string.IsNullOrEmpty(s.PartId) ? DefaultPartId : s.PartId;
            if (!string.Equals(sPartId, szSourcePartId, StringComparison.Ordinal))
                continue;
        }

        if (string.Equals(s.ParentId, rootId, StringComparison.Ordinal) ||
            string.Equals(s.SourceSketchId, rootId, StringComparison.Ordinal))
        {
            CollectSubtreeIds(s.Id, ids, szSourcePartId);
        }
    }
}
```

이 필터링을 통해 **기하학적 면 참조 관계를 유지하면서도 파트 소속과 모션 매핑을 온전히 보호**하는 안정적인 어셈블리 분리 시스템을 완성했습니다.

---

## 🎬 실제 동작 시연 영상

위에서 설명한 **피처 계열의 새 Part 분리 및 다축 모션 시뮬레이션의 실제 동작 과정**을 [전체 시연 영상 페이지](demo-video.md) 또는 아래 영상에서 직접 확인하실 수 있습니다:

<div align="center">
  <video width="100%" controls preload="metadata" poster="images/demo_poster.jpg" style="max-height: 460px; border-radius: 8px; box-shadow: 0 4px 16px rgba(0,0,0,0.15);">
    <source src="videos/XMat3DSolidWork_demo.mp4" type="video/mp4">
    이 브라우저는 HTML5 비디오를 지원하지 않습니다.
  </video>
  <p><em>💡 Part 계층 분리 및 다축 모션 시뮬레이션 실제 동작 시연 (3분 21초)</em></p>
</div>
