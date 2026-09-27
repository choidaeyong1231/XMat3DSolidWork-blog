@echo off
chcp 65001 > nul
title XMat3DSolidWork Blog Local Server
echo [XMat3DSolidWork 블로그 로컬 서버 실행 중...]
powershell -ExecutionPolicy Bypass -File "%~dp0serve.ps1"
pause
