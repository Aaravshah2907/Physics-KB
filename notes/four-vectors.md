---
title: "Four-Vectors"
tags: [physics, relativity, tensors, math]
date: 2026-02-12
complexity: advanced
---

# Summary

A **Four-Vector** is a vector in a four-dimensional vector space (Minkowski space) that transforms under a Lorentz transformation. It unifies temporal and spatial components into a single geometric object, essential for the formulation of **Special Relativity**. The invariance of the scalar product of four-vectors ensures that physical laws remain consistent across all inertial frames of reference.

# Introduction to Minkowski Space

In classical mechanics, space and time are treated as separate entities. However, strictly adhering to the postulates of Special Relativity requires a unified framework known as **Minkowski Spacetime**. In this geometry, an event is specified by four coordinates: one temporal and three spatial.

To ensure that the speed of light $c$ is invariant in all inertial frames, we define the position four-vector $x^\mu$ (where $\mu = 0, 1, 2, 3$) as:

$$
x^\mu = \begin{pmatrix} ct \\ x \\ y \\ z \end{pmatrix}
$$

Here, $x^0 = ct$ represents the time component scaled by the speed of light to match the dimensions of length.

## Lorentz Transformations

A four-vector $A^\mu$ is defined strictly by how it transforms when moving between inertial frames. If we boost along the $x$-axis with velocity $v$, the components transform via the Lorentz matrix $\Lambda^\mu_\nu$:

$$
A'^\mu = \Lambda^\mu_\nu A^\nu
$$

Where the boost matrix $\Lambda$ is:

$$
\Lambda = \begin{pmatrix} 
\gamma & -\beta\gamma & 0 & 0 \\
-\beta\gamma & \gamma & 0 & 0 \\
0 & 0 & 1 & 0 \\
0 & 0 & 0 & 1 
\end{pmatrix}
$$

Here, $\beta = v/c$ and $\gamma = \frac{1}{\sqrt{1-\beta^2}}$.

![Light Cone](https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/World_line.svg/600px-World_line.svg.png)
*Figure 1: A spacetime diagram showing the light cone. The trajectory of a particle is a world line in Minkowski space. Four-vectors are tangent to these world lines.*

# Tensor Notation: Contravariant vs. Covariant

To construct invariant quantities, we must distinguish between **contravariant** vectors (indices up) and **covariant** vectors (indices down).

## The Metric Tensor
The geometry of spacetime is defined by the metric tensor $\eta_{\mu\nu}$. In the standard particle physics convention $(+,-,-,-)$, it is defined as:

$$
\eta_{\mu\nu} = \eta^{\mu\nu} = \begin{pmatrix} 
1 & 0 & 0 & 0 \\
0 & -1 & 0 & 0 \\
0 & 0 & -1 & 0 \\
0 & 0 & 0 & -1 
\end{pmatrix}
$$

## Raising and Lowering Indices
We transition between contravariant ($A^\mu$) and covariant ($A_\mu$) forms using the metric tensor:

$$
A_\mu = \eta_{\mu\nu} A^\nu = (A^0, -A^1, -A^2, -A^3)
$$

Conversely:
$$
A^\mu = \eta^{\mu\nu} A_\nu
$$

This distinction is crucial because the spatial components flip signs when lowering the index.

## The Scalar Product (Lorentz Invariant)
The inner product of two four-vectors $A$ and $B$ is a Lorentz scalar (invariant under rotation and boost). It is defined using Einstein summation notation:

$$
A \cdot B = A^\mu B_\mu = \eta_{\mu\nu} A^\mu B^\nu = A^0 B^0 - \mathbf{A} \cdot \mathbf{B}
$$

If $A^\mu = x^\mu$, the invariant interval is $s^2 = (ct)^2 - |\mathbf{x}|^2$. This invariance is the geometric core of relativity.

# Fundamental Four-Vectors

## 1. Four-Velocity
In classical mechanics, velocity is $d\mathbf{x}/dt$. In relativity, time $t$ is frame-dependent. We therefore differentiate with respect to **proper time** $\tau$, which is the time measured by a clock moving with the particle ($d\tau = dt/\gamma$).

The four-velocity $U^\mu$ is:

$$
U^\mu = \frac{dx^\mu}{d\tau} = \frac{dt}{d\tau} \frac{dx^\mu}{dt} = \gamma (c, \mathbf{u})
$$

**Norm**: The magnitude of the four-velocity is always constant:
$$
U^\mu U_\mu = c^2
$$

## 2. Four-Momentum
Momentum is crucial for conservation laws. We define four-momentum $P^\mu$ as rest mass $m$ times four-velocity:

$$
P^\mu = m U^\mu = (\gamma m c, \gamma m \mathbf{u}) = (E/c, \mathbf{p})
$$

This elegantly unifies energy and momentum:
*   $P^0 = E/c$ (Total Energy)
*   $\mathbf{P} = \mathbf{p}$ (Relativistic Momentum)

**Invariant Mass**: The scalar product of the four-momentum yields the energy-momentum relation:

$$
P^\mu P_\mu = \frac{E^2}{c^2} - p^2 = m^2 c^2 \implies E^2 = (pc)^2 + (mc^2)^2
$$

This structure is fundamental when analyzing particle collisions or deriving [[hamiltonian-mechanics]] in a relativistic context.

## 3. Four-Current
In [[electromagnetic-waves]] and field theory, charge density $\rho$ and current density $\mathbf{J}$ constitute a four-vector $J^\mu$:

$$
J^\mu = (c\rho, \mathbf{J})
$$

Charge conservation is expressed by the four-divergence being zero:
$$
\partial_\mu J^\mu = \frac{\partial (c\rho)}{c \partial t} + \nabla \cdot \mathbf{J} = 0
$$

## 4. Four-Potential
The scalar potential $\phi$ and vector potential $\mathbf{A}$ form the electromagnetic four-potential $A^\mu$:

$$
A^\mu = (\phi/c, \mathbf{A})
$$

This definition allows [[maxwell's-equations]] to be written in an explicitly covariant form using the electromagnetic field tensor $F^{\mu\nu} = \partial^\mu A^\nu - \partial^\nu A^\mu$.

# Calculus on Four-Vectors

The gradient operator in 4D spacetime is a covariant vector denoted by $\partial_\mu$:

$$
\partial_\mu \equiv \frac{\partial}{\partial x^\mu} = \left( \frac{1}{c} \frac{\partial}{\partial t}, \nabla \right)
$$

The contravariant form is:
$$
\partial^\mu \equiv \frac{\partial}{\partial x_\mu} = \left( \frac{1}{c} \frac{\partial}{\partial t}, -\nabla \right)
$$

The four-dimensional Laplacian (the D'Alembertian) is the scalar product of the gradients:
$$
\square = \partial_\mu \partial^\mu = \frac{1}{c^2} \frac{\partial^2}{\partial t^2} - \nabla^2
$$

This operator appears frequently in wave equations, such as those governing [[electromagnetic-waves]].

# References
*   Jackson, J. D. *Classical Electrodynamics*.
*   Goldstein, H. *Classical Mechanics*.
*   Griffiths, D. J. *Introduction to Electrodynamics*.
