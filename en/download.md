# 💾 Download Installer (Release)

> **Download the official XMat3DSolidWork NSIS Windows installer to install and run the 3D modeler with a single click.**

---

## 📦 Official Windows Installer (NSIS Setup)

<div style="background: linear-gradient(135deg, #f0f7ff 0%, #e6f0fa 100%); border: 1px solid #c8ddf2; border-radius: 10px; padding: 24px; margin: 20px 0; box-shadow: 0 4px 14px rgba(0, 122, 204, 0.08);">
  <h3 style="margin-top: 0; color: #005a9e;">🚀 XMat3DSolidWork v1.0.0 Setup (Installer)</h3>
  <p style="color: #444; line-height: 1.6;">
    Complete standalone engineering package containing the 3D solid modeler, 2D parametric sketch solver, CSG boolean operations, assembly/part tree manager, and multi-axis mechanism motion simulator.
  </p>
  
  <table style="width: 100%; margin: 16px 0; background: white; border-radius: 6px; overflow: hidden;">
    <tr>
      <td style="width: 30%; font-weight: bold; background: #f9fbfd;">Installer Filename</td>
      <td><code>XMat3DSolidWork_Setup_v1.0.0.exe</code></td>
    </tr>
    <tr>
      <td style="font-weight: bold; background: #f9fbfd;">Installer Standard</td>
      <td><strong>NSIS (Nullsoft Scriptable Install System) v2.46</strong></td>
    </tr>
    <tr>
      <td style="font-weight: bold; background: #f9fbfd;">Installer Size</td>
      <td><strong>~2.1 MB</strong> (LZMA Solid Ultra-compression)</td>
    </tr>
    <tr>
      <td style="font-weight: bold; background: #f9fbfd;">Supported Features</td>
      <td>Desktop & Start Menu shortcuts, Control Panel Add/Remove Programs (Clean Uninstaller)</td>
    </tr>
    <tr>
      <td style="font-weight: bold; background: #f9fbfd;">Target Platform</td>
      <td>Windows 10 / Windows 11 (64-bit)</td>
    </tr>
    <tr>
      <td style="font-weight: bold; background: #f9fbfd;">Runtime Requirements</td>
      <td>.NET Framework 4.7.2 or higher, OpenGL 3.3+ capable GPU</td>
    </tr>
    <tr>
      <td style="font-weight: bold; background: #f9fbfd;">Bundled Sample</td>
      <td>Semiconductor Wafer Inspection Stage model <code>Sample/WaferThickness.m3d</code> included</td>
    </tr>
  </table>

  <div style="text-align: center; margin-top: 20px;">
    <a href="downloads/XMat3DSolidWork_Setup_v1.0.0.exe" download style="display: inline-block; background-color: #007acc; color: white; font-size: 16px; font-weight: bold; padding: 12px 32px; border-radius: 6px; text-decoration: none; box-shadow: 0 4px 12px rgba(0, 122, 204, 0.35); transition: background-color 0.2s;">
      📥 Download XMat3DSolidWork Installer (Setup.exe)
    </a>
    <p style="font-size: 12px; color: #666; margin-top: 8px;">Run the installer and follow the setup wizard for instant installation.</p>
  </div>
</div>

---

## 🚀 Quick Start Guide

### 1. Installation
1. Click the download button above to download `XMat3DSolidWork_Setup_v1.0.0.exe`.
2. Run the downloaded installer.
3. Follow the wizard steps to complete the installation. Shortcuts will be created on your Desktop and Start Menu.

### 2. Loading the Sample Model & Testing Motion
1. Launch **XMat3DSolidWork** from your desktop.
2. Click **[File] → [Open]** on the top ribbon.
3. Select `Sample/WaferThickness.m3d` from the installation directory.
4. Verify the 3D semiconductor inspection stage and sensor assembly loaded in the viewport.
5. In the top ribbon, click **[Modeling] → [Motion Setup]** or **[Run Motion]** to watch the Chuck, TransferX, and Sensor axes simulate simultaneous coordinated motion.

---

## ✨ Included Features & Capabilities

| Module | Core Features | Highlights |
| :--- | :--- | :--- |
| **Solid Modeling** | Primitives & 2D Profile Extrusion | Base, Box, Cylinder, Sphere; fast polygon extrusion |
| **CSG Operations** | Extrude Cut & Edge Chamfer | Subtraction cuts, edge chamfers with auto sequence numbering (`_1`, `_2`) |
| **2D Sketch Solver** | Geometric Constraints | Coincident, Horizontal, Vertical, Perpendicular, Parallel, Dimension solver |
| **Work Plane** | Sketch on Solid Surface (Work on Face) | Normal-vector based coordinate alignment and automatic view alignment |
| **Assembly Tree** | Assembly - Part Hierarchy | Multi-part isolation, drag-and-drop tree operations, opacity control |
| **Motion Simulator** | Multi-Axis Servo Teaching | Motion Path lines, Jog (+/-) control, position map simulation |
| **Display Options** | Ribbon View Tab Live Controls | Bounding box Frame Color, Label Font Size, Background Color live updates |
| **UI & Languages** | Krypton Ribbon UI | Real-time bilingual Korean / English interface switching |

---

## 🖥 System Requirements

* **Operating System**: Microsoft Windows 10 / 11 (64-bit recommended)
* **.NET Runtime**: Microsoft .NET Framework 4.7.2 or higher (pre-installed on Windows 10/11)
* **Graphics Hardware**: NVIDIA, AMD, or Intel GPU with OpenGL 3.3 or higher support
* **Installer**: NSIS v2.46 standard Windows installer with uninstaller integration

---

## 📝 Release Notes

### v1.0.0 (Release)
- **Official NSIS Windows Installer**: `XMat3DSolidWork_Setup_v1.0.0.exe` with desktop shortcut and uninstaller
- **Chamfer Duplicate Auto-Numbering**: Automatic sequence numbers (`_1`, `_2`...) on multiple chamfers and automatic name normalization when loading legacy `.m3d` files
- **Ribbon View Tab Display Controls**: Added live combo boxes for `Frame Color`, `Font Size`, and `Background` color with instant 3D viewport update
- **High-Speed OpenGL Optimization**: Cleaned legacy shader compilation routines and unused code paths for optimized execution
- **Multi-Axis Motion Stability**: Enhanced simultaneous axis travel and jog interpolation precision
