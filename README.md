# 📚 Knowledge Base AI Agent

A production-ready **Knowledge Base AI Agent** built with **Streamlit**, **LangChain**, **Google Gemini API**, and **FAISS**. This application allows you to upload documents (PDF, DOCX, DOC, TXT), build a searchable knowledge base, and ask questions using an advanced RAG (Retrieval Augmented Generation) pipeline with intelligent keyword matching and confidence scoring.

## ✨ Key Features

### Core Capabilities
- 📄 **Multi-format Document Support**: Upload PDF, DOCX, DOC, and TXT files
- 🔍 **Intelligent Retrieval**: Enhanced FAISS-based vector similarity search with keyword matching
- 🤖 **AI-Powered Answers**: Uses Google Gemini 1.5 Flash for accurate, context-aware responses
- 📊 **Source Citations**: See exactly which documents and chunks were used for each answer
- 🎯 **Confidence Scores**: Get confidence scores based on retrieval similarity and keyword matching
- 💾 **Persistent Storage**: FAISS index persists across sessions
- 🎨 **Modern UI**: Professional, deployable Streamlit interface with always-visible sidebar

### Advanced Features
- 🚫 **No Hallucination**: Answers are generated strictly from uploaded documents only
- 📝 **Complete Responses**: Comprehensive answers extracted directly from documents in point-wise format
- ✅ **Accurate Retrieval**: Enhanced retrieval with keyword extraction and hybrid scoring
- 📚 **File Management**: Sidebar database showing all uploaded files with delete functionality
- 🔄 **Seamless Chat**: Continuous chat interface that understands context and retrieves from knowledge base
- 🎓 **Explain Like I'm 10**: Toggle to simplify complex answers for easier understanding

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│              Streamlit UI (app.py)                          │
│  • Always-visible sidebar with file uploader               │
│  • File database with delete functionality                 │
│  • Chat interface with confidence scores                   │
└───────────────────────┬─────────────────────────────────────┘
                        │
        ┌───────────────┴───────────────┐
        │                               │
┌───────▼────────┐            ┌────────▼────────┐
│ Document       │            │   RAG Pipeline  │
│ Loader         │            │                 │
│                │            │  ┌───────────┐  │
│ • PDF          │            │  │ Embedder  │  │
│ • DOCX         │───────────▶│  │ (Gemini)  │  │
│ • DOC          │            │  └─────┬─────┘  │
│ • TXT          │            │        │        │
└────────────────┘            │  ┌─────▼─────┐  │
                              │  │  FAISS    │  │
                              │  │ Vector DB │  │
                              │  └─────┬─────┘  │
                              │        │        │
                              │  ┌─────▼─────┐  │
                              │  │ Retriever │  │
                              │  │ Enhanced  │  │
                              │  │ • Keyword │  │
                              │  │ • Hybrid  │  │
                              │  │   Scoring │  │
                              │  └─────┬─────┘  │
                              │        │        │
                              │  ┌─────▼─────┐  │
                              │  │ Generator │  │
                              │  │ (Gemini)  │  │
                              │  │ + Context │  │
                              │  │   Analysis│  │
                              │  └───────────┘  │
                              └─────────────────┘
```

## 🛠️ Tech Stack

- **Streamlit** (>=1.28.0): Web UI framework
- **LangChain** (>=0.1.0): Document processing and chain orchestration
- **LangChain Community** (>=0.0.20): Community integrations
- **LangChain Google GenAI** (>=2.0.0): Google Gemini integration
- **Google Gemini API**:
  - `models/embedding-001` for embeddings
  - `gemini-1.5-flash-latest` (or latest available) for answer generation
- **FAISS** (>=1.7.4): Vector similarity search
- **Python 3.8+**: Core language
- **Additional Libraries**: pypdf, python-docx, tiktoken, python-dotenv

## 📦 Installation & Local Setup

### Prerequisites

- **Python 3.8 or higher** (Python 3.9+ recommended)
- **Google Gemini API Key** ([Get one here](https://makersuite.google.com/app/apikey))
- **pip** (Python package manager)

### Step-by-Step Local Setup

#### 1. Clone or Download the Project

```bash
# If using git
git clone <repository-url>
cd kb_agent

# Or navigate to the project directory if already downloaded
cd path/to/kb_agent
```

#### 2. Create a Virtual Environment (Highly Recommended)

**Windows (PowerShell):**
```powershell
# Create virtual environment
python -m venv venv

# Activate virtual environment
.\venv\Scripts\Activate.ps1

# If you get an execution policy error, run:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**Windows (Command Prompt):**
```cmd
python -m venv venv
venv\Scripts\activate
```

**macOS/Linux:**
```bash
# Create virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate
```

#### 3. Install Dependencies

```bash
# Make sure virtual environment is activated (you should see (venv) in your terminal)
pip install --upgrade pip
pip install -r requirements.txt
```

#### 4. Configure Google Gemini API Key

You have **three options** to set your API key:

**Option 1: Using .env file (Recommended)**

1. Create a `.env` file in the project root directory (`kb_agent/.env`)
2. Add your API key:
   ```
   GEMINI_API_KEY=your-api-key-here
   ```
3. The application will automatically load it using `python-dotenv`

**Option 2: Environment Variable**

**Windows (PowerShell):**
```powershell
$env:GEMINI_API_KEY="your-api-key-here"
```

**Windows (Command Prompt):**
```cmd
set GEMINI_API_KEY=your-api-key-here
```

**macOS/Linux:**
```bash
export GEMINI_API_KEY="your-api-key-here"
```

**Option 3: Direct in config.py (Not Recommended for Production)**

Edit `config.py` and set:
```python
GEMINI_API_KEY = "your-api-key-here"
```

> **⚠️ Important**: Never commit your API key to version control. Use `.env` file and add it to `.gitignore`.

#### 5. Verify Installation

```bash
# Check if all packages are installed
pip list | grep -E "streamlit|langchain|faiss|google-generativeai"

# Or simply try importing
python -c "import streamlit; import langchain; print('All packages installed successfully!')"
```

## 🚀 Running the Application Locally

### Start the Application

```bash
# Make sure virtual environment is activated
streamlit run app.py
```

The application will:
1. Start a local Streamlit server
2. Open automatically in your default web browser at `http://localhost:8501`
3. If it doesn't open automatically, navigate to the URL shown in the terminal

### First-Time Usage

1. **Welcome Screen**: You'll see a welcome page with instructions and features
2. **Upload Documents**: 
   - Use the sidebar (always visible) to browse and upload files
   - Supported formats: PDF, DOCX, DOC, TXT
   - Files are automatically processed when uploaded
3. **Wait for Processing**: 
   - Progress bar shows processing status
   - Documents are chunked, embedded, and indexed
4. **Start Asking Questions**: 
   - Once processing completes, the chat interface appears
   - Type your question and get answers from your documents
   - Each answer includes a confidence score

## 📁 Project Structure

```
kb_agent/
│
├── app.py                      # Main Streamlit application
├── config.py                   # Configuration settings (API keys, paths, etc.)
├── requirements.txt            # Python dependencies
├── README.md                   # This file
├── .env                        # Environment variables (create this, not in repo)
│
├── data/                       # Uploaded documents (auto-created)
│   └── *.pdf, *.docx, etc.    # Your uploaded files
│
├── vectorstore/                # FAISS index storage (auto-created)
│   ├── index.faiss            # FAISS vector index
│   └── index.pkl              # Metadata pickle file
│
├── loaders/
│   └── document_loader.py      # Document loading utilities (PDF, DOCX, TXT)
│
├── rag/
│   ├── embedder.py            # Embedding generation & FAISS storage
│   ├── retriever.py          # Enhanced vector search with keyword matching
│   └── generator.py          # RAG pipeline & answer generation with confidence
│
└── utils/
    ├── text_splitter.py       # Text chunking utilities
    └── helpers.py             # Helper functions (file management, etc.)
```

## ⚙️ Configuration

Edit `config.py` to customize settings:

```python
# Text Splitting Configuration
CHUNK_SIZE = 1000          # Characters per chunk
CHUNK_OVERLAP = 200        # Overlap between chunks

# Retrieval Configuration
TOP_K_CHUNKS = 5           # Number of chunks to retrieve (increased for better context)

# RAG Configuration
TEMPERATURE = 0.7          # LLM creativity (0.0-1.0)
MAX_TOKENS = 1000          # Maximum response length

# API Configuration
GEMINI_EMBEDDING_MODEL = "models/embedding-001"
GEMINI_LLM_MODEL = None    # None = auto-detect latest model
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

## 🆕 Recent Updates & Improvements

### Version 2.0 - Enhanced Retrieval & UI

#### UI/UX Improvements
- ✅ **Always-visible Sidebar**: Sidebar stays open for easy file management
- ✅ **File Database**: View all uploaded files with size and delete option
- ✅ **Modern Professional UI**: Clean, deployable interface with dark theme
- ✅ **Welcome Page**: Clear instructions and feature showcase
- ✅ **Seamless Chat**: Continuous chat interface below file upload

#### Retrieval Enhancements
- ✅ **Keyword Extraction**: Automatically extracts important keywords from queries
- ✅ **Query Expansion**: Expands queries with relevant keywords for better matching
- ✅ **Hybrid Scoring**: Combines semantic similarity (70%) with keyword matching (30%)
- ✅ **Improved Context**: Increased TOP_K from 3 to 5 chunks for better understanding
- ✅ **Smart Filtering**: Retrieves more candidates, filters to best matches

#### Confidence Scoring
- ✅ **Multi-factor Confidence**: Calculates confidence using 4 factors
- ✅ **Visual Indicators**: Color-coded confidence scores (green/yellow/red)
- ✅ **Accuracy Metrics**: Better representation of retrieval quality

#### Document-Only Responses
- ✅ **Strict Prompting**: Enhanced prompts ensure answers only from uploaded documents
- ✅ **No Hallucination**: Explicit instructions prevent external knowledge usage
- ✅ **Context Analysis**: Step-by-step context understanding in prompts

#### Bug Fixes
- ✅ **Loop Prevention**: Fixed infinite processing loop on file upload
- ✅ **File Uploader Reset**: Automatic reset after successful processing
- ✅ **State Management**: Improved session state handling

## 🧪 Testing

The application includes comprehensive error handling for:
- Empty or invalid questions
- Missing or corrupted documents
- API key validation and errors
- Document ingestion failures
- Vector retrieval failures
- Network connectivity issues

## 🐛 Troubleshooting

### "GEMINI_API_KEY not found"
**Solution:**
1. Check that you've set the API key using one of the three methods above
2. If using `.env` file, ensure it's in the project root directory
3. Restart the Streamlit application after setting the key
4. Verify the key is correct by checking [Google AI Studio](https://makersuite.google.com/app/apikey)

### "Vector store not found"
**Solution:**
1. Upload and process documents first using the sidebar file uploader
2. Check that `vectorstore/` directory exists and has `index.faiss` and `index.pkl` files
3. If files are corrupted, delete `vectorstore/` directory and re-upload documents

### Import Errors
**Solution:**
1. Ensure virtual environment is activated
2. Reinstall dependencies: `pip install -r requirements.txt --upgrade`
3. Check Python version: `python --version` (should be 3.8+)
4. Try installing packages individually if specific imports fail

### Document Loading Fails
**Solution:**
1. Verify file format is supported (PDF, DOCX, DOC, TXT)
2. Check file is not corrupted or password-protected
3. Ensure file size is reasonable (< 200MB per file)
4. Try converting PDF to a different format if issues persist

### Application Runs in Loop
**Solution:**
1. This was fixed in recent updates
2. If you experience this, clear browser cache and restart the app
3. Check that you're using the latest version of the code

### Low Confidence Scores
**Solution:**
1. Ensure documents contain relevant information to your questions
2. Try rephrasing questions with more specific keywords
3. Upload more relevant documents to the knowledge base
4. Check that documents were processed successfully

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

## 📝 Future Improvements

- [ ] Multi-user support with authentication
- [ ] Cloud storage integration (Supabase, AWS S3)
- [ ] Advanced analytics dashboard
- [ ] Support for more file formats (Markdown, HTML, CSV)
- [ ] Conversation history persistence
- [ ] Export chat conversations (JSON, PDF)
- [ ] Docker deployment configuration
- [ ] Batch document processing
- [ ] Advanced filtering and search options
- [ ] Custom embedding models
- [ ] Multi-language support

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

## 🚀 Quick Start Summary

```bash
# 1. Navigate to project
cd kb_agent

# 2. Create and activate virtual environment
python -m venv venv
# Windows: venv\Scripts\activate
# macOS/Linux: source venv/bin/activate

# 3. Install dependencies
pip install -r requirements.txt

# 4. Set API key (create .env file)
echo "GEMINI_API_KEY=your-key-here" > .env

# 5. Run application
streamlit run app.py
```

**Built with ❤️ using Streamlit, LangChain, Google Gemini, and FAISS**

---

*Last Updated: 2024 - Version 2.0*
