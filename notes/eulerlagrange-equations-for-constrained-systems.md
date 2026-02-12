---
title: "Euler-Lagrange Equations for Constrained Systems"
tags: [physics, classical-mechanics, lagrangian-mechanics, constraints]
date: 2026-02-12
complexity: advanced
---

# Summary

This note extends the framework of Lagrangian mechanics to systems subject to constraints. While [[eulerlagrange-equations-for-unconstrained-systems]] provide a powerful method for generalized coordinates that are independent, many physical systems involve constraints that relate coordinates to one another (e.g., a pendulum bob fixed to a rod, a particle moving on a surface). We introduce the method of **Lagrange Multipliers** to incorporate these constraints into the variational principle, allowing us to solve for both the motion of the system and the forces of constraint.

# Types of Constraints

Constraints limit the motion of a system. They are generally classified based on their dependence on coordinates, velocities, and time.

## Holonomic Constraints
A constraint is **holonomic** if it can be expressed as an equation relating the generalized coordinates $q_i$ and time $t$:
$$
f_\alpha(q_1, q_2, \dots, q_n, t) = 0, \quad \alpha = 1, \dots, m
$$
where $m$ is the number of constraints. Holonomic constraints reduce the number of degrees of freedom of the system from $n$ to $n-m$.

## Non-Holonomic Constraints
Constraints involving generalized velocities that cannot be integrated to form holonomic constraints are **non-holonomic**. These often take the differential form:
$$
\sum_i a_{\alpha i} dq_i + a_{\alpha t} dt = 0
$$
Common examples include rolling without slipping.

# Modified Hamilton's Principle

For unconstrained systems, **Hamilton's Principle** states that the action $S = \int_{t_1}^{t_2} L dt$ is stationary ($\delta S = 0$).

When constraints are present, the variations $\delta q_i$ are no longer independent; they must satisfy the constraint equations. Using the method of **Lagrange Multipliers**, we can treat the variations as independent by introducing undetermined multipliers $\lambda_\alpha$.

We define a modified Lagrangian $\mathcal{L}$:
$$
\mathcal{L} = L + \sum_{\alpha=1}^m \lambda_\alpha(t) f_\alpha(q, t)
$$
where $L = T - V$ is the standard Lagrangian.

Applying the variational principle $\delta \int \mathcal{L} dt = 0$ leads to:
$$
\int_{t_1}^{t_2} \sum_{i=1}^n \left( \frac{\partial L}{\partial q_i} - \frac{d}{dt} \frac{\partial L}{\partial \dot{q}_i} + \sum_{\alpha=1}^m \lambda_\alpha \frac{\partial f_\alpha}{\partial q_i} \right) \delta q_i \, dt = 0
$$

# The Euler-Lagrange Equations with Multipliers

Because we have introduced $m$ Lagrange multipliers, we can choose them such that the coefficients of the dependent variations vanish. This allows us to treat all $\delta q_i$ as effectively independent, yielding the **Euler-Lagrange equations for constrained systems**:

$$
\frac{d}{dt} \left( \frac{\partial L}{\partial \dot{q}_i} \right) - \frac{\partial L}{\partial q_i} = Q_i^{\text{constr}}
$$

where the **generalized forces of constraint** $Q_i^{\text{constr}}$ are given by:

$$
Q_i^{\text{constr}} = \sum_{\alpha=1}^m \lambda_\alpha \frac{\partial f_\alpha}{\partial q_i}
$$

The complete system of equations to solve consists of:
1.  $n$ differential equations (one for each $q_i$).
2.  $m$ constraint equations ($f_\alpha = 0$).

There are $n + m$ unknowns: $n$ coordinates $q_i$ and $m$ multipliers $\lambda_\alpha$.

# Physical Interpretation of Lagrange Multipliers

The term $Q_i^{\text{constr}}$ represents the force required to maintain the constraint $f_\alpha = 0$.

*   $\lambda_\alpha$ is directly related to the magnitude of the force of constraint (e.g., normal force, tension).
*   The term $\frac{\partial f_\alpha}{\partial q_i}$ projects this force onto the direction of the generalized coordinate $q_i$.

This method is particularly powerful because it allows us to determine forces of constraint (like the tension in a pendulum rod) without resorting to vector mechanics, while still retaining the scalar advantages of the energy-based Lagrangian approach.

# Example: Particle on a Sphere

Consider a particle of mass $m$ constrained to move on the surface of a sphere of radius $R$.
Coordinates: Spherical coordinates $(r, \theta, \phi)$.
Constraint equation:
$$
f(r) = r - R = 0
$$

The Lagrangian is:
$$
L = \frac{1}{2}m(\dot{r}^2 + r^2\dot{\theta}^2 + r^2\sin^2\theta \dot{\phi}^2) - V(r, \theta, \phi)
$$

The equation of motion for the radial coordinate $r$ becomes:
$$
\frac{d}{dt} \left( \frac{\partial L}{\partial \dot{r}} \right) - \frac{\partial L}{\partial r} = \lambda \frac{\partial f}{\partial r}
$$
$$
m\ddot{r} - m(r\dot{\theta}^2 + r\sin^2\theta \dot{\phi}^2) + \frac{\partial V}{\partial r} = \lambda
$$

Since $r=R$ is constant, $\dot{r} = \ddot{r} = 0$. The equation simplifies to:
$$
- m(R\dot{\theta}^2 + R\sin^2\theta \dot{\phi}^2) + \left. \frac{\partial V}{\partial r} \right|_{r=R} = \lambda
$$
Here, $\lambda$ represents the **normal force** exerted by the sphere on the particle to keep it at radius $R$.

# See Also
*   [[eulerlagrange-equations-for-unconstrained-systems]]
*   [[d'Alembert's Principle]]
*   [[Hamiltonian Mechanics]]
*   [[Virtual Work]]

# References
1.  Goldstein, H., Poole, C., & Safko, J. (2002). *Classical Mechanics* (3rd ed.). Addison-Wesley.
2.  Landau, L. D., & Lifshitz, E. M. (1976). *Mechanics* (Vol. 1). Butterworth-Heinemann.
3.  Taylor, J. R. (2005). *Classical Mechanics*. University Science Books.
