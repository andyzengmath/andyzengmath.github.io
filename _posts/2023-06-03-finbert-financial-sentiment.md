---
layout: post
title: "FinBERT and LSTM: studying stock movements through financial news"
date: 2023-06-03 00:00:00-0400
description: Our financial sentiment study combines an existing FinBERT model with time-series learning, based on work completed in November 2022.
tags: machine-learning nlp finance sentiment-analysis time-series
categories: research
---

Our preprint, [_Financial sentiment analysis using FinBERT with application in predicting stock movement_](https://arxiv.org/abs/2306.02136v1), was first submitted to arXiv on **June 3, 2023**. This is joint work with Tingsong Jiang, based on a project completed in **November 2022**.

The project asks whether sentiment extracted from financial news can add useful information to a time-series model of stock prices. We use an existing pretrained **FinBERT** model for the text component; this work applies FinBERT rather than introducing the original language model.

## From a headline to a price model

Financial language is context-dependent. A word that sounds positive in ordinary conversation need not signal good news for a company, and a short headline can compress several competing signals.

FinBERT provides sentiment information from that text. We associate news with a company ticker and date, then combine its sentiment scores with market data. An **LSTM**, or long short-term memory network, models the resulting sequence.

The two components have different jobs: the language model interprets text, while the sequence model learns temporal relationships. In the reported experiments, the prediction target is a numerical **closing price**, so the task is regression rather than merely classifying the next movement as up or down.

## Data and experimental setup

The study combines historical financial-news archives with market data obtained through `yfinance`. After merging the news sources, the collection contains **1,056,471 records** with title, date, and ticker information.

That large headline count should not be confused with the number of observations available to each stock's prediction model. The experiments are conducted by individual stock, and preprocessing substantially reduces the usable sequences. For example, the paper reports **1,440 processed rows for MSFT**.

The LSTM component uses two recurrent layers with 100 units each, followed by a 25-unit dense layer and a scalar output. Prices are normalized, and the reported split is chronological: the first **90% of dates** are used for training and the remaining **10%** for testing.

This preserves the basic direction of time, although a short held-out period still cannot establish performance across different market regimes.

## What the comparison tells us

The experiments compare ARIMA, an LSTM baseline, BERT combined with LSTM, FinBERT combined with a feed-forward network, and FinBERT combined with LSTM. Mean squared error is the main training and validation metric.

The original results are not a clean win across every baseline and metric. In particular, the improvement over the general-purpose BERT-plus-LSTM model is modest, and the reported validation table does not establish that adding sentiment always beats the LSTM baseline.

The useful conclusion is narrower: this pipeline provides a concrete way to investigate whether financial text contributes information beyond market history. Lower training loss alone is not evidence of better forecasting.

## Limitations and next steps

The paper identifies several practical limitations: small per-stock samples encourage overfitting, using only headlines leaves information unused, and predictions can understate longer-run price trends.

There are also important boundaries on interpretation. The study examines associations, not whether news sentiment causes price changes. Closing-price error is not a trading-return metric, and these experiments do not establish a profitable trading strategy.

Richer text representations, more usable observations, and evaluation over multiple chronological periods are natural next steps. Any forecasting application also needs to verify that each news item was available before its prediction time.

This post describes the [original 2023 version](https://arxiv.org/abs/2306.02136v1). The [arXiv record](https://arxiv.org/abs/2306.02136) contains later revisions, and the [Financial AI project page]({% link _projects/financial-ai.md %}) collects the related work.
