"""
Configuration file for Knowledge Base Agent.
Loads configuration from Streamlit Secrets (Cloud) or .env file (local).
"""

import os
from pathlib import Path
from dotenv import load_dotenv

# Try to import streamlit (only available in Streamlit environment)
try:
    import streamlit as st
    STREAMLIT_AVAILABLE = True
except ImportError:
    STREAMLIT_AVAILABLE = False
    st = None

# Load environment variables from .env file (for local development)
BASE_DIR = Path(__file__).parent
ENV_FILE = BASE_DIR / ".env"

# Load .env file if it exists (for local development)
# Only load if Streamlit secrets are not available
should_load_env = True
if STREAMLIT_AVAILABLE and st is not None:
    try:
        # Check if Streamlit secrets are available
        if hasattr(st, 'secrets') and "GEMINI_API_KEY" in st.secrets:
            should_load_env = False  # Use Streamlit secrets instead
    except Exception:
        pass  # Continue to load .env if secrets check fails

if should_load_env:
    if ENV_FILE.exists():
        load_dotenv(ENV_FILE)
    else:
        # Try to load from parent directory as well
        load_dotenv(BASE_DIR.parent / ".env")

# Gemini API Configuration
# Priority: Streamlit Secrets > Environment Variable > .env file
def get_gemini_api_key():
    """
    Get Gemini API key with priority:
    1. Streamlit Secrets (Streamlit Cloud)
    2. Environment variable (system/env)
    3. .env file (local development)
    """
    # First, try Streamlit Secrets (for Streamlit Cloud)
    if STREAMLIT_AVAILABLE and st is not None:
        try:
            if hasattr(st, 'secrets') and "GEMINI_API_KEY" in st.secrets:
                return st.secrets["GEMINI_API_KEY"]
        except Exception:
            # If secrets not available, continue to other methods
            pass
    
    # Second, try environment variable
    api_key = os.getenv("GEMINI_API_KEY", "")
    if api_key:
        return api_key
    
    # Third, try .env file (already loaded above)
    api_key = os.getenv("GEMINI_API_KEY", "")
    return api_key

GEMINI_API_KEY = get_gemini_api_key()
# Use default embedding model (models/embedding-001 is the current default)
GEMINI_EMBEDDING_MODEL = "models/embedding-001"
GEMINI_LLM_MODEL = None  # None = use latest LLM model

# Project Paths
BASE_DIR = Path(__file__).parent
DATA_DIR = BASE_DIR / "data"
VECTORSTORE_DIR = BASE_DIR / "vectorstore"
VECTORSTORE_INDEX_PATH = VECTORSTORE_DIR / "index.faiss"
VECTORSTORE_PKL_PATH = VECTORSTORE_DIR / "index.pkl"

# Text Splitting Configuration
CHUNK_SIZE = 1000
CHUNK_OVERLAP = 200

# Retrieval Configuration
TOP_K_CHUNKS = 5  # Increased for better context understanding

# RAG Configuration
TEMPERATURE = 0.7
MAX_TOKENS = 1000

# Create directories if they don't exist
DATA_DIR.mkdir(exist_ok=True)
VECTORSTORE_DIR.mkdir(exist_ok=True)

