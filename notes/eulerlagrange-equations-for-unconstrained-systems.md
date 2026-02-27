---
title: "Euler-Lagrange Equations for Unconstrained Systems"
tags: [physics, mechanics, lagrangian-mechanics]
date: 2026-02-12
complexity: advanced
---

# Euler-Lagrange Equations for Unconstrained Systems

## Summary

The **Euler-Lagrange equations** form the core of **[[Lagrangian Mechanics]]**, offering a powerful alternative to [[Newtonian Mechanics]]. For unconstrained systems—systems where the motion is not restricted by geometric constraints (like a bead on a wire)—these equations are derived directly from [[Hamilton's Principle]] (the Principle of Least Action). They provide a systematic method to derive equations of motion using **generalized coordinates**, often simplifying problems involving complex symmetries or non-Cartesian coordinate systems.

## [[Generalized Coordinates]]

In Newtonian mechanics, we typically use Cartesian vector coordinates $\mathbf{r}_i$. However, in Lagrangian mechanics, we describe the configuration of a system with $N$ degrees of freedom using a set of independent **generalized coordinates**:

$$ q = \{q_1, q_2, \dots, q_N\} $$

For an unconstrained system of $P$ particles in 3D space, the number of degrees of freedom is simply $N = 3P$.
The time derivatives of these coordinates are the **generalized velocities**:

$$ \dot{q} = \{\dot{q}_1, \dot{q}_2, \dots, \dot{q}_N\} $$

## The Lagrangian

The central quantity in this formalism is the **Lagrangian** $\mathcal{L}$, defined as the difference between the kinetic energy $T$ and the potential energy $V$:

$$ \mathcal{L}(q, \dot{q}, t) = T(q, \dot{q}, t) - V(q, t) $$

Note that for conservative systems, the potential $V$ usually depends only on position $q$, not velocity $\dot{q}$.

## Hamilton's Principle (Principle of Least Action)

The dynamics of the system are determined by the **Action** functional $S$, which is the time integral of the Lagrangian between two fixed time points $t_1$ and $t_2$:

$$ S[q(t)] = \int_{t_1}^{t_2} \mathcal{L}(q(t), \dot{q}(t), t) \, dt $$

**Hamilton's Principle** states that the true path of motion $q(t)$ taken by the system is the one that makes the action $S$ stationary (usually a minimum). Mathematically, the first variation of the action must vanish:

$$ \delta S = 0 $$

## Derivation from Calculus of Variations

To find the path that satisfies $\delta S = 0$, we consider a small variation $\delta q(t)$ from the true path $q(t)$, such that the endpoints are fixed:
$$ \delta q(t_1) = \delta q(t_2) = 0 $$

The variation of the action is:

$$ \delta S = \int_{t_1}^{t_2} \delta \mathcal{L} \, dt = \int_{t_1}^{t_2} \sum_{i=1}^N \left( \frac{\partial \mathcal{L}}{\partial q_i} \delta q_i + \frac{\partial \mathcal{L}}{\partial \dot{q}_i} \delta \dot{q}_i \right) dt $$

Using the fact that $\delta \dot{q}_i = \frac{d}{dt}(\delta q_i)$, we integrate the second term by parts:

$$ \int_{t_1}^{t_2} \frac{\partial \mathcal{L}}{\partial \dot{q}_i} \frac{d}{dt}(\delta q_i) \, dt = \left[ \frac{\partial \mathcal{L}}{\partial \dot{q}_i} \delta q_i \right]_{t_1}^{t_2} - \int_{t_1}^{t_2} \frac{d}{dt} \left( \frac{\partial \mathcal{L}}{\partial \dot{q}_i} \right) \delta q_i \, dt $$

Since the variations vanish at the endpoints ($\delta q_i(t_1) = \delta q_i(t_2) = 0$), the boundary term vanishes. Substituting this back into the expression for $\delta S$:

$$ \delta S = \int_{t_1}^{t_2} \sum_{i=1}^N \left[ \frac{\partial \mathcal{L}}{\partial q_i} - \frac{d}{dt} \left( \frac{\partial \mathcal{L}}{\partial \dot{q}_i} \right) \right] \delta q_i \, dt = 0 $$

Since the variations $\delta q_i$ are arbitrary and independent (due to the system being unconstrained), the term in the brackets must be zero for each coordinate $i$.

## The Euler-Lagrange Equations

This yields the system of $N$ second-order differential equations known as the **Euler-Lagrange equations**:

$$ \frac{d}{dt} \left( \frac{\partial \mathcal{L}}{\partial \dot{q}_i} \right) - \frac{\partial \mathcal{L}}{\partial q_i} = 0, \quad i = 1, \dots, N $$

### Generalized Momentum

We define the **generalized momentum** conjugate to the coordinate $q_i$ as:

$$ p_i \equiv \frac{\partial \mathcal{L}}{\partial \dot{q}_i} $$

Using this definition, the Euler-Lagrange equations can be written as:

$$ \dot{p}_i = \frac{\partial \mathcal{L}}{\partial q_i} $$

This form highlights the connection to Newton's Second Law, where the time derivative of momentum equals the "generalized force" derived from the Lagrangian.

## Equivalence to Newton's Laws

Consider a single particle of mass $m$ in a conservative potential $V(\mathbf{r})$ using Cartesian coordinates ($x, y, z$).
The kinetic energy is $T = \frac{1}{2}m(\dot{x}^2 + \dot{y}^2 + \dot{z}^2)$.
The potential energy is $V(x, y, z)$.
The Lagrangian is:
$$ \mathcal{L} = \frac{1}{2}m(\dot{x}^2 + \dot{y}^2 + \dot{z}^2) - V(x, y, z) $$

Applying the Euler-Lagrange equation for $x$:
1.  **Partial with respect to velocity**:
    $$ \frac{\partial \mathcal{L}}{\partial \dot{x}} = m\dot{x} = p_x $$
2.  **Time derivative**:
    $$ \frac{d}{dt} (m\dot{x}) = m\ddot{x} $$
3.  **Partial with respect to position**:
    $$ \frac{\partial \mathcal{L}}{\partial x} = -\frac{\partial V}{\partial x} = F_x $$

Resulting equation:
$$ m\ddot{x} - F_x = 0 \implies F_x = ma_x $$

This recovers Newton's Second Law, demonstrating the consistency of the Lagrangian formulation.

## Conservation Laws

### Cyclic Coordinates
If the Lagrangian does not explicitly depend on a particular coordinate $q_k$ (i.e., $\frac{\partial \mathcal{L}}{\partial q_k} = 0$), then $q_k$ is called a **cyclic coordinate**.
The Euler-Lagrange equation for a cyclic coordinate becomes:

$$ \frac{d}{dt} \left( \frac{\partial \mathcal{L}}{\partial \dot{q}_k} \right) = 0 \implies p_k = \text{constant} $$

This leads to the conservation of generalized momentum. For example, if $\mathcal{L}$ is independent of position (translational symmetry), linear momentum is conserved.

### Conservation of Energy (Jacobi Integral)
If the Lagrangian does not depend explicitly on time ($\frac{\partial \mathcal{L}}{\partial t} = 0$), the **Beltrami identity** or Jacobi Integral $h$ is conserved:

$$ h = \sum_i \dot{q}_i \frac{\partial \mathcal{L}}{\partial \dot{q}_i} - \mathcal{L} = \text{constant} $$

For natural systems where kinetic energy $T$ is a homogeneous quadratic function of $\dot{q}$, this quantity $h$ is equal to the total energy $E = T + V$.

## Example: The Harmonic Oscillator

Consider a mass $m$ attached to a spring with spring constant $k$ in 1D.
*   **Coordinate**: $x$
*   **Kinetic Energy**: $T = \frac{1}{2}m\dot{x}^2$
*   **Potential Energy**: $V = \frac{1}{2}kx^2$
*   **Lagrangian**:
    $$ \mathcal{L} = \frac{1}{2}m\dot{x}^2 - \frac{1}{2}kx^2 $$

Apply Euler-Lagrange:
$$ \frac{\partial \mathcal{L}}{\partial \dot{x}} = m\dot{x}, \quad \frac{d}{dt}(m\dot{x}) = m\ddot{x} $$
$$ \frac{\partial \mathcal{L}}{\partial x} = -kx $$

Equation of motion:
$$ m\ddot{x} - (-kx) = 0 \implies m\ddot{x} + kx = 0 $$

This is the standard equation for simple harmonic motion.

## References
*   Landau, L. D., & Lifshitz, E. M. (1976). *Mechanics*. Butterworth-Heinemann.
*   Goldstein, H., Poole, C., & Safko, J. (2002). *[[Classical Mechanics]]*. Addison Wesley.
*   See also: [[eulerlagrange-equations-for-constrained-systems]], [[hamiltonian-mechanics]].

### Related Notes
- [[Trajectory of a Particle Under Gravity]]
