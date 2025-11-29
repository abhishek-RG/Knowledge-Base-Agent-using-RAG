# Streamlit Secrets Configuration

This directory contains configuration for Streamlit secrets.

## Local Development

1. Copy the template file:
   ```bash
   cp .streamlit/secrets.toml.template .streamlit/secrets.toml
   ```
   Or manually create `.streamlit/secrets.toml` with your API key:
   ```toml
   GEMINI_API_KEY = "your-actual-api-key-here"
   ```

2. The `secrets.toml` file is already in `.gitignore` and will not be committed.

## Streamlit Cloud Deployment

When deploying to Streamlit Cloud:

1. Go to your app on [Streamlit Cloud](https://share.streamlit.io/)
2. Navigate to: **Settings** → **Secrets**
3. Add your secrets in TOML format:
   ```toml
   GEMINI_API_KEY = "your-actual-api-key-here"
   ```

The application will automatically use Streamlit secrets when deployed on Streamlit Cloud, and fall back to `.env` file or environment variables for local development.

## Priority Order

The application checks for API keys in this order:
1. **Streamlit secrets** (for Streamlit Cloud)
2. **Environment variables** (from `.env` file or system)
3. **Empty string** (if not found)

## Security Notes

- ✅ Never commit `secrets.toml` with actual API keys
- ✅ The template file (`secrets.toml`) is safe to commit (contains placeholder)
- ✅ Use Streamlit Cloud secrets for production deployments
- ✅ Use `.env` file for local development (already in `.gitignore`)

