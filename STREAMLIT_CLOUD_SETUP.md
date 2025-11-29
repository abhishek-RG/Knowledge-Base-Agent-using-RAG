# Streamlit Cloud Setup Guide

This document explains how to configure your Knowledge Base Agent to work with Streamlit Cloud secrets.

## ✅ What Was Changed

### 1. Created `.streamlit/secrets.toml` Template
- Template file for local development
- Contains placeholder for `GEMINI_API_KEY`
- Safe to commit to repository

### 2. Updated `config.py`
- Added `get_gemini_api_key()` function that checks:
  1. **Streamlit secrets** (for Streamlit Cloud) - **Highest Priority**
  2. Environment variables (from `.env` file or system)
  3. Empty string (if not found)
- Works seamlessly for both local development and Streamlit Cloud

### 3. Updated All API Key Access Points
- `rag/embedder.py` - Now uses `get_gemini_api_key()`
- `rag/generator.py` - Now uses `get_gemini_api_key()`
- `app.py` - Now uses `get_gemini_api_key()`

### 4. Updated `.gitignore`
- Added `.streamlit/secrets.toml` to prevent committing actual API keys

## 🚀 How to Use

### For Local Development

**Option 1: Using `.env` file (Recommended)**
1. Create a `.env` file in the project root:
   ```bash
   GEMINI_API_KEY=your-api-key-here
   ```
2. The application will automatically load it

**Option 2: Using `.streamlit/secrets.toml`**
1. Copy the template and add your key:
   ```bash
   # Edit .streamlit/secrets.toml
   GEMINI_API_KEY = "your-api-key-here"
   ```
2. The application will use it automatically

**Option 3: Environment Variable**
```bash
# Windows PowerShell
$env:GEMINI_API_KEY="your-api-key-here"

# Windows CMD
set GEMINI_API_KEY=your-api-key-here

# macOS/Linux
export GEMINI_API_KEY="your-api-key-here"
```

### For Streamlit Cloud Deployment

1. **Push your code to GitHub** (if not already done)
   ```bash
   git add .
   git commit -m "Add Streamlit secrets support"
   git push
   ```

2. **Go to Streamlit Cloud Dashboard**
   - Visit: https://share.streamlit.io/
   - Select your app

3. **Add Secrets**
   - Click on **Settings** (⚙️ icon)
   - Click on **Secrets**
   - Add your API key in TOML format:
     ```toml
     GEMINI_API_KEY = "your-actual-api-key-here"
     ```
   - Click **Save**

4. **Redeploy** (if needed)
   - Streamlit Cloud will automatically redeploy when you save secrets
   - Or manually trigger a redeploy from the dashboard

## 🔒 Security Best Practices

✅ **DO:**
- Use Streamlit Cloud secrets for production deployments
- Use `.env` file for local development (already in `.gitignore`)
- Keep your API keys secure and never commit them

❌ **DON'T:**
- Commit actual API keys to the repository
- Share your API keys publicly
- Hardcode API keys in source code

## 📋 Priority Order

The application checks for API keys in this order:

1. **Streamlit secrets** (`st.secrets['GEMINI_API_KEY']`) - Used on Streamlit Cloud
2. **Environment variables** (`os.getenv("GEMINI_API_KEY")`) - From `.env` file or system
3. **Empty string** - If not found anywhere

## 🧪 Testing

### Test Locally
```bash
# Make sure your .env file has the API key
streamlit run app.py
```

### Test on Streamlit Cloud
1. Deploy to Streamlit Cloud
2. Add secrets through the dashboard
3. The app should automatically use the secrets

## 📝 Files Modified

- ✅ `config.py` - Added Streamlit secrets support
- ✅ `rag/embedder.py` - Updated to use `get_gemini_api_key()`
- ✅ `rag/generator.py` - Updated to use `get_gemini_api_key()`
- ✅ `app.py` - Updated to use `get_gemini_api_key()`
- ✅ `.gitignore` - Added `.streamlit/secrets.toml`
- ✅ `.streamlit/secrets.toml` - Created template file
- ✅ `.streamlit/README.md` - Created documentation

## 🎯 Next Steps

1. **For Local Development:**
   - Continue using your `.env` file (no changes needed)

2. **For Streamlit Cloud:**
   - Add your `GEMINI_API_KEY` to Streamlit Cloud secrets
   - Deploy your app
   - The app will automatically use the secrets

## ❓ Troubleshooting

### "GEMINI_API_KEY not found" on Streamlit Cloud
- **Solution:** Make sure you've added the secret in Streamlit Cloud dashboard
- Go to: Settings → Secrets → Add `GEMINI_API_KEY`

### App works locally but not on Streamlit Cloud
- **Solution:** Check that secrets are properly formatted in TOML format
- Make sure there are no extra spaces or quotes issues

### Secrets not updating
- **Solution:** Streamlit Cloud may take a minute to propagate changes
- Try redeploying the app manually

---

**Your project is now ready for Streamlit Cloud! 🎉**

