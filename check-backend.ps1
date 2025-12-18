# Quick script to check if backend is running
Write-Host "Checking Backend Status..." -ForegroundColor Cyan
Write-Host ""

$backendRunning = $false
$portCheck = netstat -ano | findstr ":8000" | findstr "LISTENING"

if ($portCheck) {
    Write-Host "Backend is running on port 8000" -ForegroundColor Green
    $backendRunning = $true
} else {
    Write-Host "Backend is NOT running on port 8000" -ForegroundColor Red
}

Write-Host ""
Write-Host "Testing connection..." -ForegroundColor Cyan
try {
    $response = Invoke-WebRequest -Uri "http://127.0.0.1:8000/api/health/" -Method GET -TimeoutSec 5 -ErrorAction Stop
    Write-Host "Backend is responding!" -ForegroundColor Green
    Write-Host "Response: $($response.Content)" -ForegroundColor Gray
} catch {
    Write-Host "Cannot connect to backend" -ForegroundColor Red
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "To start the backend, run:" -ForegroundColor Cyan
    Write-Host "   cd backend" -ForegroundColor White
    Write-Host "   .\venv\Scripts\Activate.ps1" -ForegroundColor White
    Write-Host "   python run.py" -ForegroundColor White
}

Write-Host ""
Write-Host "Frontend API URL:" -ForegroundColor Cyan
$frontendEnv = Get-Content "frontend\.env" -ErrorAction SilentlyContinue
if ($frontendEnv) {
    Write-Host "   $frontendEnv" -ForegroundColor White
} else {
    Write-Host "   Not configured" -ForegroundColor Yellow
}
