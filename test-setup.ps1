# Quick test script to verify setup
Write-Host "🧪 Testing Setup..." -ForegroundColor Cyan
Write-Host ""

# Check .env files
Write-Host "Checking .env files..." -ForegroundColor Yellow
if (Test-Path "backend\.env") {
    Write-Host "✅ backend\.env exists" -ForegroundColor Green
} else {
    Write-Host "❌ backend\.env missing" -ForegroundColor Red
}

if (Test-Path "frontend\.env") {
    Write-Host "✅ frontend\.env exists" -ForegroundColor Green
} else {
    Write-Host "❌ frontend\.env missing" -ForegroundColor Red
}

# Check directories
Write-Host ""
Write-Host "Checking directories..." -ForegroundColor Yellow
if (Test-Path "backend\vectorstore") {
    Write-Host "✅ backend\vectorstore exists" -ForegroundColor Green
} else {
    Write-Host "⚠️  backend\vectorstore missing (will be created)" -ForegroundColor Yellow
}

if (Test-Path "backend\uploads") {
    Write-Host "✅ backend\uploads exists" -ForegroundColor Green
} else {
    Write-Host "⚠️  backend\uploads missing (will be created)" -ForegroundColor Yellow
}

# Check API key
Write-Host ""
Write-Host "Checking API key configuration..." -ForegroundColor Yellow
if (Test-Path "backend\.env") {
    $envContent = Get-Content "backend\.env" -Raw
    if ($envContent -match "GEMINI_API_KEY=your-gemini-api-key-here") {
        Write-Host "⚠️  GEMINI_API_KEY not configured - please edit backend\.env" -ForegroundColor Red
    } else {
        Write-Host "✅ GEMINI_API_KEY appears to be configured" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "✅ Setup check complete!" -ForegroundColor Green

