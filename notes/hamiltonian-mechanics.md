---
title: "Hamiltonian Mechanics"
tags: [physics, classical-mechanics, hamiltonian, theoretical-physics]
date: 2026-02-12
complexity: advanced
---

# Hamiltonian Mechanics

## Summary
Hamiltonian mechanics is a reformulation of [[classical mechanics]] that evolved from [[Lagrangian mechanics]]. While Lagrangian mechanics focuses on generalized coordinates $q_i$ and velocities $\dot{q}_i$ in configuration space, Hamiltonian mechanics uses generalized coordinates $q_i$ and generalized momenta $p_i$ to describe the system in **phase space**.

The central quantity is the **Hamiltonian** $H$, which usually represents the total energy of the system. This formalism is particularly powerful for analyzing the geometric structure of dynamical systems, studying stability, and bridging the gap to [[quantum mechanics]] and [[statistical mechanics]].

## Derivation from Lagrangian Mechanics

We begin with the Lagrangian $L(q, \dot{q}, t)$, where the equations of motion are given by the [[eulerlagrange-equations-for-unconstrained-systems]]:

$$
\frac{d}{dt} \left( \frac{\partial L}{\partial \dot{q}_i} \right) - \frac{\partial L}{\partial q_i} = 0
$$

To transition to the Hamiltonian formalism, we perform a **Legendre transformation**. We define the **canonical momentum** (or conjugate momentum) $p_i$ as:

$$
p_i \equiv \frac{\partial L}{\partial \dot{q}_i}
$$

Assuming the transformation is invertible (i.e., the Hessian determinant $\det(\frac{\partial^2 L}{\partial \dot{q}_i \partial \dot{q}_j}) \neq 0$), we can express the velocities $\dot{q}_i$ in terms of momenta and coordinates: $\dot{q}_i = \dot{q}_i(q, p, t)$.

The Hamiltonian $H(q, p, t)$ is defined by the Legendre transform of the Lagrangian:

$$
H(q, p, t) = \sum_{i} p_i \dot{q}_i - L(q, \dot{q}, t)
$$

## Hamilton's Canonical Equations

To derive the equations of motion, we take the total differential of the Hamiltonian $H(q, p, t)$:

$$
dH = \sum_i \left( \frac{\partial H}{\partial q_i} dq_i + \frac{\partial H}{\partial p_i} dp_i \right) + \frac{\partial H}{\partial t} dt
$$

Alternatively, using the definition $H = \sum p_i \dot{q}_i - L$:

$$
dH = \sum_i ( \dot{q}_i dp_i + p_i d\dot{q}_i ) - \sum_i \left( \frac{\partial L}{\partial q_i} dq_i + \frac{\partial L}{\partial \dot{q}_i} d\dot{q}_i \right) - \frac{\partial L}{\partial t} dt
$$

Substituting $p_i = \partial L / \partial \dot{q}_i$ and using the Euler-Lagrange equation $\dot{p}_i = \partial L / \partial q_i$ (valid for [[eulerlagrange-equations-for-unconstrained-systems]]):

$$
dH = \sum_i ( \dot{q}_i dp_i + p_i d\dot{q}_i ) - \sum_i ( \dot{p}_i dq_i + p_i d\dot{q}_i ) - \frac{\partial L}{\partial t} dt
$$

Simplifying:

$$
dH = \sum_i ( \dot{q}_i dp_i - \dot{p}_i dq_i ) - \frac{\partial L}{\partial t} dt
$$

Comparing the coefficients of the differentials $dq_i$, $dp_i$, and $dt$ yields **Hamilton's Canonical Equations**:

$$
\dot{q}_i = \frac{\partial H}{\partial p_i}
$$
$$
-\dot{p}_i = \frac{\partial H}{\partial q_i}
$$
$$
-\frac{\partial L}{\partial t} = \frac{\partial H}{\partial t}
$$

These are $2n$ first-order differential equations, replacing the $n$ second-order equations of the Lagrangian formalism.

## Properties of the Hamiltonian

### Conservation of Energy
If the Lagrangian does not explicitly depend on time ($\partial L / \partial t = 0$), then $\partial H / \partial t = 0$, and the Hamiltonian is a constant of motion. Typically, for conservative systems with holonomic time-independent constraints (see [[eulerlagrange-equations-for-constrained-systems]]), $H = T + V$, representing the total energy.

### Phase Space and Liouville's Theorem
The state of a system is represented by a point in **phase space** with coordinates $(q_1, \dots, q_n, p_1, \dots, p_n)$. The time evolution traces a trajectory in this $2n$-dimensional space.

The Hamiltonian vector field generates an incompressible flow in phase space. This is stated by **Liouville's Theorem**, which says that the phase-space volume occupied by a collection of systems is conserved under time evolution:

$$
\frac{d\rho}{dt} = \frac{\partial \rho}{\partial t} + \{ \rho, H \} = 0
$$

where $\rho$ is the phase space density and $\{\cdot, \cdot\}$ denotes the Poisson Bracket.

## Poisson Brackets

The **Poisson Bracket** of two functions $f$ and $g$ on phase space is defined as:

$$
\{f, g\} = \sum_i \left( \frac{\partial f}{\partial q_i} \frac{\partial g}{\partial p_i} - \frac{\partial f}{\partial p_i} \frac{\partial g}{\partial q_i} \right)
$$

The equations of motion can be elegantly written using Poisson brackets:

$$
\frac{df}{dt} = \{f, H\} + \frac{\partial f}{\partial t}
$$

This structure is directly analogous to the commutator in [[quantum-mechanics]], where the classical Poisson bracket $\{A, B\}$ corresponds to the quantum commutator $\frac{1}{i\hbar}[\hat{A}, \hat{B}]$ (Dirac quantization rule).

## Applications and Extensions

1.  **Electromagnetism**: For a charged particle in an electromagnetic field, the canonical momentum is $p = m\mathbf{v} + q\mathbf{A}$, leading to the Hamiltonian:
    $$
    H = \frac{1}{2m}(\mathbf{p} - q\mathbf{A})^2 + q\phi
    $$
    This relates to [[maxwell's-equations]] and the gauge invariance of the potentials.

2.  **Relativistic Mechanics**: The Hamiltonian formalism can be extended to Special Relativity, often utilizing [[fourvectors]] to maintain covariant notation.

## Further Reading

*   Goldstein, H. *Classical Mechanics*. Addison-Wesley.
*   Landau, L. D., & Lifshitz, E. M. *Mechanics*. Butterworth-Heinemann.
*   [[Lagrangian Mechanics]] - The foundation for deriving the Hamiltonian.
*   [[Noether's Theorem]] - Relating symmetries to conserved quantities.
*   [Wikipedia: Hamiltonian Mechanics](https://en.wikipedia.org/wiki/Hamiltonian_mechanics)

### Related Notes
- [[Euler-Lagrange Equations for Constrained Systems]]

### Related Notes
- [[4-Vector Notation in Relativity]]

### Related Notes
- [[Physical Constants]]
