#!/bin/bash

# The Daily Grit - Production Deployment Script
# This script builds the site and prepares it for deployment

set -e  # Exit on any error

echo "🏗️  Building The Daily Grit..."
echo "=================================="

# Clean previous build
echo "🧹 Cleaning previous build..."
rm -rf dist/

# Install dependencies
echo "📦 Installing dependencies..."
npm ci

# Build the site
echo "🔨 Building site..."
npm run build

# Verify build
if [ -d "dist" ] && [ -f "dist/index.html" ]; then
    echo "✅ Build successful!"
    echo ""
    echo "📊 Build stats:"
    echo "   Pages generated: $(find dist/ -name "*.html" | wc -l)"
    echo "   Total size: $(du -sh dist/ | cut -f1)"
    echo ""
    echo "🚀 Ready for deployment!"
    echo ""
    echo "Next steps:"
    echo "1. Upload the 'dist/' folder to your web server, OR"
    echo "2. Deploy to Cloudflare Pages:"
    echo "   - Go to https://dash.cloudflare.com/pages"
    echo "   - Create new project → Upload assets"
    echo "   - Upload the 'dist' folder"
    echo ""
else
    echo "❌ Build failed - dist folder not found"
    exit 1
fi