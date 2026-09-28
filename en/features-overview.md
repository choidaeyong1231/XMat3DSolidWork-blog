# Features Overview & UI Walkthrough

XMat3DSolidWork is a proprietary standalone 3D CAD system designed for intuitive modeling and multi-axis servo motion control/validation in complex semiconductor inspection equipment.

Let's take a tour of the core features and UI architecture through actual screenshots of the application (1 to 9).

---

### 1. Main Viewport & [File] Ribbon Tab (File Operations)

![Main Window and File Tab](images/1.png)

* **Top [File] Ribbon Tab**:
  * `New`, `Open`, `Save`, `Save As`: Losslessly serializes and restores solid parameters, 2D sketch geometric constraints, assembly/part hierarchy trees, and motion teaching data using our proprietary `.m3d` XML format specification.
* **Left Model Hierarchy Tree**:
  * Under the root `Model` node, independent parts and mechanism assemblies like `Base_Part`, `TransferY_Part`, `Chuck_Assembly`, `TransferX_Part`, and `3DSensor_Assembly` are displayed in a clean visual hierarchy.
* **Central 3D OpenTK Viewport**:
  * High-speed 60 FPS rendering with real-time selection highlights (yellow silhouette edges), inspection chamber bounding frames, rotating chuck, gantry transfer rails, and 3D optical displacement sensor head.
  * Synchronized with an interactive 3D **View Cube** (top-left) and a **PiP (Picture-in-Picture) mini viewport** (top-right) for instant multi-angle spatial awareness.
* **Bottom Docking Panels**:
  * `Debug Console`: Real-time logging of model loading, geometric operations, and constraint solver evaluation.
  * `Motion Settings Data`: Axis-by-axis jog control and teaching coordinates panel.

---

### 2. Part Context Menu (Part Management & Assembly Creation)

![Part Context Menu](images/2.png)

* **Treeview Part Right-Click Menu**:
  * **Rename**: Change unique part identifier (`TransferY_Part`, etc.).
  * **Semi-Transparent**: Toggle transparency on a per-part basis to inspect internal interference and sensor line-of-sight.
  * **Create New Part**: Instantiate a fresh independent part container.
  * **Reorder Tree**: `Move Up`, `Move Down`, `Move to Top`, and `Move to Bottom` to organize the model tree hierarchy.
  * **Create Assembly from Selected Parts**: Select multiple parts to group them into an independently movable Assembly unit immediately.

---

### 3. Assembly Context Menu (Mechanism Assembly Management)

![Assembly Context Menu](images/3.png)

* **Assembly Right-Click Menu**:
  * **Rename**: Assign meaningful drive-unit names such as `Chuck_Assembly` or `3DSensor_Assembly`.
  * **Semi-Transparent Visualization**: Batch-toggle transparency across all child parts and solid bodies in the assembly for internal mechanism inspection.
  * **Hierarchy Order Control**: Adjust topological order between assemblies in the tree.

---

### 4. [Modeling] Ribbon Tab (Modeling & Work Plane)

![Modeling Ribbon Tab](images/4.png)

* **History**: Multi-step `Undo` and `Redo` history stack support.
* **Solids Generation**:
  * `Create Base`: Generate ground datum reference block for equipment mounting.
  * `Add Box`, `Add Cylinder`, `Add Sphere`: Basic 3D primitive solids generation.
  * `Chamfer`: Edge C-chamfer machining operations on solids.
  * `Delete Solid`: Remove selected geometric features.
* **Motion Control**:
  * `Motion Settings`: Configure multi-axis servo mappings and parameters dialog.
  * `Run Motion` / `Stop Motion`: Start/pause real-time multi-axis kinematic simulation.
  * `Motion Home`: Return all servo axes back to their home datum coordinates simultaneously.
* **Work Plane Tools**:
  * `Align View`: Automatically align camera view normal to active work plane.
  * `Flip View`: 180° reverse view of current work plane.
  * `Rotate 180°`: Rotate viewport 180° around work plane axis.
  * `Clear Work Plane` & `Offset Work Plane`: Shift work plane incrementally along its normal vector.

---

### 5. Motion Settings - LM1 Axis Definition (Chuck Y-Axis Transfer)

![Motion Settings LM1](images/5.png)

* **CAD Sketch-Line Driven Servo Axis Definition (LM1)**:
  * **Moving Target**: Specifies target assembly to actuate (`Assembly: Chuck`).
  * **Path Sketch**: Designates the 2D sketch line acting as physical linear guide rail (`Sketch_TransferY`).
  * **Motion Range**: Start position (`-400.00mm`) to End position (`400.00mm`), Home origin (`0.00mm`).
  * **Kinematic Parameters**: Feed velocity (`100.00 mm/s`), Loop mode (`PingPong` reciprocating trajectory).
  * **Path Center Range**: Automatically calculates symmetrical stroke based on sketch line midpoint.

---

### 6. Motion Settings - LM2 Axis Definition (3D Sensor X-Axis Transfer)

![Motion Settings LM2](images/6.png)

* **Multi-Axis Servo Synchronization (LM2)**:
  * **Moving Target**: Designates upper sensor carriage (`Assembly: 3DSensor`).
  * **Path Sketch**: Designates orthogonal X-axis rail sketch (`Sketch_TransferX`).
  * **Reverse Direction**: Invert trajectory sign to match physical servo encoder polarity.
  * With LM1 (Chuck Y) and LM2 (Sensor X) running concurrently, the complete 2D raster scan trajectory of semiconductor inspection equipment is faithfully replicated in 3D space.

---

### 7. [View] Ribbon Tab (Display & Projection Options)

![View Ribbon Tab](images/7.png)

* **Projection**: Instant drop-down toggle between `3D (Perspective)` and `Front`, `Side`, `Top` orthographic projections.
* **Camera Sliders**: Fine adjustment for `Zoom` magnification and `Perspective` focal distance.
* **Display Toggles**:
  * `Show Axes` / `Show Coordinate Planes` / `Show Frames` / `Show Axis Names`.
  * `Show Mini Axes` / `Show Mini PiP` / `Show Corner Axes`.
  * `Work on Face`: Activate mode to select any solid surface as an instant 2D sketch plane.

---

### 8. Model Preferences Dialog (Camera & Background)

![Model Preferences Dialog](images/8.png)

* **Detailed Camera Controls**:
  * Zoom and perspective focal tuning (perspective distance 500).
  * Projection mode and background color presets (e.g. `BlanchedAlmond` tuned for industrial shop-floor visibility).
* **Axes & Display Tab**:
  * Customization of coordinate axis lengths, font sizes, and shading/lighting styles.

---

### 9. [Language] Ribbon Tab (Bilingual Switching & Persistence)

![Language Ribbon Tab](images/9.png)

* **One-Click Real-Time Language Switching**:
  * Clicking **한국어 (KR)** or **English (EN)** immediately translates all ribbon controls, tooltips, context menus, and dialogs without needing to restart the application.
  * The selected language is automatically saved to `XMat3DSolidWork.ini` and restored on next application launch.
