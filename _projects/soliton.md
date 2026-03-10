---
layout: page
title: Soliton
description: Risk-adaptive multi-agent PR review for Claude Code & Cursor
img: assets/img/1.jpg
importance: 1
category: AI and Machine Learning
---

<div class="text-center mb-4">
  <a href="https://github.com/andyzengmath/soliton" target="_blank" class="btn btn-primary btn-lg">
    View on GitHub
  </a>
</div>

## About Soliton

**Soliton** is a risk-adaptive multi-agent PR review tool designed for Claude Code & Cursor. It employs 7 specialized agents to catch bugs, security flaws, and AI hallucinations in parallel.

Soliton auto-detects your base branch, computes a risk score, dispatches the right agents, and shows you the results.

### Features
- Analyzes PRs and generates feedback utilizing specialized agents (security, hallucination, consistency, etc.)
- Supports local branch reviews (pre-push) and GitHub PR reviews
- Output options include terminal output, JSON, and direct feedback into your coding agent
