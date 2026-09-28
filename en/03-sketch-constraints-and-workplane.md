# [Part 3] 2D Parametric Sketch Constraint Solver & Work on Face

> **The quintessential CAD experience: transforming any solid surface into a sketch canvas with a single click, coupled with a real-time geometric constraint solver linking 2D and 3D space.**

---

## 1. Mathematical Mechanics of "Work on Face"

In industry-standard CAD software like SolidWorks or Fusion 360, the primary modeling gesture is **"clicking any existing planar face of a solid body to turn it into an active sketch plane."**

Implementing this seamlessly inside our custom 3D engine requires a 4-stage coordinate transformation pipeline:

```
[Mouse Picking Ray (Ray-Casting)]
       │
       ▼ (Compute nearest facet intersection & polygon surface index)
[Surface Normal Vector (N) & Center Datum (P_center)]
       │
       ▼ (Derive Gram-Schmidt Orthonormal U, V basis vectors)
[Local 2D Work Plane Coordinate Frame (U, V)]
       │
       ▼ (Construct bi-directional projection matrices: 2D Screen ↔ 3D World)
[Active 2D Parametric Sketching Canvas]
```

### 1) Orthonormal U, V Basis Vector Calculation
Given a planar normal vector $\vec{N}$, the local horizontal ($\vec{U}$) and vertical ($\vec{V}$) coordinate axes must be determined stably:

$$\vec{U} = \begin{cases} 
(0, 1, 0) \times \vec{N}, & \text{if } |\vec{N}_y| < 0.99 \\ 
(1, 0, 0) \times \vec{N}, & \text{otherwise} 
\end{cases}, \quad \vec{U} = \frac{\vec{U}}{\|\vec{U}\|}$$

$$\vec{V} = \vec{N} \times \vec{U}$$

Through this $(\vec{U}, \vec{V}, \vec{N})$ orthonormal coordinate system, any 2D canvas mouse coordinate $(u, v)$ is deterministically mapped to 3D world space as:
$$P_{3D} = P_{\text{center}} + u\vec{U} + v\vec{V}$$

---

## 2. 2D Parametric Sketch Primitives

XMat3DSolidWork features four foundational 2D sketch primitives:

1. **2D Line**: Defined by start and end points. Used for part silhouettes and as **Motion Paths** for linear servo rails.
2. **2D Rectangle**: Closed 4-vertex polygon. Foundation for extrusion blocks and slider guide cross-sections.
3. **2D Circle**: Defined by center and radius. Ideal for shafts, bearings, and circular vacuum chucks.
4. **2D Point**: Datum references for dimension snapping and external geometric references.

---

## 3. Parametric Geometric Constraint Solver

The hallmark of a parametric modeler is its **Constraint Solver**. When a dimension or vertex coordinate is modified, all dependent geometric entities must dynamically recalculate while maintaining their geometric invariants.

### Supported Constraint Types
* **Coincident**: Locks two vertices to the exact same coordinate ($P_A = P_B$).
* **Horizontal**: Constrains the Y coordinates of two vertices to be identical ($P_{A.y} = P_{B.y}$).
* **Vertical**: Constrains the X coordinates of two vertices to be identical ($P_{A.x} = P_{B.x}$).
* **Distance / Length**: Enforces a constant Euclidean distance $D$ between two points:
  $$\|P_A - P_B\| = D$$
* **Perpendicular**: Forces the dot product of two line directional vectors to zero:
  $$\vec{L}_1 \cdot \vec{L}_2 = 0$$

### Iterative Relaxation Solver
To maintain snappy real-time performance without relying on heavy external math libraries, we implemented an **iterative projection-based relaxation solver**. By projecting points sequentially onto constraint satisfaction manifolds, the system converges within a few iterations—enabling fluid 60 FPS real-time geometry updates even while actively dragging points with the mouse.

---

## 4. External References

Engineers can bind sketch vertices to existing 3D solid edges, vertices, or faces across parts via an **External Reference** mechanism:
* When the parent solid moves or resizes, referenced sketch vertices automatically update their positions in sync.
* If a referenced geometric feature is deleted, the system flags it as `[Broken]` in the feature tree, alerting the user to re-link or dismiss the constraint.

---

## 5. Up Next

In **Part 4**, we will examine the **Assembly & Part Hierarchy Tree** for modular mechanism management, along with our **Multi-Axis Kinematic Motion Simulation System** for real-world servo path validation.
