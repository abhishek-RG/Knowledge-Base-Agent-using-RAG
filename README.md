# 📚 Knowledge Base AI Agent

A production-ready **Knowledge Base AI Agent** with both Streamlit and FastAPI/Next.js implementations. This application allows you to upload documents (PDF, DOCX, DOC, TXT), build a searchable knowledge base, and ask questions using an advanced RAG (Retrieval Augmented Generation) pipeline with intelligent keyword matching and confidence scoring.

DEMO LINK OF THE VIDEO :- https://drive.google.com/file/d/1d0urVbzKfpDphgdJvDF55qSIoQrLoVHR/view?usp=sharing watch a demo video to understand the simple workflow of the DEPLOYED WEBAPP using Streamlit cloud

ALSO CHECK OUT THE WEBAPP BY CLICKING ON THIS LINK:-https://abhishek-rg-knowledge-base-agent-using-rag-app-xy3dyq.streamlit.app/

## ✨ Key Features

### Core Capabilities
- 📄 **Multi-format Document Support**: Upload PDF, DOCX, DOC, and TXT files
- 🔍 **Intelligent Retrieval**: Enhanced FAISS-based vector similarity search with keyword matching
- 🤖 **AI-Powered Answers**: Uses Google Gemini 1.5 Flash for accurate, context-aware responses
- 📊 **Source Citations**: See exactly which documents and chunks were used for each answer
- 🎯 **Confidence Scores**: Get confidence scores based on retrieval similarity and keyword matching
- 💾 **Persistent Storage**: FAISS index persists across sessions
- 🎨 **Modern UI**: Professional interfaces available in both Streamlit and Next.js

### Advanced Features
- 🚫 **No Hallucination**: Answers are generated strictly from uploaded documents only
- 📝 **Complete Responses**: Comprehensive answers extracted directly from documents in point-wise format
- ✅ **Accurate Retrieval**: Enhanced retrieval with keyword extraction and hybrid scoring
- 📚 **File Management**: Database showing all uploaded files with delete functionality
- 🔄 **Seamless Chat**: Continuous chat interface that understands context and retrieves from knowledge base
- 🎓 **Explain Like I'm 10**: Toggle to simplify complex answers for easier understanding

## 🏗️ Architecture

### Streamlit Version (Simple)
```
Streamlit UI (app.py)
    ↓
Document Loader → Text Splitter → Embedder (Gemini)
    ↓
FAISS Vector Store (Local)
    ↓
Retriever → Generator (Gemini) → Answers
```

### Production Version (FastAPI + Next.js)
```
Next.js Frontend
    ↓
FastAPI Backend
    ↓
AWS S3 (Documents) + MongoDB (Metadata)
    ↓
FAISS Vector Store
    ↓
Google Gemini API
```

## 🛠️ Tech Stack

### Streamlit Version
- **Streamlit** (>=1.28.0): Web UI framework
- **LangChain** (>=0.1.0): Document processing and chain orchestration
- **Google Gemini API**: Embeddings and answer generation
- **FAISS** (>=1.7.4): Vector similarity search
- **Python 3.8+**: Core language

### Production Version
- **Backend**: FastAPI, LangChain, FAISS, MongoDB, AWS S3
- **Frontend**: Next.js 14, TypeScript, TailwindCSS
- **Infrastructure**: Docker, Nginx, AWS EC2

## 📦 Installation & Setup

### Prerequisites

- **Python 3.8 or higher** (Python 3.9+ recommended)
- **Google Gemini API Key** ([Get one here](https://makersuite.google.com/app/apikey))
- **pip** (Python package manager)
- **Node.js 18+** (for production version)
- **Docker & Docker Compose** (optional, for containerized deployment)

### Streamlit Version - Quick Start

#### 1. Clone or Download the Project

```bash
cd kb_agent
```

#### 2. Create a Virtual Environment

**Windows (PowerShell):**
```powershell
python -m venv venv
.\venv\Scripts\Activate.ps1
```

**macOS/Linux:**
```bash
python3 -m venv venv
source venv/bin/activate
```

#### 3. Install Dependencies

```bash
pip install --upgrade pip
pip install -r requirements.txt
```

#### 4. Configure Google Gemini API Key

**Option 1: Using .env file (Recommended)**
1. Create a `.env` file in the project root directory
2. Add your API key:
   ```
   GEMINI_API_KEY=your-api-key-here
   ```

**Option 2: Environment Variable**
```powershell
# Windows PowerShell
$env:GEMINI_API_KEY="your-api-key-here"

# macOS/Linux
export GEMINI_API_KEY="your-api-key-here"
```

**Option 3: Streamlit Secrets (for Streamlit Cloud)**
1. Create `.streamlit/secrets.toml`:
   ```toml
   GEMINI_API_KEY = "your-api-key-here"
   ```
2. Or add secrets in Streamlit Cloud dashboard

#### 5. Run the Application

```bash
streamlit run app.py
```

The application will open at `http://localhost:8501`

### Production Version - Quick Start

#### 1. Backend Setup

```bash
cd backend
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements.txt
cp .env.example .env
# Edit .env with your credentials
uvicorn app:app --reload
```

#### 2. Frontend Setup

```bash
cd frontend
npm install
cp .env.example .env
# Edit .env: NEXT_PUBLIC_API_URL=http://localhost:8000
npm run dev
```

#### 3. Access Application

- Frontend: http://localhost:3000
- Backend API: http://localhost:8000
- API Docs: http://localhost:8000/docs

### Docker Deployment

```bash
# Build and start
docker-compose up -d

# View logs
docker-compose logs -f

# Stop
docker-compose down
```

## 📁 Project Structure

```
kb_agent/
├── app.py                      # Streamlit application (root)
├── config.py                   # Configuration settings
├── requirements.txt            # Python dependencies
├── README.md                   # This file
│
├── backend/                    # FastAPI backend (production)
│   ├── app.py                 # FastAPI application
│   ├── api/                   # API routes
│   ├── core/                  # Configuration
│   ├── rag/                   # RAG pipeline
│   ├── services/              # External services (S3, MongoDB)
│   └── models/               # Pydantic models
│
├── frontend/                  # Next.js frontend (production)
│   ├── app/                  # Next.js pages
│   ├── components/           # React components
│   └── lib/                  # Utilities
│
├── loaders/                   # Document loaders
│   └── document_loader.py
│
├── rag/                       # RAG components (Streamlit version)
│   ├── embedder.py           # Embedding generation
│   ├── retriever.py          # Vector search
│   └── generator.py          # Answer generation
│
├── utils/                     # Helper utilities
│   ├── text_splitter.py
│   └── helpers.py
│
├── data/                      # Uploaded documents (auto-created)
├── vectorstore/               # FAISS index storage (auto-created)
└── .streamlit/                # Streamlit configuration
```

## ⚙️ Configuration

### Streamlit Version

Edit `config.py` to customize settings:

```python
# Text Splitting Configuration
CHUNK_SIZE = 1000          # Characters per chunk
CHUNK_OVERLAP = 200        # Overlap between chunks

# Retrieval Configuration
TOP_K_CHUNKS = 5           # Number of chunks to retrieve

# RAG Configuration
TEMPERATURE = 0.7          # LLM creativity (0.0-1.0)
MAX_TOKENS = 1000          # Maximum response length
```

### Production Version

Edit `backend/core/config.py` or set environment variables in `backend/.env`:

```env
GEMINI_API_KEY=your-key
AWS_ACCESS_KEY_ID=your-aws-key
AWS_SECRET_ACCESS_KEY=your-aws-secret
S3_BUCKET_NAME=your-bucket
MONGODB_URI=mongodb+srv://...
```

## 🔧 How It Works

### 1. Document Ingestion
- Documents are loaded using LangChain document loaders
- Text is extracted and cleaned
- Documents are split into overlapping chunks (1000 chars with 200 char overlap)
- Metadata (source file, chunk index) is preserved

### 2. Embedding Generation
- Each chunk is embedded using Google Gemini Embeddings API (`models/embedding-001`)
- Embeddings are stored in FAISS vector database
- Index is saved to disk (`vectorstore/`) for persistence across sessions

### 3. Enhanced Query Processing
- **Keyword Extraction**: Important keywords are extracted from user query
- **Query Expansion**: Query is expanded with extracted keywords for better matching
- **Hybrid Retrieval**: 
  - Semantic similarity search (70% weight)
  - Keyword matching (30% weight)
  - Retrieves 3x candidates, filters to top results
- **Context Understanding**: Analyzes question context and retrieves relevant chunks

### 4. Answer Generation with Confidence
- Retrieved chunks are formatted as context
- Context + question is sent to Gemini 1.5 Flash
- **Confidence Score Calculation**:
  - 50% best similarity score
  - 30% average similarity score
  - 10% consistency (score variance)
  - 10% keyword match boost
- LLM generates point-wise answer with source citations
- Confidence score displayed with color coding (green/yellow/red)

## 🚀 Deployment

### Streamlit Cloud

1. Push code to GitHub
2. Go to [Streamlit Cloud](https://share.streamlit.io/)
3. Connect your repository
4. Add secrets in Settings → Secrets:
   ```toml
   GEMINI_API_KEY = "your-actual-api-key-here"
   ```
5. Deploy!

### Production Deployment (AWS EC2)

1. **Launch EC2 Instance**
   - OS: Ubuntu 22.04 LTS
   - Instance Type: t3.medium or larger
   - Security Group: Open ports 22, 80, 443, 8000, 3000

2. **Install Docker & Docker Compose**
   ```bash
   curl -fsSL https://get.docker.com -o get-docker.sh
   sudo sh get-docker.sh
   sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   sudo chmod +x /usr/local/bin/docker-compose
   ```

3. **Deploy Application**
   ```bash
   git clone <your-repository-url> kb_agent
   cd kb_agent
   # Configure .env files
   docker-compose up -d
   ```

4. **Set Up Nginx & SSL**
   ```bash
   sudo apt install nginx certbot python3-certbot-nginx -y
   sudo certbot --nginx -d your-domain.com
   ```

5. **Configure Nginx**
   - Copy `nginx/nginx.conf` to `/etc/nginx/sites-available/kb_rag`
   - Update domain name in config
   - Enable site and reload nginx

### AWS S3 Setup

1. Create S3 bucket for document storage
2. Create IAM user with S3 access
3. Add credentials to `backend/.env`:
   ```env
   AWS_ACCESS_KEY_ID=your-key
   AWS_SECRET_ACCESS_KEY=your-secret
   S3_BUCKET_NAME=your-bucket
   AWS_REGION=us-east-1
   ```

### MongoDB Atlas Setup

1. Create MongoDB Atlas cluster
2. Create database user
3. Whitelist EC2 IP address
4. Get connection string and add to `backend/.env`:
   ```env
   MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/kb_rag
   ```

## 📡 API Endpoints (Production Version)

### Health Check
```
GET /api/health/
```

### Upload File
```
POST /api/upload/
Content-Type: multipart/form-data
Body: file
```

### Query Knowledge Base
```
POST /api/query/
Content-Type: application/json
Body: {
  "question": "Your question",
  "explain_like_10": false,
  "top_k": 5
}
```

### List Files
```
GET /api/files/?skip=0&limit=100
```

### Delete File
```
DELETE /api/files/{file_id}
```

## 🐛 Troubleshooting

### "GEMINI_API_KEY not found"
**Solution:**
1. Check that you've set the API key using one of the methods above
2. If using `.env` file, ensure it's in the project root directory
3. Restart the application after setting the key
4. Verify the key is correct by checking [Google AI Studio](https://makersuite.google.com/app/apikey)

### "Vector store not found"
**Solution:**
1. Upload and process documents first
2. Check that `vectorstore/` directory exists and has `index.faiss` and `index.pkl` files
3. If files are corrupted, delete `vectorstore/` directory and re-upload documents

### Import Errors
**Solution:**
1. Ensure virtual environment is activated
2. Reinstall dependencies: `pip install -r requirements.txt --upgrade`
3. Check Python version: `python --version` (should be 3.8+)

### Document Loading Fails
**Solution:**
1. Verify file format is supported (PDF, DOCX, DOC, TXT)
2. Check file is not corrupted or password-protected
3. Ensure file size is reasonable (< 200MB per file)

### Network Errors (Production Backend)
**Solution:**
1. Use `127.0.0.1` instead of `0.0.0.0` on Windows
2. Check port is not already in use: `netstat -ano | findstr :8000`
3. Verify CORS settings in `backend/core/config.py`
4. Update frontend `.env` with correct API URL

### Upload Errors
**Solution:**
1. Ensure backend is running
2. Check `backend/uploads` directory exists
3. Verify file size limits
4. Check backend logs for detailed errors

## 📝 API Key Information

### Getting a Google Gemini API Key

1. Visit [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Sign in with your Google account
3. Click "Create API Key"
4. Copy the generated key
5. Add it to your `.env` file or set as environment variable

### API Usage

- **Embeddings**: Uses `models/embedding-001` for document embeddings
- **Generation**: Uses latest available Gemini model (auto-detected) for answer generation
- **Cost**: Check [Google AI Pricing](https://ai.google.dev/pricing) for current rates
- **Rate Limits**: Be aware of API rate limits for production use

### Security Best Practices

- ✅ Never commit API keys to version control
- ✅ Use `.env` file and add to `.gitignore`
- ✅ Rotate API keys periodically
- ✅ Use environment variables in production
- ✅ Monitor API usage to avoid unexpected costs

## 🎯 Use Cases

- **Resume Analysis**: Upload resumes and ask about skills, experience, education
- **Document Q&A**: Ask specific questions about contracts, policies, manuals
- **Research Papers**: Extract information from research papers and articles
- **Knowledge Base**: Build a searchable knowledge base from your documents
- **Content Analysis**: Analyze and summarize document content

## 🔄 Migration from Streamlit to Production

If you're migrating from the Streamlit version to the production stack:

1. **Export Existing Documents**: Copy files from `data/` directory
2. **Upload to S3**: Use the new upload interface or AWS CLI
3. **Rebuild Vectorstore**: Upload documents through new system to rebuild
4. **Update Configuration**: Copy API keys and settings to `backend/.env`
5. **Test Thoroughly**: Verify all features work before switching

## 📈 Performance & Scaling

- Vector search optimized with FAISS
- Async FastAPI endpoints for better performance
- React Query for frontend caching
- Nginx reverse proxy for load balancing
- Docker containerization for easy scaling
- Horizontal scaling: Use load balancer with multiple EC2 instances
- Database: Upgrade MongoDB Atlas tier for production
- Caching: Add Redis for session/query caching

## 📄 License

This project is open source and available for use.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📧 Support

For issues or questions:
- Open an issue on the repository
- Check the troubleshooting section above
- Review the code comments for implementation details

---

**Built with ❤️ using Streamlit, FastAPI, Next.js, LangChain, Google Gemini, FAISS, and AWS**

*Last Updated: 2024 - Version 2.0*
