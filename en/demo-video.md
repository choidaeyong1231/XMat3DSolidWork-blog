# 🎬 XMat3DSolidWork Full Video Demonstration

A 38-minute end-to-end technical demonstration covering the entire system: from 3D solid modeling of a semiconductor wafer thickness inspection machine (`WaferThickness.m3d`) to **2D parametric sketch constraints, Assembly/Part hierarchy management, feature subtree isolation, 3D viewport controls, and real-time multi-axis servo motion simulation**.

<div align="center">
  <video width="100%" controls preload="metadata" poster="images/demo_poster.jpg" style="max-height: 520px; border-radius: 8px; box-shadow: 0 4px 16px rgba(0,0,0,0.15);">
    <source src="videos/XMat3DSolidWork_demo.mp4" type="video/mp4">
    Your browser does not support HTML5 video.
  </video>
  <p><em>💡 XMat3DSolidWork Comprehensive Demonstration (Duration: 38 min 36 sec, 1080p FHD)</em></p>
  <p>
    <a href="videos/XMat3DSolidWork_demo.mp4" target="_blank" class="badge badge-tech" style="text-decoration: none; padding: 6px 12px; font-size: 13px;">🔗 Watch Raw Video in New Tab (78.8MB)</a>
  </p>
</div>

---

## ⏱️ Chapters & Timeline

| Chapter | Time | Core Topic | Description |
| :---: | :--- | :--- | :--- |
| **Part 1** | **00:00 ~ 12:21** | **3D Solid Modeling & 2D Parametric Sketching** | • Creating base frame and machinery structures<br>• Work on Face sketching with geometric constraints (Coincident, Horizontal, Vertical, Dimensions)<br>• 2D profile extrusion, extrusion cutting, and chamfering |
| **Part 2** | **12:21 ~ 32:56** | **Assembly / Part Hierarchy & Servo Motion Teaching** | • Grouping machine structures into Assemblies and Parts<br>• Mapping CAD sketch lines to mechanical guide rails as Motion Paths<br>• Jog (+/-) control and recording teaching positions in Position Map |
| **Part 3** | **32:56 ~ 35:13** | **3D Viewport Controls & Display Environment** | • Interactive 3D View Cube for rapid view alignment (Top, Front, Isometric)<br>• Picture-in-Picture (PiP) overview camera and Perspective/Orthographic projection switching |
| **Part 4** | **35:13 ~ 38:36** | **Feature Tree Separation & Multi-Axis Motion Simulation** | • Lossless subtree separation with [Move Feature Lineage to New Part]<br>• [Maximize 3D View] full-screen viewport mode<br>• Continuous real-time multi-axis coordinated motion (Chuck rotation, TransferX beam, Sensor gantry) and clearance validation |

---

## 🛠️ Key Technologies Highlighted in Video

* **Lightweight Standalone Architecture**: Built from scratch in C# 7.3 and OpenTK (OpenGL) without commercial CAD API overhead
* **Geometric Constraint Solver**: Solves Point-Line coincidence, orthogonality, parallelism, and exact dimensions in real time
* **Path-Line Based Motion Interpolator**: Couples 2D CAD sketch lines directly to physical servo axes for continuous trajectory visualization
* **Lossless Part Hierarchy**: Reorganizes CSG history and parent-child dependency trees without corrupting downstream cuts or chamfers

---

## 📖 Related Tech Blog Articles

* 📘 **[Part 1: Why We Built a Custom 3D Engine](en/01-why-we-build.md)**
* 📘 **[Part 2: OpenTK OpenGL VBO High-Speed Rendering & CSG Pipeline](en/02-opentk-vbo-rendering.md)**
* 📘 **[Part 3: 2D Parametric Sketch Constraint Solver & Work Planes](en/03-sketch-constraints-and-workplane.md)**
* 📘 **[Part 4: Assembly / Part Hierarchy & Multi-Axis Motion Simulation](en/04-assembly-motion-simulation.md)**
