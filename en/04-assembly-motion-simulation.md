# [Part 4] Assembly / Part Hierarchy & Multi-Axis Motion Simulation

> **Beyond static 3D modeling: a real-time multi-axis kinematic simulation engine verifying actual servo axes and teaching points 1:1 against physical equipment.**

---

## 1. Assembly - Part - Feature 3-Tier Architecture

Unlike rudimentary 3D viewers that manage only flat lists of meshes, industrial inspection equipment consists of **complex assemblies** comprising dozens of moving axes, mounting brackets, optical sensors, and rotating chucks.

XMat3DSolidWork provides a structured 3-tier mechanical hierarchy:

```
[Assembly] (Independently movable kinematic mechanism, e.g. 3DSensor_Assembly, Chuck_Assembly)
   │
   └── [Part] (Individual component container, e.g. TransferX_Part, SensorSupport_Part)
         │
         └── [Feature] (Solid modeling features: Sketch → Extrude → Cut → Chamfer)
```

### Part Separation & Assembly Grouping
* Any feature modeled on a base datum body can be segregated into an independent mechanical part via the **[Move Feature Lineage to New Part]** context menu action.
* Selecting multiple parts and executing **[Create Assembly from Selected Parts]** instantaneously unifies them into a single actuated kinematic unit.

---

## 2. Motion Paths & Multi-Axis Servo Mapping

One of XMat3DSolidWork's most innovative capabilities is **directly utilizing CAD sketch lines as physical servo motion guide rails (Motion Paths)**:

```
        [Sketch Line (Sketch_TransferX)] ──────┐
                                               │ (Designate Path)
                                               ▼
[Servo Axis Defs (LM1, LM2)] ────────► [Motion Definition]
                                               ▲
                                               │ (Designate Target)
        [Target Unit (Assembly: 3DSensor)] ────┘
```

1. **Motion Definition Creation**:
   - Axis identifier: `LM1` (Chuck Y feed), `LM2` (3D Sensor X feed)
   - Target type: `Assembly` or `Part`
   - Target ID: Designates target assembly or part to actuate
   - Motion Path: Designates a 2D line feature ID from the model sketch
   - Reverse direction flag support
2. **Real-Time 3D Transform Interpolation**:
   - For a given displacement $d$, all solid vertices belonging to the target body undergo real-time linear translation along the path direction vector $\vec{V}_{\text{dir}}$:
     $$P_{\text{new}} = P_{\text{initial}} + d \cdot \vec{V}_{\text{dir}}$$
   - For rotary axes, Euler-angle or quaternion rotation transformations are applied around the designated hinge axis.

---

## 3. Jog Control & Position Teaching

Just like operating a physical teach pendant on the shop floor, engineers can actuate mechanism stages directly from the UI:

* **Step Jogging (+ / -)**:
  - Input a discrete step increment (e.g. `5.00mm`, `10.00mm`) in the bottom motion panel and click **`+`** or **`-`** to step the axis forward or backward instantly.
  - Features a continuous jog timer with smooth acceleration and deceleration profiles while the mouse button is held down.
* **Position Teaching**:
  - Click `Add Position` to snapshot the current multi-axis coordinates into named teaching points: e.g. `Pos1: LM1(0, 70), LM2(65, 0)`.
  - Sequential playback (`Run Motion`) allows visual pre-flight verification of stage trajectories, clearances, and collision risks before machine power-on.

---

## 4. Real-World Troubleshooting: Preserving Part Boundaries in Lineage Migration

### The Issue
When an engineer moved a specific bracket feature (`Sketch_4`) from the base part to a new part via **[Move Feature Lineage to New Part]**, downstream features belonging to the independent gantry unit `TransferX_Part` were unintentionally pulled into the new part as well, stripping `TransferX_Part` empty and breaking its servo motion mapping.

### Root Cause Analysis
* Because `TransferX_Part`'s initial sketch (`Sketch_13`) was drawn directly on top of the lower bracket's face, its geometric parent reference `Sketch_13.ParentId` pointed to the bracket solid.
* The recursive lineage traversal function `CollectSubtreeIds` traced parent-child links **without verifying part boundary ownership**. As a result, features already partitioned into `TransferX_Part` were traversed and overwritten with the new Part ID.

### The Resolution
```csharp
// Fixed: Restrict recursive lineage collection to features sharing the source Part ID
private void CollectSubtreeIds(string rootId, List<string> ids, string szSourcePartId = null)
{
    if (string.IsNullOrEmpty(rootId) || ids.Contains(rootId)) return;
    ids.Add(rootId);
    foreach (XSolidObject s in _view3DPlotCtrl.SolidObjects.Objects)
    {
        // Do not traverse across part ownership boundaries
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

This partition boundary guard **retains geometric face-on-face associativity while strictly isolating part ownership and motion mappings**.

---

## 🎬 Live Demonstration Video

You can watch the full workflow—from **feature lineage part separation to multi-axis synchronized motion simulation**—on our [Video Demo Page](demo-video.md) or directly below:

<div align="center">
  <video width="100%" controls preload="metadata" poster="images/demo_poster.jpg" style="max-height: 460px; border-radius: 8px; box-shadow: 0 4px 16px rgba(0,0,0,0.15);">
    <source src="videos/XMat3DSolidWork_demo.mp4" type="video/mp4">
    Your browser does not support HTML5 video.
  </video>
  <p><em>💡 Comprehensive Demo Video (38m 36s, Part separation & multi-axis motion starts at 35:13)</em></p>
</div>
