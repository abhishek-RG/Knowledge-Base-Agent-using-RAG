#!/bin/bash

# Setup script for Knowledge Base RAG System
# This script helps set up the development environment

echo "🚀 Setting up Knowledge Base RAG System..."

# Check Python version
echo "📦 Checking Python version..."
python3 --version || { echo "❌ Python 3.11+ required"; exit 1; }

# Check Node.js version
echo "📦 Checking Node.js version..."
node --version || { echo "❌ Node.js 18+ required"; exit 1; }

# Backend setup
echo "🔧 Setting up backend..."
cd backend
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo "✅ Created virtual environment"
fi

source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
echo "✅ Backend dependencies installed"

if [ ! -f ".env" ]; then
    cp .env.example .env
    echo "✅ Created .env file - please edit with your credentials"
else
    echo "ℹ️  .env file already exists"
fi

cd ..

# Frontend setup
echo "🔧 Setting up frontend..."
cd frontend
npm install
echo "✅ Frontend dependencies installed"

if [ ! -f ".env" ]; then
    cp .env.example .env
    echo "✅ Created .env file - please edit with API URL"
else
    echo "ℹ️  .env file already exists"
fi

cd ..

# Create necessary directories
echo "📁 Creating necessary directories..."
mkdir -p backend/vectorstore
mkdir -p backend/uploads
echo "✅ Directories created"

echo ""
echo "✅ Setup complete!"
echo ""
echo "📝 Next steps:"
echo "1. Edit backend/.env with your API keys and credentials"
echo "2. Edit frontend/.env with your API URL"
echo "3. Start backend: cd backend && source venv/bin/activate && uvicorn app:app --reload"
echo "4. Start frontend: cd frontend && npm run dev"
echo ""
echo "📚 See README_PRODUCTION.md for more information"

