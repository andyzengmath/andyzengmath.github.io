---
layout: post
title:  "Higher Pseudodifferential Calculus and Index Theory"
date:   2026-01-28 12:00:00
description: Some new results of my upcoming preprint *Higher geometric stacks on singular foliations*.A discussion on constructing elliptic theory for holonomy coherence objects using cosimplicial diagrams and derived geometry.
tags: math index-theory derived-geometry singular-foliations differential-geometry higher-category-theory
categories: math
---

### Section: Higher Pseudodifferential Calculus and Index Theory

Having modeled the holonomy coherence object $\mathcal{H}_\bullet$ via a cosimplicial diagram in the category of correspondences $\mathbf{Corr}(C^\ast)$ (and consequently in $\mathbf{KK}$), we now construct the associated elliptic theory. We distinguish between the robust analytic existence of the index (Theorem A) and the conjectural geometric formula in the derived setting (Conjecture B).


#### 1. Cosimplicial Calculus and Symbols

We construct the calculus level-wise using the classical Androulidakis-Skandalis (AS) machinery, but organized coherently across the simplicial structure.

**Definition 1 (The Analytic Diagram):**
For each level $n$, choose a longitudinally smooth presentation $G_n$ (e.g., a holonomy pair) of the stack level $\mathcal{H}_n$. Let $A^n := C^\ast(G_n)$ (optionally twisted by a bundle $\Sigma_n$ if required). The geometric cofaces and degeneracies are represented by bibundles, inducing correspondences. This data defines a cosimplicial object $A^\bullet$ in $\mathbf{Corr}(C^\ast)$ and $\mathbf{KK}$.


**Definition 2 (The Calculus Triangle):**
For each $n$, the AS longitudinal pseudodifferential calculus on $G_n$ yields a short exact sequence of $C^\ast$-algebras (or an extension), which defines a distinguished triangle in $\mathbf{KK}$:


$$ \Sigma_{\text{cl}}^n \xrightarrow{\partial_n} A^n \longrightarrow \Psi^0_n \longrightarrow \Sigma_{\text{cl}}^n[1] $$

Here, $\Sigma_{\text{cl}}^n \cong C_0(S^\ast\mathcal{F}_n)$ is the algebra of classical symbols on the presentation, and $\Psi^0_n$ is the algebra of order-0 pseudodifferential multipliers compatible with the presentation.


**Assumption (Naturality):** We assume the boundary classes $\partial_n \in KK(\Sigma_{\text{cl}}^n, A^n)$ assemble into a morphism of cosimplicial K-theory spectra:

$$ \partial_\bullet: \mathbb{K}(\Sigma_{\text{cl}}^\bullet) \longrightarrow \Sigma \mathbb{K}(A^\bullet) $$

#### 2. Derived Ellipticity and the Index

We define ellipticity not locally, but via descent data in the totalization.

**Definition 3 (Derived Elliptic Symbol):**
A **Derived Elliptic Symbol** is a class $[\sigma]$ in the homotopy group of the totalization of the symbol spectrum, $[\sigma] \in \pi_0 \text{Tot } \mathbb{K}(\Sigma_{\text{cl}}^\bullet)$, satisfying the following condition:

* **Classical Ellipticity:** Its image under the edge map to the degree-0 term, $\pi_0 \text{Tot } \to \pi_0 K(\Sigma_{\text{cl}}^0)$, is a classically elliptic symbol.
* *Note:* Membership in the totalization guarantees that the symbol carries the necessary coherence data to descend to the stack.

**Remark 1 (Physical Interpretation):** Heuristically, the higher components of a class in the totalization correspond to "ghost fields" or "higher symbols" in a derived cotangent complex model. These terms provide the homotopies required to solve the glueing equations obstructed by the singular foliation relations.

**Definition 4 (The Higher Index Map):**
The morphism of cosimplicial spectra $\partial_\bullet$ induces a map on the homotopy limits (totalizations):

$$ \text{Ind}_\bullet: \pi_0 \text{Tot } \mathbb{K}(\Sigma_{\text{cl}}^\bullet) \longrightarrow \pi_0 \text{Tot } \mathbb{K}(A^\bullet) $$

We call this the **Higher Analytic Index**.

#### 3. Main Results

**Theorem A (Existence and Descent):**
Under the hypotheses above, the Higher Index $\text{Ind}\_\bullet$ is well-defined. Moreover, the target group $\pi\_\ast \text{Tot } \mathbb{K}(A^\bullet)$ is computed by the **Bousfield–Kan Descent Spectral Sequence**:



$$ E_2^{p,q} = H^p_{\text{cosimp}}(\Delta; \pi_q \mathbb{K}(A^\bullet)) \implies \pi_{p+q} \text{Tot } \mathbb{K}(A^\bullet) $$

(assuming standard fibrancy conditions, e.g., after Reedy fibrant replacement). The $E_2$-page of this spectral sequence organizes the higher descent obstructions; in examples with non-trivial isotropy coherence (such as the $SL_2$-action foliation), these obstructions yield a non-trivial filtration of the index group.

**Conjecture B (Derived Geometric Index Formula):**
Suppose the foliation $\mathcal{F}$ admits a Lie $\infty$-algebroid resolution inducing a derived cotangent complex $\mathbb{L}\_{\mathcal{H}}$ for the associated derived stack. We conjecture that the analytic index $\text{Ind}\_\bullet$ admits a cohomological expression via a descent-compatible Chern–Connes character paired with characteristic classes built from $\mathbb{L}\_{\mathcal{H}}$ and a suitable cyclic-type theory of the derived stack.


In orbifold-like regimes (proper étale/compact isotropy), this should recover Kawasaki-type isotropy corrections.

In appropriate transversely oriented settings, it should recover Godbillon–Vey-type higher pairings.
