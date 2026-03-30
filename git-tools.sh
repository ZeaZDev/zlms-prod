#!/bin/bash
# Git + GitHub + Gitea Control Panel Script
# Provides a user-friendly CLI menu for common git actions, GitHub (gh) CLI, and Gitea (tea CLI).
# Includes error handling, clear prompts, maintainable structure, help menu,
# one-click push/release/deploy, autoheal, and Gitea integration (repo, issues, PRs, releases, workflows).
# Extended with release automation: changelog generation, version bumping, tagging.

pause() {
  read -p "Press Enter to continue..."
}

check_git_repo() {
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Error: This directory is not a git repository."
    pause
    return 1
  fi
  return 0
}

check_gh() {
  if ! command -v gh >/dev/null 2>&1; then
    echo "Error: GitHub CLI (gh) is not installed."
    echo "Install it from https://cli.github.com/"
    pause
    return 1
  fi
  return 0
}

check_tea() {
  if ! command -v tea >/dev/null 2>&1; then
    echo "Error: Gitea CLI (tea) is not installed."
    echo "Install it from https://gitea.com/gitea/tea"
    pause
    return 1
  fi
  return 0
}

ensure_version_file() {
  VERSION_FILE="VERSION"
  if [ ! -f "$VERSION_FILE" ]; then
    echo "0.1.0" > "$VERSION_FILE"
    echo "✅ VERSION file created with initial version 0.1.0"
  fi
}

generate_changelog() {
  ensure_version_file
  VERSION=$(cat VERSION)
  LAST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "")
  if [ -z "$LAST_TAG" ]; then
    git log --pretty=format:"- %s" > CHANGELOG.tmp
  else
    git log "$LAST_TAG"..HEAD --pretty=format:"- %s" > CHANGELOG.tmp
  fi
  {
    echo "## v$VERSION"
    cat CHANGELOG.tmp
    echo ""
  } >> CHANGELOG.md
  rm CHANGELOG.tmp
  echo "✅ CHANGELOG.md updated for v$VERSION"
}

bump_version() {
  ensure_version_file
  OLD_VERSION=$(cat VERSION)
  IFS='.' read -r major minor patch <<< "$OLD_VERSION"
  case $1 in
    major) major=$((major+1)); minor=0; patch=0 ;;
    minor) minor=$((minor+1)); patch=0 ;;
    patch) patch=$((patch+1)) ;;
    *) echo "❌ Invalid bump type. Use major/minor/patch."; return ;;
  esac
  NEW_VERSION="$major.$minor.$patch"
  echo "$NEW_VERSION" > VERSION
  echo "✅ Version bumped: $OLD_VERSION → $NEW_VERSION"
}

release_github() {
  check_git_repo || return
  check_gh || return
  bump_version patch
  generate_changelog
  VERSION=$(cat VERSION)
  git add VERSION CHANGELOG.md
  git commit -m "Release v$VERSION"
  git tag -a "v$VERSION" -m "Release v$VERSION"
  git push origin main --tags
  gh release create "v$VERSION" --title "Release v$VERSION" --notes-file CHANGELOG.md
  echo "✅ GitHub release v$VERSION created."
}

release_gitea() {
  check_git_repo || return
  check_tea || return
  bump_version patch
  generate_changelog
  VERSION=$(cat VERSION)
  git add VERSION CHANGELOG.md
  git commit -m "Release v$VERSION"
  git tag -a "v$VERSION" -m "Release v$VERSION"
  git push origin main --tags
  tea release create "v$VERSION" --title "Release v$VERSION" --note "$(cat CHANGELOG.md)"
  echo "✅ Gitea release v$VERSION created."
}

autoheal() {
  echo "Running autoheal checks..."
  check_git_repo || return
  if [ "$(git symbolic-ref --short -q HEAD)" == "" ]; then
    git checkout main 2>/dev/null || git checkout master 2>/dev/null || echo "Autoheal failed: No main/master branch."
  fi
  if ! git diff-index --quiet HEAD --; then
    git add . && git commit -m "Autoheal: saving work in progress" || echo "Autoheal failed: Could not commit."
  fi
  if ! git remote | grep origin >/dev/null; then
    read -p "Enter remote repository URL: " remoteurl
    if [ -n "$remoteurl" ]; then
      git remote add origin "$remoteurl" && echo "Remote added." || echo "Autoheal failed: Could not add remote."
    fi
  fi
  git push >/dev/null 2>&1 || git pull --rebase || echo "Autoheal failed: Could not sync."
  echo "Autoheal complete."
  pause
}

while true; do
  clear
  echo "=================================="
  echo " Git + GitHub + Gitea Control Panel "
  echo "=================================="
  echo "1. Git Status"
  echo "2. Git Add files"
  echo "3. Git Commit changes"
  echo "4. Git Push"
  echo "5. Git Pull"
  echo "6. Git Log"
  echo "7. Branch management"
  echo "8. Checkout branch/tag"
  echo "9. Create tag"
  echo "10. GitHub Repo Info"
  echo "11. GitHub Issues"
  echo "12. GitHub Pull Requests"
  echo "13. One-click Push"
  echo "14. One-click GitHub Release"
  echo "15. One-click Deploy (GitHub Workflow)"
  echo "16. Autoheal"
  echo "17. Gitea Repo Info"
  echo "18. Gitea Issues"
  echo "19. Gitea Pull Requests"
  echo "20. One-click Gitea Release"
  echo "21. Gitea Workflow/Deploy"
  echo "0. Exit"
  echo "----------------------------------"
  read -p "Select option: " choice

  case $choice in
    1) check_git_repo || continue; git status; pause ;;
    2) check_git_repo || continue; read -p "Enter files to add (or '.' for all): " files; git add $files; pause ;;
    3) check_git_repo || continue; read -p "Enter commit message: " msg; git commit -m "$msg"; pause ;;
    4) check_git_repo || continue; git push; pause ;;
    5) check_git_repo || continue; git pull; pause ;;
    6) check_git_repo || continue; git log --oneline --graph --decorate --max-count=20; pause ;;
    7) check_git_repo || continue; echo "Branch Management:"; echo "a. List"; echo "b. Create"; echo "c. Delete"; read -p "Select option: " bchoice; case $bchoice in a) git branch ;; b) read -p "New branch name: " bname; git branch "$bname" ;; c) read -p "Branch to delete: " bdel; git branch -d "$bdel" ;; esac; pause ;;
    8) check_git_repo || continue; read -p "Enter branch/tag: " target; git checkout "$target"; pause ;;
    9) check_git_repo || continue; read -p "Enter tag name: " tagname; git tag "$tagname"; pause ;;
    10) check_gh || continue; gh repo view --web; pause ;;
    11) check_gh || continue; gh issue list; pause ;;
    12) check_gh || continue; gh pr list; pause ;;
    13) check_git_repo || continue; read -p "Commit message: " msg; git add . && git commit -m "$msg" && git push; pause ;;
    14) release_github; pause ;;
    15) check_gh || continue; read -p "Workflow file (e.g., deploy.yml): " wf; gh workflow run "$wf"; pause ;;
    16) autoheal ;;
    17) check_tea || continue; tea repo view; pause ;;
    18) check_tea || continue; tea issue list; pause ;;
    19) check_tea || continue; tea pr list; pause ;;
    20) release_gitea; pause ;;
    21) check_tea || continue; read -p "Workflow file (e.g., deploy.yml): " gwf; tea workflow run "$gwf"; pause ;;
    0) echo "Exiting Control Panel."; exit 0 ;;
    *) echo "Invalid option."; pause ;;
  esac
done
