---
layout: post
title: Superconnections on transversely holomorphic foliations
date: 2026-09-07 00:00:00-0400
description: A finite superconnection model for derived coherent sheaves, connecting de Rham geometry, Dolbeault geometry, and monodromy.
tags: math regular-foliations algebraic-geometry differential-geometry derived-geometry
categories: math
---

My new preprint, [_Superconnections, descent, and monodromy on transversely holomorphic foliations_](https://arxiv.org/abs/2609.04796), is now on arXiv. It studies a geometry that lies between smooth manifolds and complex manifolds, and gives a finite differential-geometric model for its derived coherent sheaves.

## A mixed de Rham-Dolbeault geometry

A transversely holomorphic foliation looks locally like a product $B^d\times\Delta^n$: real plaques in the first factor and a complex transversal in the second. Its natural functions are constant along the plaques and holomorphic across them. These form a structure sheaf $\mathcal O_V$.

The infinitesimal description uses an **elliptic involutive structure** $V\subset T_{\mathbb C}X$, a complex subbundle closed under brackets and satisfying $V+\overline V=T_{\mathbb C}X$. Its differential-form algebra is

$$
\mathcal A_X^\bullet=
\left(\bigwedge\nolimits^\bullet V^\vee,d_V\right).
$$

On an adapted chart, $d_V$ combines the de Rham differential in the real directions with the Dolbeault operator in the transverse complex directions. The question is whether finite bundles and superconnections over this mixed algebra can describe derived coherent sheaves.

## A finite model for derived coherent sheaves

**Main result.** Let $X$ be compact and without boundary. Write $\mathcal P_V$ for the differential graded category of bounded graded finite-rank smooth bundles equipped with flat $V$-superconnections. Sheafification gives an exact equivalence

$$
H^0(\mathcal P_V)
\simeq
D^b_{\mathrm{coh}}(X,\mathcal O_V).
$$

The left side is the homotopy category of these superconnections. The right side is the derived category of $\mathcal O_V$-modules with bounded coherent cohomology. Thus a sheaf-theoretic object can be represented by finite smooth bundle data with a differential whose square is zero.

This recovers two familiar endpoints. When $V=T_{\mathbb C}X$, it gives the de Rham model for finite homotopy local systems. When $X$ is complex and $V=T^{0,1}X$, it recovers Block's Dolbeault description of derived coherent analytic sheaves. The mixed case allows both kinds of geometry at once.

## The local step, and how it glues

The key input is a local reduction for the **whole superconnection**, rather than just a Poincare lemma for scalar forms. After shrinking an adapted chart, a multiplicative homotopy first contracts the real directions. Block's Dolbeault gauge construction then removes the remaining positive transverse form degrees, leaving, up to homotopy gauge equivalence, a finite complex of free holomorphic modules.

This supplies the local condition needed for a general sheaf-theoretic comparison. The paper also proves descent for compatible local superconnections. For an infinite locally finite cover, there must be a common bound on ranks and a common finite range of degrees; being finite on each open set separately is not enough.

## Monodromy is not the same as holonomy

At the level of coherent sheaves, restriction to a complete transversal identifies the category with equivariant coherent analytic sheaves on a transverse **monodromy groupoid**. Such an object descends to ordinary holonomy precisely when every monodromy loop with trivial transverse holonomy acts as the identity.

This statement does not automatically extend to the full derived category. Take $S^2$ with the de Rham structure, viewed as one leaf. Its ordinary monodromy groupoid, restricted to a point, is trivial. Nevertheless, the trivial superconnection has a nonzero degree-two self-extension, coming from $H^2(S^2;\mathbb C)\cong\mathbb C$. An ordinary monodromy $1$-groupoid misses this higher topology.

## A computable suspension example

There is a positive derived description for a **holomorphic suspension**: glue the ends of $[0,1]\times Z$ using a biholomorphism $\phi$ of a compact complex manifold $Z$. The resulting space has real leaf directions and transverse complex geometry.

Its superconnection category is, up to Morita equivalence, the **homotopy fixed-point category** of the Dolbeault category of $Z$ under $\phi^*$. This retains equivariance together with its higher coherence, rather than taking ordinary fixed objects.

For an elliptic curve $E$ with $\phi=[-1]$, the self-Ext dimensions of $\mathcal O_V$ in degrees $0,1,2$ are $1,1,0$, compared with $1,2,1$ for the product $S^1\times E$. The twisting acts by $-1$ on $H^1(E,\mathcal O_E)$ and removes its invariant and coinvariant contributions. Monodromy therefore changes the extension theory in a concrete, computable way.

For the complementary smooth leafwise transport picture, see [my post on the higher Riemann-Hilbert correspondence]({% post_url 2026-09-07-higher-riemann-hilbert-regular-foliations %}).
