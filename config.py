"""
Configuration file for Knowledge Base Agent.
Loads configuration from .env file and environment variables.
"""

import os
from pathlib import Path
from dotenv import load_dotenv

# Load environment variables from .env file
BASE_DIR = Path(__file__).parent
ENV_FILE = BASE_DIR / ".env"

# Load .env file if it exists
if ENV_FILE.exists():
    load_dotenv(ENV_FILE)
else:
    # Try to load from parent directory as well
    load_dotenv(BASE_DIR.parent / ".env")

# Gemini API Configuration
# Read from environment (loaded from .env file or system environment)
def get_gemini_api_key():
    """Get Gemini API key from environment variable."""
    return os.getenv("GEMINI_API_KEY", "")

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

