---
layout: post
title: "WaterBERT: turning water-treatment literature into structured evidence"
date: 2026-09-23 00:00:00-0400
description: Our new preprint introduces a domain-adapted encoder for water-treatment literature mining and knowledge-enhanced retrieval.
tags: machine-learning nlp water-treatment knowledge-graphs information-retrieval
categories: research
---

Our new preprint, [_Domain-Adaptive Pretraining Enhances Water Treatment Semantic Representation for Large-Scale Structured Literature Mining_](https://arxiv.org/abs/2609.26034), was announced on arXiv today. This is joint work with Mudi Zhai, Ruihong Qiu, T. David Waite, Bing-Jie Ni, and Haoran Duan.

The paper introduces **WaterBERT**, a language encoder adapted to water-treatment research, and **WaterKERS**, a retrieval system that combines structured knowledge with text search. The goal is to make a large scientific literature easier to organize and query, not simply to build another chatbot.

## Why domain-specific representations matter

Scientific information extraction involves more than recognizing technical words. The same substance can play different roles: NaCl might be a pollutant being removed, or an electrolyte added during treatment. Likewise, a removal percentage is useful only when it is connected to the correct pollutant, process, and operating conditions.

These distinctions motivate a specialized encoder. WaterBERT starts from **SciBERT**, rather than from random initialization, and continues masked-language-model pretraining on approximately **2.97 billion tokens** of water-treatment literature. Its 110-million-parameter architecture is then fine-tuned for classification, named entity recognition, and relation extraction.

This separates two jobs: learning the language of the field from unlabeled text, and learning specific extraction tasks from annotations.

## What improves after adaptation?

We compared WaterBERT with six general-purpose and domain-specific encoder baselines under the same five-fold cross-validation setup. Against its starting point, SciBERT, the mean F1 scores were:

| Task                             | SciBERT |  WaterBERT |
| -------------------------------- | ------: | ---------: |
| Treatment-process classification |  88.86% | **90.12%** |
| Named entity recognition         |  76.13% | **79.50%** |
| Relation extraction              |  70.51% | **74.04%** |

Classification uses macro F1 across five treatment-process categories. WaterBERT achieved the highest mean F1 among the evaluated encoders on all three tasks. The gains were especially useful for context-dependent distinctions, such as separating a pollutant from a deliberately dosed material.

These are task-specific results, not a claim that an encoder replaces a general-purpose LLM.

## From abstracts to a knowledge graph

The extraction pipeline processed **693,211 abstracts**. Entity recognition covered the full collection, while relation extraction focused on a screened subset of 237,110 pollutant-removal studies. High-confidence predictions and entity consolidation produced a graph with **118,131 canonical entities**, linking treatment concepts and evidence back to publications.

In a separate application, WaterBERT embeddings supported BERTopic analysis of **5,144 _Environmental Science & Technology_ articles**. This recovered interpretable research themes without prescribing the topic categories in advance.

The cost-accuracy trade-off matters at this scale. On 300 manually evaluated articles, WaterBERT's graph-extraction F1 was **69.3%**, below the strongest tested commercial model's **80.4%**. However, its estimated GPU-rental cost for full-corpus extraction was **USD 29.70**, versus projected commercial-model costs of roughly **USD 4,402-16,989**. These are extraction deployment estimates, not total project costs including pretraining and annotation.

## Retrieval that respects the question

A search for studies reporting nitrogen removal **below 60%** should not return a paper merely because it discusses nitrogen removal. The numerical constraint must be attached to the right measurement.

WaterKERS combines graph-based retrieval, BM25 lexical ranking, and BGE dense retrieval. The graph helps enforce explicit relationships and constraints; text retrieval supplies coverage when a query asks for distinctions the graph does not encode.

On a benchmark of **100 pollutant-removal queries**, WaterKERS achieved a relevance score of **77.7**, compared with **54.7-64.5** for the text-based baselines. This is a weighted retrieval score, not answer accuracy: fully relevant documents receive full credit and partially relevant documents receive three-quarter credit. Labels were assigned by an LLM judge in three runs, with disagreements manually adjudicated.

## Scope and next steps

The extracted records are intended to support literature discovery and evidence organization, not replace expert-curated datasets. Implicit information can be missed, and graph retrieval remains limited by the entities and relationships represented in its schema.

The broader idea is to use a compact, domain-adapted model for repeated corpus-scale work, while retaining richer retrieval and reasoning tools where they are useful. The [project page]({% link _projects/waterbert.md %}) gives an overview, and the [public repository](https://github.com/Mudi12138/WaterBERT) provides model, knowledge-graph, and retrieval resources.
