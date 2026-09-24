---
layout: post
title: "Taming SQL complexity: when do two queries mean the same thing?"
date: 2025-06-27 00:00:00-0400
description: Our ICML NewInML poster examines SQL equivalence, practical user intent, and the trade-offs of using language models as evaluators.
tags: machine-learning nlp text-to-sql evaluation language-models
categories: research
---

Our paper, [_Taming SQL Complexity: LLM-Based Equivalence Evaluation for Text-to-SQL_](https://arxiv.org/abs/2506.09359), is an **ICML 2025 NewInML poster**, published on **June 27, 2025**. This is joint work with Simin Ma, Arash Niknafs, Ashish Basran, and Carol Szabo. The arXiv preprint was first submitted on June 11.

Text-to-SQL systems translate a natural-language question into a database query. But generating plausible SQL is only half the problem: how do we decide whether it answers the intended question?

## Matching an answer is not proving equivalence

Two queries can look different and still compute the same result. Conversely, an incorrect query and a correct one can return identical results on a particular database.

For example, consider:

```sql
SELECT name FROM employees WHERE department = 'Sales';

SELECT name FROM employees
WHERE department = 'Sales' AND salary > 50000;
```

If every sales employee in a test database earns more than 50,000, these queries agree. Add a lower-paid sales employee and they diverge. Agreement on one database does not establish equivalence across all admissible database contents.

This is a weakness of **execution accuracy**: a sparse or unrepresentative test database can hide a missing filter. Exact string matching has the opposite problem, rejecting harmless differences in how a query is written.

## Strict and practical equivalence

The paper distinguishes strict semantic equivalence from **weak, or practical, equivalence**. The latter asks whether queries meet the same user need in a particular application, allowing explicitly acceptable differences.

For example, a user may care about which records are returned but not the names assigned to output columns. Other differences, such as a missing join condition or a changed aggregate, can fundamentally alter the answer.

Practical equivalence is an application-level judgment, not a substitute for a formal guarantee. Its criteria need to be stated rather than left implicit in an evaluator's prompt.

## A hybrid evaluation pipeline

Our approach combines preprocessing and inexpensive string-based checks with GPT-based evaluation of harder cases. The language model receives the query pair, equivalence criteria, and relevant application or schema context.

Repeated judgments help expose instability. The pipeline normally starts with three runs; disagreements can trigger additional runs and majority voting. A fluent explanation from one run is not treated as sufficient evidence of reliability.

The study uses **77 manually labeled Dataverse query pairs**, a **14-pair development set** drawn from difficult cases, and **160 synthetic pairs** covering equivalent and inequivalent SQL patterns.

## Better recognition comes with a trade-off

For the synthetic dataset, the enhanced pipeline combines query rewriting with the existing **Miniature & Mull** prompting strategy, which asks the model to reason through small example databases. Both compared pipelines use GPT-4o for their LLM component.

The paper's Table 4 reports:

| Synthetic query-pair group | Initial pipeline | Enhanced pipeline |
| -------------------------- | ---------------: | ----------------: |
| Equivalent pairs           |           61.25% |               95% |
| Inequivalent pairs         |              90% |            83.75% |

These are correct-decision rates within each group, not SQL-generation accuracy. Recognizing more valid alternatives came with a reduced ability to reject invalid ones. Reporting only the 95% figure would miss that trade-off.

## What this means for evaluation

An LLM judge can complement structural and execution-based checks, but it is not a proof engine. Query rewriting can introduce errors, and aggressive preprocessing can erase distinctions that matter.

The main contribution is a more explicit evaluation process: define the notion of equivalence, test both acceptance and rejection, inspect unstable judgments, and keep application-specific tolerance separate from strict correctness. See the [paper, Sections 3-8](https://arxiv.org/abs/2506.09359v1), and the [LLM/NLP project page]({% link _projects/llm-nlp.md %}) for more.
