---
layout: post
title: Higher Riemann-Hilbert correspondence for regular foliations
date: 2026-09-07 00:00:00-0400
description: From flat leafwise superconnections to smooth higher parallel transport, with a local-to-global descent theorem.
tags: math regular-foliations differential-geometry higher-category-theory
categories: math
---

A substantially revised version of my paper, [_Higher Riemann-Hilbert Correspondence and Descent for Regular Foliations_](https://arxiv.org/abs/2503.08457), is now on arXiv. The guiding question is how to describe flat differential-geometric data along the leaves of a foliation using parallel transport, while retaining both higher homotopies and smooth variation between leaves.

## From flat connections to higher transport

The classical smooth Riemann-Hilbert correspondence relates flat vector bundles to local systems: a flat connection gives parallel transport along paths, depending only on their homotopy classes. For a regular foliation $\mathcal F\subset TM$, we instead allow paths and differential forms only in the leaf directions.

The higher version replaces a vector bundle by a bounded graded bundle $E^\bullet$ and an ordinary connection by a **flat leafwise superconnection**

$$
\mathbb E=\mathbb E^0+\mathbb E^1+\mathbb E^2+\cdots,
\qquad \mathbb E\circ\mathbb E=0.
$$

Here $\mathbb E^0$ is an internal differential, $\mathbb E^1$ is a leafwise connection, and the higher form components encode compatibility up to homotopy. The flatness condition means that the full operator squares to zero.

On the other side, an **infinity-local system** assigns a complex to each point, chain maps to leafwise paths, homotopies to leafwise triangles, and compatible higher homotopies to higher-dimensional simplices. These assignments must depend smoothly on smooth families of simplices, including variation in the transverse direction.

## What the correspondence says

**Main result.** On a compact smooth manifold without boundary with a regular foliation, higher integration gives an $A_\infty$ quasi-equivalence between leafwise cohesive modules and smooth infinity-local systems, with the finiteness, regularity, and morphism conventions below. In particular, this compares morphism complexes as well as objects.

A cohesive module is the superconnection object just described. On both sides, the graded bundles have finite rank and are globally bounded in degree. Their fiberwise cohomology dimensions must also be locally constant. This last condition is a regularity assumption on the objects, separate from regularity of the foliation.

There is an important feature of the target: **the global transport objects are kept, but their morphism presheaves are sheafified**. Morphisms therefore admit compatible local representatives. The theorem concerns this sheafified-Hom category; it does not assert a global comparison with the original, unsheafified morphism complexes.

For noncompact manifolds, integration is still quasi-fully faithful: it induces quasi-isomorphisms on morphism complexes. The global statement that every target object comes from a superconnection is proved under compactness.

## Why descent enters the proof

The construction combines iterated integrals with a local-to-global argument. On a star-shaped foliated box, contracting the plaques produces an explicit local inverse. A simplicial prism keeps track of the higher homotopies during this contraction.

The remaining issue is to glue these local inverses without losing their coherence. Effective descent for cohesive modules produces a global superconnection, while Cech descent for the target morphism sheaves glues the comparison maps. This lets the theorem apply without requiring the space of leaves to be a well-behaved manifold.

## A family of circles

Consider $M=S^1\times T$, with $T$ compact, foliated by the circle fibers. An ordinary flat leafwise bundle can be described by a vector bundle $K\to T$ together with a smooth bundle automorphism $A:K\to K$: the monodromy around each circle.

The transverse smoothness is already visible in leafwise cohomology:

$$
H^0_{\mathcal F}(S^1\times T)
\cong H^1_{\mathcal F}(S^1\times T)
\cong C^\infty(T),
$$

with real coefficients and no higher cohomology. We are studying a smooth family over $T$, not a collection of unrelated calculations on individual circles.

The higher correspondence extends this picture from bundles to regular bounded complexes, retaining homotopy-coherent transport and the full morphism complexes. The paper stays within regular smooth foliations; a corresponding theorem for singular foliations or general $L_\infty$-algebroids is not asserted.

For the complementary story with transverse holomorphic geometry, see [my post on superconnections and transversely holomorphic foliations]({% post_url 2026-09-07-superconnections-transversely-holomorphic-foliations %}).
