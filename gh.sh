#!/bin/bash
# Git + GitHub + Gitea Control Panel Script
# Provides a user-friendly CLI menu for common git actions, GitHub (gh) CLI, and Gitea (tea CLI).
# Includes error handling, clear prompts, maintainable structure, help menu,
# one-click push/release/deploy, autoheal, and Gitea integration (repo, issues, PRs, releases, workflows).

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

show_help() {
  clear
  echo "=================================="
  echo "          Help Menu               "
  echo "=================================="
  echo "Git Options: status, add, commit, push, pull, log, branch, checkout, tag"
  echo "GitHub Options: repo info, issues, pull requests, one-click push/release/deploy"
  echo "Gitea Options: repo info, issues, pull requests, releases, workflows"
  echo "Autoheal: Detect and fix common git issues automatically"
  echo "=================================="
  pause
}

autoheal() {
  echo "Running autoheal checks..."
  check_git_repo || return

  if [ "$(git symbolic-ref --short -q HEAD)" == "" ]; then
    echo "Warning: Detached HEAD detected."
    git checkout main 2>/dev/null || git checkout master 2>/dev/null || echo "Autoheal failed: No main/master branch."
  fi

  if ! git diff-index --quiet HEAD --; then
    echo "Warning: Uncommitted changes detected."
    git add . && git commit -m "Autoheal: saving work in progress" || echo "Autoheal failed: Could not commit."
  fi

  if ! git remote | grep origin >/dev/null; then
    echo "Warning: No remote 'origin' configured."
    read -p "Enter remote repository URL: " remoteurl
    if [ -n "$remoteurl" ]; then
      git remote add origin "$remoteurl" && echo "Remote added." || echo "Autoheal failed: Could not add remote."
    fi
  fi

  git push >/dev/null 2>&1
  if [ $? -ne 0 ]; then
    echo "Warning: Push failed."
    git pull --rebase || echo "Autoheal failed: Could not rebase."
  fi

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
  echo "14. One-click Release"
  echo "15. One-click Deploy"
  echo "16. Autoheal"
  echo "17. Gitea Repo Info"
  echo "18. Gitea Issues"
  echo "19. Gitea Pull Requests"
  echo "20. Gitea Release"
  echo "21. Gitea Workflow/Deploy"
  echo "h. Help"
  echo "0. Exit"
  echo "----------------------------------"
  read -p "Select option: " choice

  case $choice in
    1) check_git_repo || continue; git status; pause ;;
    2) check_git_repo || continue; read -p "Enter files to add (or '.' for all): " files; git add $files && echo "Files added." || echo "Error: Failed to add files."; pause ;;
    3) check_git_repo || continue; read -p "Enter commit message: " msg; git commit -m "$msg" && echo "Commit successful." || echo "Error: Commit failed."; pause ;;
    4) check_git_repo || continue; git push && echo "Push successful." || echo "Error: Push failed."; pause ;;
    5) check_git_repo || continue; git pull && echo "Pull successful." || echo "Error: Pull failed."; pause ;;
    6) check_git_repo || continue; git log --oneline --graph --decorate --max-count=20; pause ;;
    7) check_git_repo || continue; echo "Branch Management:"; echo "a. List"; echo "b. Create"; echo "c. Delete"; read -p "Select option: " bchoice; case $bchoice in a) git branch ;; b) read -p "New branch name: " bname; git branch "$bname" ;; c) read -p "Branch to delete: " bdel; git branch -d "$bdel" ;; *) echo "Invalid branch option." ;; esac; pause ;;
    8) check_git_repo || continue; read -p "Enter branch/tag: " target; git checkout "$target"; pause ;;
    9) check_git_repo || continue; read -p "Enter tag name: " tagname; git tag "$tagname"; pause ;;
    10) check_gh || continue; gh repo view --web; pause ;;
    11) check_gh || continue; echo "GitHub Issues:"; echo "a. List"; echo "b. Create"; read -p "Select option: " ichoice; case $ichoice in a) gh issue list ;; b) read -p "Title: " ititle; read -p "Body: " ibody; gh issue create --title "$ititle" --body "$ibody" ;; *) echo "Invalid option." ;; esac; pause ;;
    12) check_gh || continue; echo "GitHub PRs:"; echo "a. List"; echo "b. Create"; read -p "Select option: " prchoice; case $prchoice in a) gh pr list ;; b) gh pr create --fill ;; *) echo "Invalid option." ;; esac; pause ;;
    13) check_git_repo || continue; read -p "Commit message: " msg; git add . && git commit -m "$msg" && git push; pause ;;
    14) check_gh || continue; read -p "Release tag: " rtag; read -p "Title: " rtitle; read -p "Notes: " rnotes; gh release create "$rtag" --title "$rtitle" --notes "$rnotes"; pause ;;
    15) check_gh || continue; read -p "Workflow file (e.g., deploy.yml): " wf; gh workflow run "$wf"; pause ;;
    16) autoheal ;;
    17) check_tea || continue; tea repo view; pause ;;
    18) check_tea || continue; echo "Gitea Issues:"; echo "a. List"; echo "b. Create"; read -p "Select option: " gichoice; case $gichoice in a) tea issue list ;; b) read -p "Title: " gtitle; read -p "Body: " gbody; tea issue create --title "$gtitle" --body "$gbody" ;; *) echo "Invalid option." ;; esac; pause ;;
    19) check_tea || continue; echo "Gitea PRs:"; echo "a. List"; echo "b. Create"; read -p "Select option: " gprchoice; case $gprchoice in a) tea pr list ;; b) tea pr create ;; *) echo "Invalid option." ;; esac; pause ;;
    20) check_tea || continue; read -p "Release tag: " gtag; read -p "Title: " gtitle; read -p "Notes: " gnotes; tea release create "$gtag" --title "$gtitle" --note "$gnotes"; pause ;;
    21) check_tea || continue; read -p "Workflow file (e.g., deploy.yml): " gwf; tea workflow run "$gwf"; pause ;;
    h|H) show_help ;;
    0) echo "Exiting Control Panel."; exit 0 ;;
    *) echo "Invalid option."; pause ;;
  esac
done
