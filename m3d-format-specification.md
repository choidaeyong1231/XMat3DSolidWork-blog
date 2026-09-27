# .m3d XML 파일 포맷 사양 (File Format Specification)

XMat3DSolidWork는 모델의 모든 형상, 스케치, 구속조건, 어셈블리 계층, 모션 티칭 데이터를 자체 규격의 XML 포맷인 **`.m3d`** 파일로 저장합니다. 텍스트 기반 포맷이므로 Git 형상 관리와 버전 추적이 매우 용이합니다.

---

## 1. 전체 구조 개요

```xml
<?xml version="1.0" encoding="utf-8"?>
<XMat3DSolidModel Version="1.0">
  <!-- 1. 기본 환경 및 카메라 설정 -->
  <MapSettings ... />
  <ModelConfig ... />
  
  <!-- 2. 어셈블리 및 파트 정의 -->
  <Assemblies>
    <Assembly Id="..." Name="Chuck_Assembly" />
    <Assembly Id="..." Name="3DSensor_Assembly" />
  </Assemblies>
  <Parts>
    <Part Id="..." Name="Base_Part" AssemblyId="" />
    <Part Id="..." Name="TransferX_Part" AssemblyId="..." />
  </Parts>

  <!-- 3. 솔리드 및 스케치 피처 정의 -->
  <Solids>
    <!-- Base Solid -->
    <Solid Id="base" Kind="Box" ... />
    
    <!-- 2D Sketch Feature -->
    <Solid Id="..." Kind="ExtrudedPolygon" IsSketch="true" ...>
      <PolygonPoints>
        <Point X="..." Y="..." />
      </PolygonPoints>
      <Constraints>
        <Constraint Type="Coincident" PointA="0" PointB="1" ... />
      </Constraints>
      <ExternalReferences>
        <Reference SolidId="..." PointIndex="0" SnapType="Vertex" />
      </ExternalReferences>
    </Solid>

    <!-- 3D Extrusion Feature -->
    <Solid Id="..." Kind="ExtrudedPolygon" SourceSketchId="..." ParentId="..." ... />
  </Solids>

  <!-- 4. 다축 모션 정의 및 티칭 데이터 -->
  <Motions>
    <Motion Name="LM1" TargetType="Assembly" TargetId="..." PathSketchId="..." />
    <Motion Name="LM2" TargetType="Assembly" TargetId="..." PathSketchId="..." />
  </Motions>
  <MotionPositions>
    <Position Index="0" Text="Pos1: LM1(0.00, 70.00, 0.00), LM2(65.00, 0.00, 0.00)" />
  </MotionPositions>
</XMat3DSolidModel>
```

---

## 2. 주요 태그 상세

### `<Assemblies>` 및 `<Parts>`
* `Assembly`: 다수의 파트를 포함하는 그룹 식별자
* `Part`: 특정 어셈블리에 속하거나 독립된 기구 부품 식별자. 각 솔리드 피처의 `PartId`와 1:1 매핑

### `<Solids>`
* `Kind`: `Box`, `Cylinder`, `Sphere`, `ExtrudedPolygon`
* `IsSketch`: `true`인 경우 3D 볼륨이 아닌 2D 파라메트릭 스케치 피처로 취급
* `IsCut`: `true`인 경우 모체 솔리드에서 감산 연산(CSG Cut)을 수행하는 커터 피처
* `SourceSketchId`: 돌출 생성의 모체가 된 스케치 ID
* `ParentId`: 스케치 평면이 부착된 기준 솔리드 또는 컷 대상 솔리드 ID
* `WorkPlaneCenter`, `WorkPlaneNormal`, `WorkPlaneUAxis`, `WorkPlaneVAxis`: 해당 피처의 3차원 로컬 작업 평면 행렬 기저 벡터

### `<Motions>` 및 `<MotionPositions>`
* `TargetType`: `Assembly` 또는 `Part`
* `TargetId`: 모션 제어 대상 엔티티 ID
* `PathSketchId`: 기구 이동의 기준선이 되는 2D Line 스케치 ID
* `MotionPositions`: 사용자가 조그 제어로 티칭한 각 축별 3차원 위치 스냅샷 배열
