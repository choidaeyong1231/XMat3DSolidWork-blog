# [2편] OpenTK(OpenGL) VBO 고속 렌더링과 CSG 솔리드 파이프라인

> **실시간 60FPS 뷰포트 유지 비결: 정점 버퍼(VBO) 구조화, 자동 법선 벡터 산출, 그리고 파라메트릭 CSG 메쉬 생성 알고리즘**

---

## 1. 레거시 즉시 모드(Immediate Mode)의 한계와 VBO 도입

초기 OpenGL 개발에서 흔히 사용하는 `GL.Begin()` / `GL.End()` 즉시 모드는 매 프레임마다 CPU에서 GPU로 정점 좌표를 일일이 전송하므로, 복잡한 3D 기구 모델에서 CPU 병목 현상이 발생하여 프레임 레이트가 급격히 저하됩니다.

XMat3DSolidWork는 **OpenTK 기반 현대적 VBO(Vertex Buffer Object)** 방식을 채택했습니다:

```
[3D 기하 파라미터]
       │ (1회 테셀레이션 & 메쉬화)
       ▼
[Float Array 버퍼 (Position, Normal, Color)]
       │ (GL.BufferData 로 GPU 메모리 1회 업로드)
       ▼
[GPU VRAM 정점 버퍼 (VBO)]
       │ (매 프레임 DrawArrays / DrawElements 호출)
       ▼
[60FPS+ 초고속 렌더링 화면]
```

피처 편집이나 모션 이동이 발생하지 않는 한 정점 데이터는 GPU VRAM에 상주하며, 카메라 회전이나 줌 조작 시에는 뷰/프로젝션 행렬(Matrix4)만 전달하므로 CPU 점유율을 1% 미만으로 유지할 수 있습니다.

---

## 2. 솔리드 프리미티브와 다각형 돌출(Extrude) 메쉬 생성

XMat3DSolidWork는 두 가지 방식으로 솔리드 형상을 구축합니다:

### 1) 기본형 프리미티브 (Box, Cylinder, Sphere)
* **Box**: 6개 면, 12개 삼각형, 8개 정점에 대한 고유 법선(Face Normal) 자동 생성
* **Cylinder**: 원주 분할수(기본 32각)에 따른 상·하단 캡 원형 트라이앵글 팬(Triangle Fan) 및 측면 쿼드 스트립 테셀레이션
* **Sphere**: 위도/경도 분할 각도 기반의 구면 메쉬 생성

### 2) 2D 다각형 프로파일 기반 돌출 (Extrude Solid)
사용자가 2D 스케치 평면상에 그린 임의의 폐곡선(Polygon Points $[P_0, P_1, \dots, P_{n-1}]$)을 지정된 축($X, Y, Z$ 또는 법선 벡터 $\vec{N}$) 방향으로 높이 $H$만큼 밀어내어 솔리드를 생성합니다:

1. **상·하단 단면 캡핑 (Ear-Clipping Triangulation)**:
   임의의 오목/볼록 2D 다각형을 삼각형들로 분할하여 밑면과 윗면을 메웁니다.
2. **측면 벽면 메쉬 생성 (Side Wall Quads)**:
   인접한 정점 쌍 $(P_i, P_{i+1})$에 대해 상단 정점 $(P_i', P_{i+1}')$을 연결하여 측면 쿼드(2개 삼각형)를 연속 생성합니다:
   $$\vec{N}_{\text{side}} = \frac{(P_{i+1} - P_i) \times \vec{H}}{\|(P_{i+1} - P_i) \times \vec{H}\|}$$
3. **법선 벡터 방향 정렬**:
   면이 항상 바깥쪽을 향하도록 와인딩 오더(Winding Order, CCW)를 검증하고 조정합니다.

---

## 3. CSG 돌출 컷(Extrude Cut)과 모따기(Chamfer)

### 1) 돌출 컷 (Extrude Cut)
솔리드 표면에서 내부 방향으로 형상을 파내는 연산입니다. 대상 솔리드(`ParentId`)와 커터 형상 사이의 3D 공간 상호작용을 계산하여 음각 형상을 연출합니다.

### 2) 모서리 모따기 (C-Chamfer)
선택한 3D 솔리드의 특정 에지(Edge)를 따라 $C = 15\text{mm}$ 등의 규격으로 45도 절삭 면을 생성합니다:
* 선택된 에지의 시점과 종점 벡터 추출
* 인접한 두 면의 법선 벡터로부터 절삭 평면(Cutting Plane)의 기준 좌표계 산출
* 커터 프리미티브(`XSolidChamfer`)를 생성하여 대상 솔리드에 컷 연산 적용

```csharp
// XSolidChamfer 메쉬 생성 핵심 구조
XSolidObject cutter = new XSolidObject
{
    PartId = targetSolid.PartId,
    ParentId = targetSolid.Id,
    Kind = SolidPrimitiveKind.ExtrudedPolygon,
    Axis = SolidExtrudeAxis.Z,
    IsCut = true,
    Name = $"{targetSolid.Name}_Chamfer{fDistance:F0}",
    Color = targetSolid.Color,
    WorkPlaneCenter = point1Extended,
    WorkPlaneNormal = edgeDir,
    ...
};
```

---

## 4. 조명(Lighting) 및 인터랙티브 하이라이트

* **Phong / Diffuse 조명 모델**: 카메라 위치와 고정 광원 방향에 따른 음영 계산으로 입체감 구현
* **선택 하이라이트 (Selection Glow)**:
  선택된 솔리드는 외곽선 에지 강조 렌더링 및 골드/오렌지 색상 블렌딩을 적용하여 사용자가 조작 대상을 명확히 인지할 수 있도록 처리
* **고스트 모드 (Transparency)**:
  내부 부품이나 간섭을 관찰할 수 있도록 알파 블렌딩(`GL.BlendFunc(SrcAlpha, OneMinusSrcAlpha)`) 기반 투명 렌더링 모드 지원

---

## 5. 다음 편 예고

[3편]에서는 솔리드 표면에 자유롭게 스케치 평면을 붙이는 **면 작업 평면(Work on Face)**과, 2D 정점 간의 기하학적 관계를 자동으로 맞춰주는 **파라메트릭 구속조건(Constraint) 솔버**를 다룹니다.
