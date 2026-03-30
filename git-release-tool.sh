#!/usr/bin/env bash
# Unified Git Workflow & Release Management Tool
# Author: CVSz
# Email: seaza@msn.com

set -e

# Check if inside a Git repo
if [ ! -d ".git" ]; then
    echo "❌ Not a Git repository. Run this inside a repo."
    exit 1
fi

# Ensure VERSION file exists
VERSION_FILE="VERSION"
if [ ! -f "$VERSION_FILE" ]; then
    echo "0.1.0" > "$VERSION_FILE"
    echo "✅ VERSION file created with initial version 0.1.0"
fi

function generate_changelog() {
    echo "=== Generating changelog ==="
    VERSION=$(cat VERSION)

    # Find last tag (if any)
    LAST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "")

    if [ -z "$LAST_TAG" ]; then
        echo "No previous tag found. Generating full log."
        git log --pretty=format:"- %s" > CHANGELOG.tmp
    else
        echo "Last tag: $LAST_TAG"
        git log "$LAST_TAG"..HEAD --pretty=format:"- %s" > CHANGELOG.tmp
    fi

    # Prepend version header
    {
        echo "## v$VERSION"
        cat CHANGELOG.tmp
        echo ""
    } >> CHANGELOG.md

    rm CHANGELOG.tmp
    echo "✅ CHANGELOG.md updated with entries for v$VERSION"
}

function bump_version() {
    OLD_VERSION=$(cat "$VERSION_FILE")
    IFS='.' read -r major minor patch <<< "$OLD_VERSION"
    case $1 in
        major) major=$((major+1)); minor=0; patch=0 ;;
        minor) minor=$((minor+1)); patch=0 ;;
        patch) patch=$((patch+1)) ;;
        *) echo "❌ Invalid bump type. Use major/minor/patch."; return ;;
    esac
    NEW_VERSION="$major.$minor.$patch"
    echo "$NEW_VERSION" > "$VERSION_FILE"
    echo "✅ Version bumped: $OLD_VERSION → $NEW_VERSION"
}

function create_release_tag() {
    VERSION=$(cat VERSION)
    git add VERSION CHANGELOG.md
    git commit -m "Release $VERSION"
    git tag -a "v$VERSION" -m "Release $VERSION"
    git push origin main --tags
    echo "✅ Release v$VERSION created and pushed."
}

while true; do
    echo "=============================="
    echo " Git Workflow & Release Menu"
    echo "=============================="
    echo "1) Stage all changes"
    echo "2) Stage modified files only"
    echo "3) Stage specific file"
    echo "4) Commit with message"
    echo "5) Push to default remote"
    echo "6) Push to specific branch"
    echo "7) Generate changelog"
    echo "8) Bump version (major)"
    echo "9) Bump version (minor)"
    echo "10) Bump version (patch)"
    echo "11) Create & push release tag"
    echo "12) Exit"
    echo "=============================="
    read -rp "Choose an option: " choice

    case $choice in
        1) git add .; echo "✅ All changes staged." ;;
        2) git add -u; echo "✅ Modified files staged." ;;
        3) read -rp "Enter filename to stage: " file; git add "$file"; echo "✅ Staged $file." ;;
        4) read -rp "Enter commit message: " msg; git commit -m "$msg"; echo "✅ Commit created." ;;
        5) git push; echo "✅ Pushed to default remote." ;;
        6) read -rp "Enter branch name: " branch; git push origin "$branch"; echo "✅ Pushed to branch $branch." ;;
        7) generate_changelog ;;
        8) bump_version major ;;
        9) bump_version minor ;;
        10) bump_version patch ;;
        11) create_release_tag ;;
        12) echo "👋 Exiting tool."; break ;;
        *) echo "❌ Invalid choice, try again." ;;
    esac
done
