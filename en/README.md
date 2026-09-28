# XMat3DSolidWork

> **A Standalone Parametric 3D Solid Modeler and Multi-Axis Mechanism Motion Simulator Built in C# & OpenTK (OpenGL)**

<p>
  <a href="https://choidaeyong1231.github.io/XMat3DSolidWork-blog/#/en/"><img src="https://komarev.com/ghpvc/?username=choidaeyong1231-xmat3dsolidwork&label=Visitors&color=007acc" alt="Visitors" /></a>
  <a href="https://github.com/choidaeyong1231/XMat3DSolidWork-blog/issues/new"><img src="https://img.shields.io/badge/Q%26A-GitHub_Issues-brightgreen?logo=github&logoColor=white" alt="Ask Question" /></a>
  <a href="#/en/download"><img src="https://img.shields.io/badge/Download-Release_v1.0.0-blue?logo=windows&logoColor=white" alt="Download Release" /></a>
</p>

<p>
  <span class="badge badge-tech">C# 7.3</span>
  <span class="badge badge-tech">OpenTK / OpenGL 3.3</span>
  <span class="badge badge-tech">WinForms / Krypton Ribbon</span>
  <span class="badge badge-feat">2D Parametric Sketch</span>
  <span class="badge badge-feat">CSG Boolean & Chamfer</span>
  <span class="badge badge-feat">Multi-Axis Motion Simulation</span>
</p>

<div style="background: #f0f7ff; border-left: 4px solid #007acc; padding: 12px 18px; margin: 16px 0; border-radius: 0 6px 6px 0;">
  <strong>💾 Official Release Installer Available:</strong> Download the single NSIS Windows installer package (`Setup.exe`, ~2.1MB) with a bundled semiconductor wafer inspection stage model. <br>
  👉 <a href="#/en/download" style="font-weight: bold; color: #007acc;">Go to Download Page (Setup.exe, ~2.1MB)</a>
</div>

---

## 📌 Project Overview

**XMat3DSolidWork** is a standalone, lightweight engineering application designed from scratch to deliver **real-time 3D solid modeling and multi-axis servo mechanism motion simulation** without relying on heavy commercial CAD packages (such as SolidWorks or Inventor).

Specifically tailored for semiconductor inspection equipment, automated machinery, and precision multi-axis stages:
- **60 FPS Real-time OpenGL Rendering**: High-performance VBO (Vertex Buffer Object) rendering pipeline powered by OpenTK.
- **2D Parametric Sketch Solver**: Solves geometric constraints (Coincident, Horizontal, Vertical, Perpendicular, Parallel, Fixed Distance, Fixed Point, Dimensions) in real-time.
- **Work on Face (Work Plane)**: Automatically aligns a 2D sketch plane onto any arbitrary 3D solid face using surface normal vectors.
- **CSG Boolean Modeling**: Extrude profiles, Extrude Cut (subtraction), and Edge Chamfer with automatic duplicate sequence numbering (`_1`, `_2`).
- **Assembly & Part Hierarchy Tree**: Organizes machine structures into Assembly - Part - Feature levels with drag-and-drop tree operations.
- **Multi-Axis Motion Simulation**: Real-time servo axis jogging, teaching position map recording, motion path interpolation, and collision verification.
- **Bilingual Fluent UI**: MS Office style Krypton Ribbon interface with dynamic Korean/English language switching.

---

## 🎬 Video Demonstration

<div align="center">
  <video width="100%" controls preload="metadata" poster="images/demo_poster.jpg" style="max-height: 480px; border-radius: 8px; box-shadow: 0 4px 16px rgba(0,0,0,0.15);">
    <source src="videos/XMat3DSolidWork_demo.mp4" type="video/mp4">
    Your browser does not support HTML5 video.
  </video>
  <p><em>💡 XMat3DSolidWork 3D Modeling, Part Separation & Multi-Axis Motion Simulation Full Demo (38 min 36 sec)</em></p>
  <p><small><a href="videos/XMat3DSolidWork_demo.mp4" target="_blank">🔗 Watch in New Tab</a> &nbsp;|&nbsp; <a href="#/en/demo-video">📖 Detailed Chapter Breakdown</a></small></p>
</div>

---

## ✨ Key Features

| Category | Key Features | Technical Highlights |
| :--- | :--- | :--- |
| **3D Solid Modeling** | Primitives & 2D Profile Extrusion | Base, Box, Cylinder, Sphere primitives; fast 3D polygon extrusion |
| **CSG Boolean & Cut** | Shape Subtraction & Chamfering | Extrude Cut, Edge Chamfer with auto sequence numbering (`_1`, `_2`) |
| **2D Parametric Sketch** | Line / Rect / Circle / Point & Constraints | Coincident, Horizontal, Vertical, Perpendicular, Parallel, Dimension solver |
| **Work Plane** | Sketch on Solid Surface (Work on Face) | Normal-vector based automatic coordinate alignment, View Align, 180° flip |
| **Assembly / Part Tree** | Hierarchical Assembly - Part - Feature Tree | Multi-part isolation, drag-and-drop reorganization, visibility & opacity control |
| **Motion Simulation** | Multi-Axis Servo Teaching & Playback | Motion Path line designation, Jog (+/-) control, position map recording |
| **Modern Fluent UI** | Krypton Ribbon & Bilingual Support | MS Office style ribbon, real-time Korean/English switching (`LanguageManager`) |
| **Native Storage (.m3d)** | XML-based Lossless Serialization | Complete serialization of sketches, constraints, solids, parts, and motion positions |

---

## 🏛 System Architecture

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

## 📖 Engineering Tech Blog Series

* **[Part 1: Why We Built a Custom 3D Solid Engine](en/01-why-we-build.md)**
  * Background, limitations of commercial CAD APIs, and building a lightweight inspection tool
* **[Part 2: OpenTK OpenGL VBO High-Speed Rendering & CSG Pipeline](en/02-opentk-vbo-rendering.md)**
  * OpenGL vertex buffer architecture, real-time normal calculation, and boolean mesh generators
* **[Part 3: 2D Parametric Sketch Constraint Solver & Work Planes](en/03-sketch-constraints-and-workplane.md)**
  * Solving 2D geometric constraints, Work on Face coordinate projections, and snapping
* **[Part 4: Assembly / Part Hierarchy & Multi-Axis Motion Simulation](en/04-assembly-motion-simulation.md)**
  * Commercial CAD grade part tree hierarchy, motion path lines, servo axis mapping, and jog control
* **[Part 5: XConfigUtil & Reusable Configuration Architecture for WinForms](en/05-xconfigutil-mvvm-architecture.md)**
  * Real-time 3-way synchronization across WinForms and WPF MVVM, driving parameter UI costs to zero
* **[.m3d XML File Format Specification](en/m3d-format-specification.md)**
  * Full schema breakdown for 3D model, sketch constraint, and motion teaching serialization
* **[Krypton Ribbon UI & Bilingual Architecture](en/ui-architecture.md)**
  * Office-style ribbon controller, runtime resource switching, and persistent user configuration
* **[Configuration & XConfigUtil Architecture Specification](en/configuration-architecture.md)**
  * Single Source of Truth model driving real-time 3-way synchronization and turn-key component reusability
