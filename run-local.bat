@echo off
REM Batch script to run the Knowledge Base RAG system locally
REM Run this script from the project root directory

echo.
echo ========================================
echo  Knowledge Base RAG System - Local Run
echo ========================================
echo.

REM Check if .env files exist
if not exist "backend\.env" (
    echo Creating backend\.env from template...
    copy "backend\.env.example" "backend\.env" >nul 2>&1
    echo WARNING: Please edit backend\.env and add your GEMINI_API_KEY
)

if not exist "frontend\.env" (
    echo Creating frontend\.env from template...
    copy "frontend\.env.example" "frontend\.env" >nul 2>&1
)

REM Check Python
echo Checking Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python not found. Please install Python 3.11+
    pause
    exit /b 1
)

REM Check Node.js
echo Checking Node.js...
node --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Node.js not found. Please install Node.js 18+
    pause
    exit /b 1
)

echo.
echo ========================================
echo  Setup Complete!
echo ========================================
echo.
echo Next steps:
echo 1. Edit backend\.env and add your GEMINI_API_KEY
echo 2. Open TWO terminal windows
echo.
echo Terminal 1 - Backend:
echo   cd backend
echo   venv\Scripts\activate
echo   uvicorn app:app --reload
echo.
echo Terminal 2 - Frontend:
echo   cd frontend
echo   npm run dev
echo.
echo Then visit: http://localhost:3000
echo.
pause

