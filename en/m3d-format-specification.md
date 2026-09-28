# .m3d XML File Format Specification

XMat3DSolidWork serializes all 3D geometries, 2D sketches, geometric constraints, assembly hierarchies, and servo motion teaching data into its proprietary XML specification: the **`.m3d`** file format. Being human-readable text, it integrates cleanly with Git version control and diff tracking.

---

## 1. Top-Level Schema Overview

```xml
<?xml version="1.0" encoding="utf-8"?>
<XMat3DSolidModel Version="1.0">
  <!-- 1. Environment & Camera Viewport Preferences -->
  <MapSettings ... />
  <ModelConfig ... />
  
  <!-- 2. Assembly and Part Topology Definitions -->
  <Assemblies>
    <Assembly Id="..." Name="Chuck_Assembly" />
    <Assembly Id="..." Name="3DSensor_Assembly" />
  </Assemblies>
  <Parts>
    <Part Id="..." Name="Base_Part" AssemblyId="" />
    <Part Id="..." Name="TransferX_Part" AssemblyId="..." />
  </Parts>

  <!-- 3. Solid Geometries and 2D Sketch Features -->
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

  <!-- 4. Multi-Axis Servo Motion Definitions & Teaching Snapshots -->
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

## 2. Key Element Details

### `<Assemblies>` & `<Parts>`
* `Assembly`: Kinematic grouping identifier encapsulating one or more member parts.
* `Part`: Machine component identifier mapped 1:1 to the `PartId` attribute of solid features. Can be standalone or belong to an assembly.

### `<Solids>`
* `Kind`: `Box`, `Cylinder`, `Sphere`, `ExtrudedPolygon`.
* `IsSketch`: When `true`, the element represents a 2D parametric sketch wireframe rather than a 3D volumetric mesh.
* `IsCut`: When `true`, acts as a negative CSG subtraction toolbody against its parent solid.
* `SourceSketchId`: ID of the 2D sketch profile used to generate the 3D extrusion.
* `ParentId`: Target datum solid to which the sketch plane is anchored, or target solid body to be cut.
* `WorkPlaneCenter`, `WorkPlaneNormal`, `WorkPlaneUAxis`, `WorkPlaneVAxis`: Local 3D orthonormal basis vectors defining the feature's work plane coordinate frame.

### `<Motions>` & `<MotionPositions>`
* `TargetType`: `Assembly` or `Part`.
* `TargetId`: ID of the actuated mechanism entity.
* `PathSketchId`: ID of the 2D line sketch defining the physical axis trajectory.
* `MotionPositions`: Array of multi-axis 3D coordinate snapshots taught by the user via jog controls.
