# Streamlit Cloud Deployment Guide

## 🔐 Setting Up Secrets in Streamlit Cloud

### Step 1: Deploy Your App
1. Push your code to GitHub
2. Go to [Streamlit Cloud](https://share.streamlit.io/)
3. Click "New app"
4. Connect your GitHub repository
5. Select the branch and main file (`app.py`)

### Step 2: Add Your API Key
1. In your Streamlit Cloud app dashboard, click **"Settings"** (⚙️ icon)
2. Click **"Secrets"** in the left sidebar
3. You'll see a text editor

### Step 3: Paste This Configuration

Copy and paste the following into the Secrets editor:

```toml
GEMINI_API_KEY = "your-actual-api-key-here"
```

**Important:** 
- Replace `"your-actual-api-key-here"` with your real Google Gemini API key
- Keep the quotes around the key
- Get your API key from: https://makersuite.google.com/app/apikey

### Step 4: Save and Deploy
1. Click **"Save"** at the bottom
2. Your app will automatically redeploy
3. The API key will be securely stored and accessible via `st.secrets["GEMINI_API_KEY"]`

## ✅ Verification

After deployment, your app should:
- Load the API key from Streamlit Secrets automatically
- Work without any `.env` file (since you're using Cloud secrets)
- Display proper error messages if the key is missing

## 🔒 Security Notes

- ✅ Secrets are encrypted and only accessible to your app
- ✅ Secrets are NOT visible in your code repository
- ✅ ✅ Secrets are NOT logged or exposed in app URLs
- ✅ Only you (and collaborators you grant access) can see secrets

## 🐛 Troubleshooting

### "GEMINI_API_KEY not found" Error
1. Double-check that you saved the secrets in Streamlit Cloud
2. Verify the key name is exactly: `GEMINI_API_KEY`
3. Make sure there are quotes around the value: `"your-key"`
4. Redeploy the app after saving secrets

### App Works Locally But Not on Cloud
- Local uses `.env` file
- Cloud uses Streamlit Secrets
- Make sure you added the secret in Streamlit Cloud Settings → Secrets

---

**Need Help?** Check the main README.md for more details.

