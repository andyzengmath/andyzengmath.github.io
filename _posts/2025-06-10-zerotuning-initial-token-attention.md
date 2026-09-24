---
layout: post
title: "ZeroTuning: improving language models through the initial token"
date: 2025-06-10 00:00:00-0400
description: Our MOSS workshop paper studies a training-free way to improve language models by adjusting attention to the initial token.
tags: machine-learning nlp language-models attention inference
categories: research
---

Our paper, [_ZeroTuning: Unlocking the Initial Token's Power to Enhance Large Language Models Without Training_](https://openreview.net/forum?id=THSbsRWy9v), was published on **June 10, 2025**, as part of the **ICML 2025 Workshop on Methods and Opportunities at Small Scale (MOSS)**. This is joint work with Feijiang Han, Xiaodong Yu, Jianheng Tang, Licheng Guo, and Lyle Ungar.

The question is simple: can we improve a pretrained language model without updating its weights or deciding which words in each prompt deserve extra attention? ZeroTuning explores a surprisingly useful place to intervene: the initial token, such as `<BOS>` in Llama.

## Why a token with little meaning can matter

The initial token often acts as an **attention sink**. Other positions allocate substantial attention to it, even though it does not carry the task-specific meaning of a question or document.

That makes it a useful control point. Scaling the attention assigned to this token and renormalizing changes the share of attention available to the remaining tokens. In this elementary rescaling step, their relative ordering is preserved: we are not explicitly choosing one content word to promote over another.

The experiments also show why a single adjustment for the entire model is too crude. Some attention heads benefit from increasing attention to the initial token, while others benefit from decreasing it. Earlier and middle layers generally have a larger influence than the deepest layers.

## Training-free does not mean calibration-free

ZeroTuning first profiles attention heads on a small labeled calibration set. It then selects a group of heads and applies an appropriate scaling factor to their initial-token attention, keeping the model weights frozen.

The main experimental setup uses **500 validation examples** and, by default, tunes the top **40% of heads**. These are calibration choices, not gradient-based fine-tuning of the underlying model.

When optimized attention implementations do not expose the full attention matrix, the paper also explores interventions on key or query states. This extends the idea beyond implementations that explicitly materialize every attention weight.

## What the experiments show

The evaluation covers **15 datasets** spanning classification, multiple-choice questions, and multi-turn conversation, using models from the Llama, Qwen, and DeepSeek families.

Two examples for **Llama-3.1-8B-Instruct**, reported in the early paper, are:

| Evaluation                       | Unmodified model | ZeroTuning |
| -------------------------------- | ---------------: | ---------: |
| Mean multiple-choice accuracy    |           58.84% |     61.48% |
| MT-Bench mean conversation score |            7.804 |      7.966 |

The first change is **2.64 percentage points**, not a 2.64% relative improvement. MT-Bench is an LLM-judged conversation-quality score, not an accuracy percentage. These are benchmark-specific results, rather than a guarantee that every model or task improves.

## Scope and takeaway

The 2025 method still needs labeled feedback to choose its adjustments. It is therefore training-free, but neither fully unsupervised nor free of calibration cost. It also requires access to model internals; it is not simply a prompt that can be sent to any hosted model.

The broader lesson is that improving inference need not always mean adding parameters or identifying important words by hand. A structural feature of attention can provide another way to influence how pretrained knowledge is used.

The author list above follows the [MOSS workshop submission and demo](https://github.com/abhishekpanigrahi1996/MOSS/tree/main/submissions/submission-2). Technical details and numerical examples follow the [early preprint, Sections 2-3](https://arxiv.org/abs/2505.11739v1), rather than later revisions.
