---
layout: page
title: WaterBERT & WaterKERS
permalink: /projects/waterbert/
description: Domain-adapted language models, structured water-treatment evidence, and hybrid literature retrieval
img: assets/img/7.jpg
importance: 3
category: AI and Machine Learning
---

## Overview

**WaterBERT** is a 110-million-parameter encoder developed by continuing SciBERT pretraining on approximately 2.97 billion tokens of water-treatment literature. Fine-tuned models support treatment-process classification, named entity recognition, and relation extraction.

**WaterKERS**, the Water Knowledge-Enhanced Retrieval System, uses the resulting knowledge graph together with BM25 lexical ranking and BGE dense retrieval to find literature matching both semantic intent and explicit factual constraints.

## Paper

### Domain-Adaptive Pretraining Enhances Water Treatment Semantic Representation for Large-Scale Structured Literature Mining

**arXiv preprint, September 2026**

_Mudi Zhai, Ruihong Qiu, Qingyun Zeng, T. David Waite, Bing-Jie Ni, Haoran Duan_

<a href="https://arxiv.org/abs/2609.26034" class="btn btn-sm btn-outline-primary">arXiv</a>
<a href="https://github.com/Mudi12138/WaterBERT" class="btn btn-sm btn-outline-secondary">Code and resources</a>
<a href="{% post_url 2026-09-23-waterbert-water-treatment-literature %}" class="btn btn-sm btn-outline-secondary">Blog post</a>

## Results in the paper

| Task                                        | WaterBERT mean F1 |
| ------------------------------------------- | ----------------: |
| Treatment-process classification (macro F1) |            90.12% |
| Named entity recognition                    |            79.50% |
| Relation extraction                         |            74.04% |

These results use five-fold cross-validation and exceed the corresponding mean F1 scores of the six evaluated encoder baselines.

The paper applies the extraction pipeline to **693,211 abstracts**, producing **118,131 canonical entities**, and uses WaterBERT embeddings for topic analysis of **5,144 Environmental Science & Technology articles**.

On 100 pollutant-removal queries, WaterKERS achieves a **77.7 weighted relevance score**, compared with **54.7-64.5** for text-based retrieval baselines. The evaluation uses an LLM judge with manual adjudication of inconsistent labels; the score is not answer accuracy.

## Resources and scope

The [public repository](https://github.com/Mudi12138/WaterBERT) provides model cards, links to model weights and graph data, and the hybrid retrieval package. The figures above describe the paper's experiments; the repository documents the released datasets and model variants separately.

The extracted evidence supports corpus-scale organization and discovery. It does not replace expert review, and retrieval is limited by extraction quality and the graph's schema.

Related work: [WaterRAG]({% link _projects/waterrag.md %}), our multiagent retrieval-augmented generation framework for water-industry questions.
