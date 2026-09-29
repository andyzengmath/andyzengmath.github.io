---
layout: post
title: "WaterRAG: grounding wastewater decisions in scientific evidence"
date: 2026-04-07 00:00:00-0400
description: Our ES&T paper combines a wastewater knowledge base with retrieval and iterative agents to support technical questions and literature reviews.
tags: machine-learning nlp wastewater-treatment retrieval-augmented-generation multi-agent-systems
categories: research
---

Our paper, [_WaterRAG: A Multiagent Retrieval-Augmented Generation Framework to Support Water Industry Transitions to Net-Zero_](https://doi.org/10.1021/acs.est.5c15806), was published online in **Environmental Science & Technology on April 7, 2026**. This is joint work with Mudi Zhai, Ruihong Qiu, Jiaying Li, Qixiang Zhu, T. David Waite, Bing-Jie Ni, and Haoran Duan.

WaterRAG asks how language models can become more useful for wastewater research and engineering when their answers are grounded in identifiable scientific sources, rather than generated from pretrained knowledge alone.

## A knowledge base for a specialized domain

Progress toward net-zero wastewater treatment involves several connected questions: reducing energy use, understanding greenhouse-gas emissions, improving treatment processes, and recovering useful resources. Relevant knowledge is spread across research papers and engineering references.

WaterRAG brings together a selected corpus of **7,637 peer-reviewed studies and 11 engineering references**. Retrieval supplies relevant material to the language model at query time. This is not the same as retraining a model on the entire corpus, and the collection is not claimed to cover every wastewater question.

The framework addresses technical question answering, topic-focused literature reviews, and illustrative plant-specific engineering support.

## Retrieve, draft, evaluate, and revise

The question-answering workflow retrieves candidate passages and reranks them before generating an answer. The aim is to provide useful evidence, not simply a large amount of loosely related text.

For literature reviews, the workflow goes beyond a single retrieve-and-answer call. Three specialized agent roles work together:

- A **retrieval agent** expands queries and selects relevant evidence.
- A **review agent** builds a structured synthesis and integrates additional information into later drafts.
- An **evaluation agent** audits the draft for missing aspects, weak evidence, and insufficient technical depth, providing feedback for refinement.

The important idea is that evaluation can lead to another search for evidence. Asking for a better-supported review is different from merely asking a model to produce a longer answer.

## What improves, and what it costs

The study benchmarks question answering on **370 technical questions**, combining literature-derived questions with engineering-practice problems. For the GPT-4.1 comparison, the reported results are:

| System             | Answer-correctness pass rate | Reported API cost per question |
| ------------------ | ---------------------------: | -----------------------------: |
| Standalone GPT-4.1 |                        64.9% |                      USD 0.007 |
| Naive RAG          |                        72.8% |                      USD 0.023 |
| WaterRAG           |                    **80.5%** |                      USD 0.044 |

The full-precision results and cost breakdown appear in **Table S9 of the supporting information**. WaterRAG's gain over standalone GPT-4.1 is approximately **15.6 percentage points**, with additional inference cost.

Evaluation includes LLM-based comparisons with reference answers, so the grading protocol matters when interpreting these figures. They are study-specific answer-correctness pass rates, not a guarantee of expert-level reliability on arbitrary questions. The API costs likewise describe the experimental setup, not fixed service prices or total deployment costs.

## Where the system still fails

The error analysis is particularly informative. Among the remaining errors, the paper attributes approximately **46% to retrieval failure**, **38% to missing knowledge coverage**, and **16% to reasoning errors or hallucinations**.

Thus, 84% of the analyzed failures involved evidence that was missing or not successfully retrieved. More elaborate reasoning alone cannot reliably repair that problem. Improving the knowledge base and finding the right passages remain central.

The supporting information also documents calculation and unit-conversion mistakes, even when relevant formulas were retrieved. Citations make an answer easier to inspect; they do not automatically make it correct.

## Supporting professional judgment

WaterRAG is intended to complement researchers and engineers, not replace source checking, site-specific validation, or professional judgment. The work demonstrates information-support capabilities; it does not establish measured emissions reductions or autonomous control of a treatment plant.

The article appears in **ES&T 2026, 60(15), 11529-11541**, in the issue dated April 21. This post uses the earlier online-publication date. Further details are available in the [publisher's supporting information](https://doi.org/10.1021/acs.est.5c15806.s001), the [code repository](https://github.com/Mudi12138/WaterRAG), and the [WaterRAG project page]({% link _projects/waterrag.md %}).
