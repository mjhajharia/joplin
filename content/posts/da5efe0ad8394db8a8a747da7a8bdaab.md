---
title: cotangent space
slug: da5efe0ad8394db8a8a747da7a8bdaab
tags: []
date: 2025-07-22T18:30:31.033Z
---

# cotangent space

Let $M$ be a smooth manifold and $p \in M$. The tangent space at $p$, denoted $T\_p M$, is defined as the space of derivations at $p$, i.e., linear maps

$$
v : C^\infty(M) \to \mathbb{R}
$$

satisfying the Leibniz rule:

$$
v(fg) = v(f)\cdot g(p) + f(p)\cdot v(g) \quad \text{for all } f, g \in C^\infty(M).
$$

The cotangent space at $p$, denoted $T\_p^\* M$, is the dual space:

$$
T\_p^\* M := \operatorname{Hom}(T\_p M, \mathbb{R}),
$$

i.e., the space of linear functionals $\omega : T\_p M \to \mathbb{R}$. Elements of $T\_p^\* M$ are called 1-forms at $p$.

On $\mathbb{R}^n$, equipped with coordinates $(x^1,\dots,x^n)$, the canonical basis of the tangent space is $\left{ \frac{\partial}{\partial x^i} \right}$, and the dual basis of the cotangent space is ${dx^i}$, defined by

$$
dx^i\left(\frac{\partial}{\partial x^j}\right) = \delta^i\_j.
$$

Thus, any tangent vector $v \in T\_p \mathbb{R}^n$ can be written as

$$
v = \sum\_i v^i \frac{\partial}{\partial x^i}, \qquad \text{and any } \omega \in T\_p^\* \mathbb{R}^n \text{ as } \omega = \sum\_i \omega\_i, dx^i,
$$

with pairing given by

$$
\omega(v) = \sum\_i \omega\_i v^i.
$$

Any smooth function $f : M \to \mathbb{R}$ defines a differential at $p$, denoted

$$
df\_p \in T\_p^\* M,
$$

via

$$
df\_p(v) := v(f).
$$

This coincides with the directional derivative of $f$ at $p$ along $v$, and hence $df\_p$ is a 1-form encoding the infinitesimal variation of $f$.

In coordinates, this corresponds to

$$
df\_p = \sum\_i \frac{\partial f}{\partial x^i}(p), dx^i,
$$

so that for any $v = \sum\_i v^i \frac{\partial}{\partial x^i}$, we recover

$$
df\_p(v) = \langle \nabla f(p), v \rangle.
$$
