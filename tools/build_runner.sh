#!/bin/bash

# Ensure we're in the project root
cd "$(dirname "$0")/.."

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "🏃 Running build_runner..."

# Clean the build directory first
echo "🧹 Cleaning previous builds..."
dart run build_runner clean

# Run the build runner in release mode
echo "🔨 Building generated files..."
if dart run build_runner build --delete-conflicting-outputs; then
    echo -e "${GREEN}✅ Build completed successfully!${NC}"
else
    echo -e "${RED}❌ Build failed${NC}"
    exit 1
fi 