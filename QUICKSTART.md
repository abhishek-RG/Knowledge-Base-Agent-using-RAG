# 🚀 Quick Start Guide

## Step 1: Install Dependencies

```bash
cd kb_agent
pip install -r requirements.txt
```

## Step 2: Set Your API Key

**Option A: Environment Variable (Recommended)**
```bash
# Windows PowerShell
$env:GEMINI_API_KEY="your-api-key-here"

# macOS/Linux
export GEMINI_API_KEY="your-api-key-here"
```

**Option B: Edit config.py**
```python
GEMINI_API_KEY = "your-api-key-here"
```

## Step 3: Run the Application

```bash
streamlit run app.py
```

## Step 4: Use the Application

1. **Upload Documents**: Use the sidebar to upload PDF, DOCX, or TXT files
2. **Process**: Click "Process & Build Knowledge Base"
3. **Ask Questions**: Type your question and get AI-powered answers!

## 📝 Example Workflow

1. Upload a PDF document (e.g., a research paper or manual)
2. Click "Process & Build Knowledge Base"
3. Wait for processing (you'll see progress indicators)
4. Ask: "What is the main topic of this document?"
5. Get answer with source citations
6. Explore related questions

## ⚠️ Troubleshooting

- **API Key Error**: Make sure GEMINI_API_KEY is set correctly
- **Import Errors**: Run `pip install -r requirements.txt` again
- **No Documents**: Upload at least one document before processing

## 🎯 Next Steps

- Read the full [README.md](README.md) for detailed documentation
- Customize settings in `config.py`
- Explore the code structure to understand the RAG pipeline

Happy querying! 🎉

