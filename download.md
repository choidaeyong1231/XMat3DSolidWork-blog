# 💾 프로그램 다운로드 (Release Installer)

> **XMat3DSolidWork 공식 NSIS 윈도우 설치 프로그램을 다운로드하여 간편하게 설치하고 실행해보실 수 있습니다.**

---

## 📦 공식 윈도우 설치 프로그램 (NSIS Setup)

<div style="background: linear-gradient(135deg, #f0f7ff 0%, #e6f0fa 100%); border: 1px solid #c8ddf2; border-radius: 10px; padding: 24px; margin: 20px 0; box-shadow: 0 4px 14px rgba(0, 122, 204, 0.08);">
  <h3 style="margin-top: 0; color: #005a9e;">🚀 XMat3DSolidWork v1.0.0 Setup (Installer)</h3>
  <p style="color: #444; line-height: 1.6;">
    독자 3D 솔리드 모델러, 2D 파라메트릭 스케치 구속조건 솔버, CSG 불리언(Extrude Cut / Chamfer), 어셈블리 파트 계층 구조 및 다축 기구 모션 시뮬레이터가 모두 포함된 <strong>공식 윈도우 인스톨러</strong>입니다.
  </p>
  
  <table style="width: 100%; margin: 16px 0; background: white; border-radius: 6px; overflow: hidden;">
    <tr>
      <td style="width: 30%; font-weight: bold; background: #f9fbfd;">설치 파일명</td>
      <td><code>XMat3DSolidWork_Setup_v1.0.0.exe</code></td>
    </tr>
    <tr>
      <td style="font-weight: bold; background: #f9fbfd;">인스톨러 규격</td>
      <td><strong>NSIS (Nullsoft Scriptable Install System) v2.46</strong></td>
    </tr>
    <tr>
      <td style="font-weight: bold; background: #f9fbfd;">설치 파일 크기</td>
      <td><strong>약 2.1 MB</strong> (LZMA Solid 고압축 패키징)</td>
    </tr>
    <tr>
      <td style="font-weight: bold; background: #f9fbfd;">설치 기능 지원</td>
      <td>바탕화면 및 시작메뉴 바로가기 등록, 제어판 프로그램 추가/제거(삭제 지원)</td>
    </tr>
    <tr>
      <td style="font-weight: bold; background: #f9fbfd;">대상 플랫폼</td>
      <td>Windows 10 / Windows 11 (64-bit)</td>
    </tr>
    <tr>
      <td style="font-weight: bold; background: #f9fbfd;">런타임 요구</td>
      <td>.NET Framework 4.7.2 이상, OpenGL 3.3+ 지원 GPU</td>
    </tr>
    <tr>
      <td style="font-weight: bold; background: #f9fbfd;">샘플 모델 포함</td>
      <td>반도체 검사 장비 샘플 <code>Sample/WaferThickness.m3d</code> 자동 설치</td>
    </tr>
  </table>

  <div style="text-align: center; margin-top: 20px;">
    <a href="downloads/XMat3DSolidWork_Setup_v1.0.0.exe" download style="display: inline-block; background-color: #007acc; color: white; font-size: 16px; font-weight: bold; padding: 12px 32px; border-radius: 6px; text-decoration: none; box-shadow: 0 4px 12px rgba(0, 122, 204, 0.35); transition: background-color 0.2s;">
      📥 XMat3DSolidWork 인스톨러 다운로드 (Setup.exe)
    </a>
    <p style="font-size: 12px; color: #666; margin-top: 8px;">다운로드 후 실행하시면 표준 윈도우 설치 마법사를 통해 즉시 설치됩니다.</p>
  </div>
</div>

---

## 🚀 빠른 시작 가이드 (Quick Start)

### 1. 설치 방법
1. 상단 다운로드 버튼을 클릭하여 `XMat3DSolidWork_Setup_v1.0.0.exe` 파일을 다운로드합니다.
2. 다운로드된 설치 파일을 실행합니다.
3. 설치 마법사의 안내에 따라 설치를 완료하면 바탕화면과 시작 메뉴에 **XMat3DSolidWork** 바로가기가 자동으로 생성됩니다.

### 2. 샘플 모델 열기 및 기구 모션 확인
1. 바탕화면의 **XMat3DSolidWork** 아이콘을 실행합니다.
2. 상단 좌측 **[File] → [Open]** 메뉴를 클릭합니다.
3. 설치 폴더 내 **`Sample/WaferThickness.m3d`** 파일을 엽니다.
4. 3D 뷰포트에서 반도체 두께 측정 스테이지 및 센서 어셈블리가 로드되는 것을 확인합니다.
5. 상단 리본 메뉴 **[Modeling] → [Motion Setup]** 또는 **[Run Motion]** 버튼을 눌러 부품별(Chuck, TransferX, Sensor) 다축 서보 연동 모션을 실시간으로 시뮬레이션할 수 있습니다.

---

## ✨ 포함된 주요 기능 및 특징

| 구분 | 주요 기능 | 설명 |
| :--- | :--- | :--- |
| **솔리드 모델링** | 프리미티브 & 2D 스케치 돌출 | Base, Box, Cylinder, Sphere 생성 및 2D 스케치 기반 3차원 Extrude |
| **CSG 가공** | Extrude Cut & Chamfer | 3D 형상 감산 가공 및 모따기 (모따기 중복 시 `_1`, `_2` 순번 자동 부여) |
| **2D 스케치 솔버** | 기하 구속조건(Constraint) | 일치, 수평, 수직, 직교, 평행, 치수 구속조건 실시간 연립방정식 해석 |
| **작업 평면 (Work Plane)** | 면 위 스케치 (Work on Face) | 임의 3D 표면 법선 벡터 기반 작업 평면 정렬 및 시점 자동 전환 |
| **어셈블리 & 파트 트리** | Assembly - Part 계층화 | 부품별 독립 Part 분리, 트리 드래그 이동 및 가시성/투명도 제어 |
| **다축 모션 시뮬레이터** | 서보 축 매핑 및 티칭 | Motion Path 라인 지정, Jog +/- 수동 제어, 위치 데이터 맵 시뮬레이션 |
| **뷰 디스플레이 설정** | 리본 뷰 탭 즉각 반영 | 바운딩 박스 Frame Color, Label Font Size, Background Color 실시간 변경 |
| **다국어 & UI** | Krypton Ribbon UI | 한국어 / 영어 런타임 실시간 전환 지원 |

---

## 🖥 시스템 요구 사양

* **운영체제**: Microsoft Windows 10 / 11 (64-bit 권장)
* **.NET 런타임**: Microsoft .NET Framework 4.7.2 이상 (Windows 10/11 기본 탑재)
* **그래픽 카드**: OpenGL 3.3 이상을 지원하는 NVIDIA / AMD / Intel 그래픽 카드
* **설치 프로그램**: NSIS v2.46 기반 표준 윈도우 인스톨러 (제어판 언인스톨러 내장)

---

## 📝 릴리즈 노트 (Release Notes)

### v1.0.0 (Release)
- **공식 NSIS 인스톨러 패키징**: `XMat3DSolidWork_Setup_v1.0.0.exe` 지원 (바탕화면/시작메뉴 등록 및 제어판 프로그램 추가/제거 완벽 연동)
- **모따기(Chamfer) 중복 순번 자동 부여**: 동일 형상에 모따기 연속 적용 시 `_1`, `_2` 순번 자동 할당 및 기존 `.m3d` 문서 로드 시 중복 명칭 자동 정규화
- **리본 뷰 탭 디스플레이 제어 추가**: 바운딩 박스 외곽선 색상(`Frame Color`), 라벨 폰트 크기(`Font Size`), 배경색(`Background`) 리본 콤보박스 연동 및 3D 뷰포트 즉시 렌더링 반영
- **고속 OpenGL 렌더링 최적화**: 미사용 구버전 코드 및 셰이더 컴파일 루틴 정리로 런타임 성능 및 바이너리 크기 최적화
- **안정적인 다축 모션 구동**: 다중 축 동시 이동 및 조그 인터폴레이션 정밀도 향상
