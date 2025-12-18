# Simple script to start backend with proper network settings
Write-Host "🚀 Starting Backend Server..." -ForegroundColor Green
Write-Host ""

cd backend

# Check if venv exists
if (-not (Test-Path "venv")) {
    Write-Host "Creating virtual environment..." -ForegroundColor Yellow
    python -m venv venv
}

# Activate venv
Write-Host "Activating virtual environment..." -ForegroundColor Cyan
& .\venv\Scripts\Activate.ps1

# Check if dependencies installed
if (-not (Test-Path "venv\Lib\site-packages\fastapi")) {
    Write-Host "Installing dependencies..." -ForegroundColor Yellow
    pip install --upgrade pip -q
    pip install -r requirements.txt
}

# Check port availability
Write-Host "Checking port 8000..." -ForegroundColor Cyan
$portCheck = netstat -ano | findstr ":8000" | findstr "LISTENING"
if ($portCheck) {
    Write-Host "⚠️  Port 8000 is already in use!" -ForegroundColor Red
    Write-Host "Try: netstat -ano | findstr :8000" -ForegroundColor Yellow
    Write-Host "Or use: uvicorn app:app --reload --port 8001" -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ Port 8000 is available" -ForegroundColor Green
Write-Host ""
Write-Host "Starting server on http://127.0.0.1:8000" -ForegroundColor Cyan
Write-Host "API docs: http://127.0.0.1:8000/docs" -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop" -ForegroundColor Yellow
Write-Host ""

# Start server using run.py (Windows-optimized)
python run.py

