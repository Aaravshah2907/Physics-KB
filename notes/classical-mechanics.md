---
title: "Classical Mechanics"
tags: [physics, mechanics, theoretical-physics]
date: 2026-02-12
complexity: advanced
---

# Classical Mechanics

## Summary
**Classical Mechanics** is the branch of physics describing the motion of macroscopic objects, from projectiles to parts of machinery, and astronomical objects, such as spacecraft, planets, stars, and galaxies. It is based on the foundational principles laid out by Isaac Newton and later reformulated in more abstract and powerful frameworks by Lagrange and Hamilton. At its core, it assumes a deterministic universe where the state of a system at any future time is fully determined by its current state and the forces acting upon it. While accurate for macroscopic scales and speeds much lower than the speed of light, it is superseded by **Quantum Mechanics** at atomic scales and **General Relativity** at high speeds or strong gravitational fields.

## Fundamental Principles (Newtonian Formalism)

### Newton's Laws of Motion
The foundation of classical mechanics rests on three physical laws that relate the forces acting on a body to its motion.

1.  **First Law (Law of Inertia)**: An object remains at rest or in uniform motion in a straight line unless acted upon by an external force. This defines the concept of an **inertial reference frame**.
2.  **Second Law**: The rate of change of momentum of a body is directly proportional to the force applied, and this change in momentum takes place in the direction of the applied force.
    $$ \mathbf{F} = \frac{d\mathbf{p}}{dt} = \frac{d(m\mathbf{v})}{dt} $$
    For constant mass, this simplifies to the familiar $\mathbf{F} = m\mathbf{a}$.
3.  **Third Law**: For every action, there is an equal and opposite reaction. Mathematically, if body $A$ exerts a force $\mathbf{F}_{AB}$ on body $B$, then body $B$ exerts a force $\mathbf{F}_{BA}$ on body $A$ such that:
    $$ \mathbf{F}_{AB} = -\mathbf{F}_{BA} $$

### Space and Time
In classical mechanics, space is Euclidean and time is absolute. The geometry of space is described by the metric $ds^2 = dx^2 + dy^2 + dz^2$, essentially independent of the observer (Galilean relativity).

![Newton's Cradle](https://upload.wikimedia.org/wikipedia/commons/d/d3/Newtons_cradle_animation_book_2.gif)
*Figure 1: Demonstration of conservation of momentum and energy in a Newtonian system.*

## Lagrangian Formalism (Analytical Mechanics)

While Newtonian mechanics relies on vector quantities (forces), **Lagrangian Mechanics** relies on scalar quantities (energy). This formulation is often more powerful for complex systems with constraints.

### The Principle of Least Action
The dynamical path of a system between times $t_1$ and $t_2$ is a stationary point of the **action functional** $S$.
$$ S[\mathbf{q}(t)] = \int_{t_1}^{t_2} L(\mathbf{q}, \dot{\mathbf{q}}, t) \, dt $$
where $L = T - V$ is the **Lagrangian** ($T$ is kinetic energy, $V$ is potential energy), and $\mathbf{q}$ represents generalized coordinates.

### Euler-Lagrange Equations
Minimizing the action $\delta S = 0$ leads to the equations of motion. For a system with $N$ degrees of freedom:
$$ \frac{d}{dt} \left( \frac{\partial L}{\partial \dot{q}_i} \right) - \frac{\partial L}{\partial q_i} = 0, \quad i=1, \dots, N $$
This framework is extensively detailed in [[eulerlagrange-equations-for-unconstrained-systems]]. For systems with constraints (e.g., a bead on a wire), the method of Lagrange multipliers is used, as discussed in [[eulerlagrange-equations-for-constrained-systems]].

## Hamiltonian Formalism

**[[Hamiltonian Mechanics]]** reformulates the equations of motion in terms of position and momentum, replacing $N$ second-order differential equations with $2N$ first-order differential equations. This takes place in **phase space**.

### The Legendre Transform
The Hamiltonian $H$ is derived from the Lagrangian via a Legendre transformation:
$$ H(q_i, p_i, t) = \sum_i p_i \dot{q}_i - L(q_i, \dot{q}_i, t) $$
where the **canonical momentum** is defined as $p_i = \frac{\partial L}{\partial \dot{q}_i}$.

### Hamilton's Equations
The time evolution of the system is given by:
$$ \dot{q}_i = \frac{\partial H}{\partial p_i}, \quad \dot{p}_i = -\frac{\partial H}{\partial q_i} $$
See [[hamiltonian-mechanics]] for a deeper dive into symplectic geometry and phase space flow.

## Conservation Laws and Symmetries

A pivotal result in classical mechanics is **Noether's Theorem**, which states that every continuous symmetry of the action corresponds to a conserved quantity (integral of motion).

*   **Time Translation Invariance** $\implies$ Conservation of **Energy** ($H$).
*   **Space Translation Invariance** $\implies$ Conservation of **Linear Momentum** ($\mathbf{p}$).
*   **Rotational Invariance** $\implies$ Conservation of **Angular Momentum** ($\mathbf{L}$).

These conservation laws are exact in closed systems and are fundamental constants of motion often linked to [[physical-constants]].

## Central Force Motion

A classic application is the motion of a particle under a central force field, $\mathbf{F}(\mathbf{r}) = f(r) \hat{\mathbf{r}}$, such as gravity or electrostatics.

### The Kepler Problem
For a potential $V(r) = -k/r$ (inverse-square law), the effective potential equation reduces the 3D problem to a 1D problem:
$$ V_{\text{eff}}(r) = \frac{l^2}{2\mu r^2} - \frac{k}{r} $$
where $l$ is angular momentum and $\mu$ is reduced mass. The solutions are conic sections: circles, ellipses, parabolas, and hyperbolas. This explains planetary orbits and scattering trajectories.

## Small Oscillations

Near a stable equilibrium point $q_0$ of a potential $V(q)$, any smooth potential can be approximated as harmonic:
$$ V(q) \approx V(q_0) + \frac{1}{2} k (q-q_0)^2 $$
This leads to the **Simple Harmonic Oscillator**, governed by $\ddot{x} + \omega^2 x = 0$. In coupled systems, this generalizes to **normal modes**, where the system oscillates at eigenfrequencies determined by the mass and stiffness matrices.

## Rigid Body Dynamics

For extended bodies, motion is decomposed into the translation of the center of mass and rotation about the center of mass.

### The Inertia Tensor
The resistance to rotational acceleration is quantified by the inertia tensor $\mathbf{I}$:
$$ \mathbf{L} = \mathbf{I} \boldsymbol{\omega} $$
Unlike point masses, the angular momentum vector $\mathbf{L}$ and angular velocity vector $\boldsymbol{\omega}$ are not necessarily parallel.

### Euler's Equations
The dynamics in the body-fixed frame are described by Euler's equations:
$$ \mathbf{\tau} = \mathbf{I} \dot{\boldsymbol{\omega}} + \boldsymbol{\omega} \times (\mathbf{I} \boldsymbol{\omega}) $$
This explains phenomena like precession and nutation of tops and gyroscopes.

## Limits and Extensions

### Chaos Theory
Deterministic equations do not imply predictability. Non-linear systems (like the double pendulum or the three-body problem) exhibit **sensitivity to initial conditions**, a hallmark of chaos.

### Relativistic Mechanics
When velocities approach the speed of light $c$, Galilean transformations fail. Classical mechanics is generalized by Special Relativity using [[four-vectors]] to treat space and time as a unified manifold.

### Electrodynamics
The interaction of charged particles with fields connects classical mechanics with [[maxwell's-equations]] and [[gauss-law]]. The Lorentz force law governs the motion, and accelerating charges produce [[electromagnetic-waves]].

## References
*   Goldstein, H. *Classical Mechanics*.
*   Landau, L.D. & Lifshitz, E.M. *Mechanics*.
*   Arnold, V.I. *Mathematical Methods of Classical Mechanics*.

### Related Notes
- [[Hamiltonian Mechanics]]

### Related Notes
- [[Trajectory of a Particle Under Gravity]]

### Related Notes
- [[Projectile Motion under Gravity]]
