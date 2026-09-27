# Krypton Ribbon UI & 다국어 아키텍처

> **산업용 소프트웨어의 생산성을 극대화하는 Fluent 리본 인터페이스와 무중단 실시간 한/영 다국어 전환 시스템**

---

## 1. Krypton Ribbon 툴킷 채택 배경

산업용 검사 소프트웨어는 기능의 수가 방대하여 기존의 구식 메뉴바와 툴바 구조로는 화면이 복잡해지고 엔지니어의 작업 효율이 저하됩니다.

XMat3DSolidWork는 **ComponentFactory.Krypton.Ribbon**을 도입하여:
1. **작업 흐름 기반 탭 분리**: 파일 작업 → 3D 모델링 → 시점 및 뷰 설정 → 언어 설정
2. **트리플 & 라인 복합 레이아웃**: 대형 아이콘 버튼, 콤보박스, 트랙바, 체크박스를 규격화된 리본 그리드 안에 효율적으로 고밀도 배치
3. **일관된 비주얼 테마**: Office 2010/2013 스타일의 모던한 블루 테마를 통해 높은 가독성 제공

---

## 2. 실시간 다국어 지원 엔진 (`LanguageManager`)

글로벌 반도체 팹 및 해외 생산 라인 배포를 위해 **프로그램 재시작 없이 즉시 언어가 전환되는 `LanguageManager`**를 구축했습니다.

### 1) 사전 기반 리소스 매핑
모든 UI 텍스트(리본 탭, 그룹, 버튼, 라벨, 체크박스, 컨텍스트 메뉴, 대화상자)를 `Dictionary<string, string[]>` 구조로 관리합니다:

```csharp
// [컨트롤 식별자 / 원문 키] = new string[] { "한국어", "English" }
AddMap("Work Plane", "작업 평면", "Work Plane");
AddMap("Projection", "투영", "Projection");
AddMap("Zoom / Perspective", "줌 / 원근", "Zoom / Perspective");
AddMap("Display", "표시", "Display");
AddMap("Show Axes", "축 표시", "Show Axes");
AddMap("Work on Face", "면에서 작업", "Work on Face");
AddMap("_buttonMotionPlus", "+", "+");
AddMap("_buttonMotionMinus", "-", "-");
```

### 2) 재귀적 폼 & 리본 트래버설 (Recursive Traversal)
언어 변경 이벤트(`LanguageChanged`)가 발생하면 열려 있는 모든 Form 및 KryptonRibbon의 계층 구조를 순회하며 텍스트를 즉각 갱신합니다:
* `KryptonRibbonTab.Text`
* `KryptonRibbonGroup.TextLine1`
* `KryptonRibbonGroupButton`, `CheckBox`, `Label`
* `ContextMenuStrip` 메뉴 항목

### 3) 환경 설정 영속화 (INI Persistence)
사용자가 언어를 변경하면 `XMat3DSolidWork.ini` 파일에 즉시 영속화되어, 소프트웨어를 재실행해도 마지막으로 선택한 언어 환경이 그대로 유지됩니다:

```ini
[Settings]
Language=Korean
SplitterDistance=220
DebugSplitterDistance=480
DebugConsolePinned=True
LastDocument=D:\Models\WaferThickness.m3d
```
