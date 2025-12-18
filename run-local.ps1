# PowerShell script to run the Knowledge Base RAG system locally
# Run this script from the project root directory

Write-Host "🚀 Starting Knowledge Base RAG System..." -ForegroundColor Green
Write-Host ""

# Check if .env files exist
if (-not (Test-Path "backend\.env")) {
    Write-Host "❌ backend\.env not found. Creating from template..." -ForegroundColor Yellow
    Copy-Item "backend\.env.example" "backend\.env" -ErrorAction SilentlyContinue
    Write-Host "⚠️  Please edit backend\.env and add your GEMINI_API_KEY" -ForegroundColor Yellow
}

if (-not (Test-Path "frontend\.env")) {
    Write-Host "❌ frontend\.env not found. Creating from template..." -ForegroundColor Yellow
    Copy-Item "frontend\.env.example" "frontend\.env" -ErrorAction SilentlyContinue
}

# Check Python
Write-Host "📦 Checking Python..." -ForegroundColor Cyan
$pythonVersion = python --version 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Python not found. Please install Python 3.11+" -ForegroundColor Red
    exit 1
}
Write-Host "✅ $pythonVersion" -ForegroundColor Green

# Check Node.js
Write-Host "📦 Checking Node.js..." -ForegroundColor Cyan
$nodeVersion = node --version 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Node.js not found. Please install Node.js 18+" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Node.js $nodeVersion" -ForegroundColor Green

# Setup Backend
Write-Host ""
Write-Host "🔧 Setting up backend..." -ForegroundColor Cyan
Set-Location backend

if (-not (Test-Path "venv")) {
    Write-Host "Creating virtual environment..." -ForegroundColor Yellow
    python -m venv venv
}

Write-Host "Activating virtual environment..." -ForegroundColor Yellow
& .\venv\Scripts\Activate.ps1

Write-Host "Installing backend dependencies..." -ForegroundColor Yellow
pip install --upgrade pip -q
pip install -r requirements.txt

# Create directories
New-Item -ItemType Directory -Force -Path "vectorstore" | Out-Null
New-Item -ItemType Directory -Force -Path "uploads" | Out-Null

Write-Host "✅ Backend setup complete" -ForegroundColor Green

# Setup Frontend
Write-Host ""
Write-Host "🔧 Setting up frontend..." -ForegroundColor Cyan
Set-Location ..\frontend

if (-not (Test-Path "node_modules")) {
    Write-Host "Installing frontend dependencies..." -ForegroundColor Yellow
    npm install
} else {
    Write-Host "Frontend dependencies already installed" -ForegroundColor Green
}

Write-Host "✅ Frontend setup complete" -ForegroundColor Green

# Check API key
Write-Host ""
Set-Location ..\backend
$envContent = Get-Content ".env" -Raw
if ($envContent -match "GEMINI_API_KEY=your-gemini-api-key-here" -or $envContent -match "GEMINI_API_KEY=$") {
    Write-Host "⚠️  WARNING: GEMINI_API_KEY not configured!" -ForegroundColor Red
    Write-Host "Please edit backend\.env and add your Gemini API key" -ForegroundColor Yellow
    Write-Host ""
    $continue = Read-Host "Continue anyway? (y/n)"
    if ($continue -ne "y") {
        exit 1
    }
}

# Start services
Write-Host ""
Write-Host "🚀 Starting services..." -ForegroundColor Green
Write-Host ""
Write-Host "Backend will start on: http://localhost:8000" -ForegroundColor Cyan
Write-Host "Frontend will start on: http://localhost:3000" -ForegroundColor Cyan
Write-Host ""
Write-Host "Press Ctrl+C to stop all services" -ForegroundColor Yellow
Write-Host ""

# Start backend in background
Set-Location ..\backend
$backendPath = (Get-Location).Path
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$backendPath'; .\venv\Scripts\Activate.ps1; Write-Host '🔧 Backend Server' -ForegroundColor Green; python run.py"

# Wait a bit for backend to start
Start-Sleep -Seconds 3

# Start frontend
Set-Location ..\frontend
Write-Host "Starting frontend..." -ForegroundColor Cyan
npm run dev

