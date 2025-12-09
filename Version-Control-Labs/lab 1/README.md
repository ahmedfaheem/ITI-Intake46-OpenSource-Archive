
---

# ⭐ **Version Control Lab 1 – ITI**

Welcome to **Lab 1** of the *Version Control* track at ITI.
This repository contains the first practical exercise covering Git basics, staging, commits, branching, history navigation, SSH setup, and GitHub Pages hosting.


---

## 🔗 **Live Demo**

View the hosted project here:

👉 **[https://ahmedfaheem.github.io/Version-Control-Lab/lab%201/](https://ahmedfaheem.github.io/Version-Control-Lab/lab%201/)**

---

## 📁 **Project Structure**

```
Version-Control-Lab/
│
├── lab 1/
│   ├── index.html
│   ├── data.txt
│   └── README.md
│
└── (other Git labs if needed)
```

---

# 🧰 **Topics Covered in Lab 1**

* Initializing a Git repository
* Tracking files (untracked → staged → committed)
* Using `git add`, `git commit`, `git status`
* Viewing history with `git log`
* Resetting & restoring files (`reset`, `restore`)
* Comparing changes using `git diff`
* Using GitHub remotes (`remote`, `push`, `pull`)
* SSH key creation & authentication
* Hosting the lab using **GitHub Pages**

---

# 📘 **Git Commands Summary (Used in Lab)**

### 🔹 **Git Setup & Configurations**

* `git --version` — check Git version
* `git config --global user.name` — view username
* `git config --global user.name "newName"` — set username
* `git config --global user.email` — view email
* `git config --global user.email "email@gmail.com"` — set email
* `git config --list` — show all configurations
* `git config --global init.defaultBranch main` — use *main* instead of *master*

---

### 📁 **File System Operations**

* `mkdir git-demo` — create a directory
* `ls -a` — list all files including hidden
* `ls` — list normal files
* `cd "E:"` — switch drives on Windows

---

### 📂 **Repository Operations**

* `git init` — initialize a repository
* `git status` — show file states
* `git add index.html` — stage a single file
* `git add .` — stage everything
* `git commit -m "message"` — commit with a message
* `git log` — full commit history
* `git log --oneline --graph --decorate` — styled, compact history view

---

### ✏️ **Editing & Viewing Files**

* `echo "<h1>Hello</h1>" > index.html` — write into file
* `cat index.html` — view file contents

---

### 📝 **Commit & Staging Behavior**

* `git commit -am "msg"` — stage modified *tracked* files + commit
* `git restore --staged file` — unstage a file
* `git restore file` — undo file changes to last commit

---

# 🔄 **Reset & Restore (Very Important)**

### `git reset --hard <sha>`

* Move repo to an older commit
* Delete all changes in working directory & staging

### `git reset --soft <sha>`

* Move to commit but keep changes in staging

### `git restore <file>`

* Remove changes and restore file to last committed state

### `git restore --staged <file>`

* Move file from staged → unstaged

---

# 🕒 **History Recovery**

### `git reflog`

Shows the full movement of `HEAD`
→ Helps recover deleted commits (saved ~90 days)

---

# 🛠️ **Amending Commits**

### `git commit --amend -m "new message"`

* Modify the last commit message or content
* Creates a **new commit**, new SHA
* Replaces the previous commit

---

# 📉 **Moving Back in History**

* `git reset --hard HEAD^` — go back 1 commit
* `git reset --hard HEAD^^` — go back 2 commits
* `git reset --hard HEAD~2` — also 2 commits

---

# 🔍 **Comparing Changes**

* `git diff` — compare working directory vs last commit (unstaged changes)
* `git diff sha1 sha2` — compare differences between two commits

---

# 🌿 **Branches**

* `git branch` — list branches
* `git branch -M main` — rename current branch to main

---

# 🔐 **SSH Key Setup**

* `ssh-keygen -t ed25519 -C "email@gmail.com"` — generate SSH key
* `cat id_ed25519.pub` — view public key
* Add the key to GitHub → Settings → SSH Keys

---

# 🌍 **GitHub Remote Commands**

* `git remote add origin <url>` — add a remote repo
* `git remote -v` — view remote URLs

---

# 🚀 **Push / Pull / Clone**

* `git push -u origin main` — set upstream & push
* `git push` — push to saved upstream
* `git pull` — get updates from server
* `git clone <ssh-url>` — download the repository

---

# 📄 **How to View the Lab**

Clone the repository:

```bash
git clone git@github.com:ahmedfaheem/Version-Control-Lab1.git
```

Then open:

```
lab 1/index.html
```

or simply open the GitHub Pages link.

---

# 👤 **Author**

**Ahmed Faheem**
ITI – Version Control Course
2025

---
