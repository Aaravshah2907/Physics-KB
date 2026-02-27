---
title: "Projectile Motion under Gravity"
tags: [physics, mechanics, ballistics, fluid-dynamics]
date: 2026-02-13
complexity: advanced
---

# Projectile Motion under Gravity

Summary: This note explores the core principles of Projectile Motion under Gravity, from its idealized mathematical foundations in a vacuum to complex ballistic modeling involving fluid resistance and geophysical perturbations.


## Summary

**Projectile Motion** is a form of curvilinear motion experienced by an object or particle (the *projectile*) that is projected near the Earth's surface and moves along a curved path under the action of gravity only (in the idealized case). This motion is a cornerstone of [[Classical Mechanics]], serving as a primary example of two-dimensional [[Kinematics]] where the principle of **superposition** allows the independent analysis of horizontal and vertical components.

### The Idealized Model
In the absence of [[Air Resistance]] (drag) and assuming a uniform gravitational field, the motion is governed by [[Newton's Laws of Motion]]. The defining characteristic of this system is that the horizontal velocity component remains constant, while the vertical component undergoes constant acceleration due to gravity ($g$).

![[ideal-projectile-motion-for-different-angles.svg]]

Mathematically, for a projectile launched with initial speed $v_0$ at an angle $\theta$ to the horizontal, the equations of motion yield a **parabolic trajectory** given by:

$$ y(x) = x \tan\theta - \frac{g}{2v_0^2 \cos^2\theta}x^2 $$

### Real-World Dynamics and Drag
In physical reality, projectiles move through a fluid (air), experiencing a drag force $\mathbf{F}_d$ that opposes velocity. This force breaks the symmetry of the parabola, creating a "ballistic trajectory" where the descent is steeper than the ascent and the range is significantly reduced. This note explores the rigorous derivation of the vacuum case, the advanced modeling of linear and quadratic air resistance, and the geophysical perturbations required for high-precision ballistics.


## Fundamental Principles and Assumptions

The study of projectile motion is founded upon a set of idealizations and physical principles that simplify the complex dynamics of real-world motion into a solvable mathematical framework.

### The Ideal Projectile Model
To analyze projectile motion without confounding effects, we employ the **Ideal Projectile Model**:
1.  **Point Particle Approximation**: We ignore rotational dynamics (Magnus effect) and shape-dependent lift.
2.  **Vacuum Conditions**: Initial analysis assumes air resistance is negligible.
3.  **Constant Gravitational Field**: $\vec{g}$ is constant in magnitude ($g \approx 9.81 \, \text{m/s}^2$) and direction.
4.  **Flat Earth Approximation**: Altitude change $h$ is small compared to Earth's radius $R_E$.

### Independence of Horizontal and Vertical Motions
Articulated by Galileo in 1638, the **Principle of Independence of Motion** states that horizontal and vertical components are independent.
*   **Horizontal Motion**: $F_x = 0 \implies$ constant horizontal velocity $v_x$.
*   **Vertical Motion**: $F_y = -mg \implies$ constant downward acceleration $g$.

$$
\begin{align}
\text{Horizontal:} & \quad \frac{d^2x}{dt^2} = 0 \implies v_x(t) = v_{0x} \\
\text{Vertical:} & \quad \frac{d^2y}{dt^2} = -g \implies v_y(t) = v_{0y} - gt
\end{align}
$$

#### Simulation: Independence of Motion
```python
---SIMULATION:python:independence_demo.py---
import numpy as np
import matplotlib.pyplot as plt

def simulate_independence():
    g, h, v_horiz, dt = 9.81, 50.0, 10.0, 0.05
    t_max = np.sqrt(2*h/g)
    t = np.arange(0, t_max + dt, dt)
    y1, x1 = h - 0.5 * g * t**2, np.zeros_like(t)
    y2, x2 = h - 0.5 * g * t**2, v_horiz * t
    
    plt.figure(figsize=(10, 6))
    plt.plot(x1, y1, 'bo', label='Dropped Ball')
    plt.plot(x2, y2, 'ro', label='Fired Ball')
    for i in range(0, len(t), 5): plt.plot([x1[i], x2[i]], [y1[i], y2[i]], 'k--', alpha=0.3)
    plt.title("Independence of Motion")
    plt.xlabel("Horizontal Distance (m)"); plt.ylabel("Height (m)")
    plt.legend(); plt.grid(True)
    plt.savefig('independence_simulation.png')

if __name__ == "__main__": simulate_independence()
```


## Kinematics of Ideal Projectile Motion

In a vacuum, the motion is determined by the integration of the constant acceleration vector $\vec{a} = (0, -g)$.

### Initial Conditions
Launching from $(x_0, y_0)$ with speed $v_0$ at angle $\theta$:
$$ \vec{v}_0 = (v_0 \cos\theta, v_0 \sin\theta) $$

### Velocity and Position Vectors
**Horizontal Component (Uniform Motion):**
$$ v_x(t) = v_0 \cos\theta, \quad x(t) = x_0 + (v_0 \cos\theta) t $$

**Vertical Component (Uniform Acceleration):**
$$ v_y(t) = v_0 \sin\theta - gt, \quad y(t) = y_0 + (v_0 \sin\theta)t - \frac{1}{2}gt^2 $$

![[ideal-projectile-motion-for-different-angles.svg]]
*Figure 1: Trajectories of ideal projectiles. Max range occurs at 45° in vacuum.*


## Mathematical Formalism

### Derivation of Motion Parameters
Setting the launch point at $(0,0)$:

*   **Time of Flight ($T$):** Solve $y(T) = 0 \implies T = \frac{2v_0 \sin\theta}{g}$.
*   **Maximum Height ($H$):** Occurs when $v_y = 0$ at $t = T/2 \implies H = \frac{v_0^2 \sin^2\theta}{2g}$.
*   **Horizontal Range ($R$):** $R = x(T) = \frac{v_0^2 \sin(2\theta)}{g}$.

### The Trajectory Equation
Eliminating $t$ by substituting $t = \frac{x}{v_0 \cos\theta}$ into $y(t)$:
$$ y(x) = (\tan\theta) x - \left( \frac{g}{2v_0^2 \cos^2\theta} \right) x^2 $$
This defines a **parabola** opening downwards.


## Air Resistance and Fluid Dynamics

In any fluid medium (like Earth's atmosphere), a projectile experiences a resistive force called **Drag** ($\mathbf{F}_d$), which acts in the direction opposite to the instantaneous velocity $\mathbf{v}$.

### The Drag Force Model
The nature of air resistance depends on the flow regime, characterized by the [[Reynolds Number]] ($Re$):
$$ Re = \frac{\rho v L}{\eta} $$
where $\rho$ is fluid density, $v$ is speed, $L$ is a characteristic length, and $\eta$ is dynamic viscosity.

```mermaid
graph LR
    A[[[Reynolds Number]] Re] --> B{Re << 1}
    A --> C{Re >> 1000}
    B --> D[Linear Drag - Stokes' Law]
    C --> E[Quadratic Drag - Newton's Law]
    D --> F[Laminar Flow]
    E --> G[Turbulent Flow]
```

### Linear Air Resistance (Stokes' Drag)
For small objects moving slowly (e.g., dust particles, oil droplets), the drag is linear:
$$ \mathbf{F}_d = -b\mathbf{v} $$
The equations of motion become:
$$ m\ddot{x} = -b\dot{x}, \quad m\ddot{y} = -mg - b\dot{y} $$
Introducing $k = b/m$, the analytical solutions are:
*   **Horizontal:** $x(t) = \frac{v_{x0}}{k}(1 - e^{-kt})$
*   **Vertical:** $y(t) = \frac{1}{k}\left(v_{y0} + \frac{g}{k}\right)(1 - e^{-kt}) - \frac{g}{k}t$

**Terminal Velocity ($v_t$):** As $t \to \infty$, the vertical velocity reaches a limit where drag equals gravity:
$$ v_t = \frac{mg}{b} = \frac{g}{k} $$

### Quadratic Air Resistance (Newtonian Drag)
For macroscopic projectiles (bullets, baseballs, artillery), the drag is quadratic:
$$ \mathbf{F}_d = -\frac{1}{2} C_d \rho A v^2 \hat{v} = -\kappa v \mathbf{v} $$
where $C_d$ is the drag coefficient and $A$ is the cross-sectional area. The coupled equations are non-linear:
$$ \ddot{x} = -\frac{\kappa}{m} \sqrt{\dot{x}^2 + \dot{y}^2} \dot{x} $$
$$ \ddot{y} = -g -\frac{\kappa}{m} \sqrt{\dot{x}^2 + \dot{y}^2} \dot{y} $$

These equations lack a simple closed-form solution in elementary functions, but highly accurate analytical approximations exist (e.g., [[Lambert W function]] or expansions in $1/v_t$).

![[projectile-motion-with-air-resistance.svg]]
*Figure 2: Comparison of trajectories. The blue curve (linear drag) and red curve (quadratic drag) show characteristic asymmetry and reduced range compared to the black vacuum parabola.*

#### Simulation: Quadratic Drag vs. Vacuum
```python
---SIMULATION:python:quadratic_drag_sim.py---
import numpy as np
import matplotlib.pyplot as plt

def solve_quadratic_drag(v0, theta, kappa_m, g=9.81, dt=0.01):
    vx, vy = v0 * np.cos(np.radians(theta)), v0 * np.sin(np.radians(theta))
    x, y = [0.0], [0.0]
    while y[-1] >= 0:
        v = np.sqrt(vx**2 + vy**2)
        ax, ay = -kappa_m * v * vx, -g - kappa_m * v * vy
        vx += ax * dt; vy += ay * dt
        x.append(x[-1] + vx * dt); y.append(y[-1] + vy * dt)
    return np.array(x), np.array(y)

v0, angle, k_m = 50, 45, 0.02
x_d, y_d = solve_quadratic_drag(v0, angle, k_m)
t_v = 2*v0*np.sin(np.radians(angle))/9.81
t = np.linspace(0, t_v, 100)
x_v, y_v = v0*np.cos(np.radians(angle))*t, v0*np.sin(np.radians(angle))*t - 0.5*9.81*t**2

plt.figure(figsize=(10, 5))
plt.plot(x_v, y_v, 'k--', label='Vacuum')
plt.plot(x_d, y_d, 'r-', label=f'Quadratic Drag ($\kappa/m={k_m}$)')
plt.title("Ballistic Trajectory with Quadratic Drag"); plt.legend(); plt.grid(True)
plt.xlabel("Range (m)"); plt.ylabel("Height (m)")
plt.savefig('quadratic_drag.png')
```


## Generalized Projectile Scenarios

### Motion on an Inclined Plane
Launching onto a slope inclined at angle $\alpha$:
*   **Optimal Launch Angle**: $\theta_{\text{opt}} = \frac{\pi}{4} + \frac{\alpha}{2}$.
*   **Range along Incline**: $R = \frac{v_0^2}{g \cos^2 \alpha} \left[ \sin(2\theta - \alpha) - \sin \alpha \right]$.

### Projectile Motion with Initial Height Offset ($h$)
The range $R$ for a launch from height $h$ is:
$$ R = \frac{v_0 \cos \theta}{g} \left( v_0 \sin \theta + \sqrt{v_0^2 \sin^2 \theta + 2gh} \right) $$

### The Envelope of Safety (Parabola of Safety)
The boundary of all reachable points for a fixed $v_0$ is itself a parabola:
$$ y = \frac{v_0^2}{2g} - \frac{g}{2 v_0^2} x^2 $$


## Perturbations and Geophysical Effects

For long-range ballistics, further corrections are required:

1.  **Coriolis Effect**: Due to Earth's rotation, projectiles deflect to the right in the Northern Hemisphere and left in the Southern.
    $$ \mathbf{a}_{cor} = -2 (\vec{\Omega} \times \vec{v}) $$
2.  **Variation of Gravity**: $g(y) \approx g_0 (1 - 2y/R_E)$ for high-altitude shots.
3.  **Earth Curvature**: For ranges $R \sim R_E$, the ground "drops" away, eventually leading to orbital mechanics.


## Historical Context

*   **Aristotelian Impetus**: Believed motion required a continuous "force" (impetus) that eventually ran out.
*   **Tartaglia (1537)**: Identified the 45° rule empirically but lacked the math for the parabola.
*   **Galileo (1638)**: Formally proved the parabolic path using the principle of superposition.


## References

- [Discourses and Mathematical Demonstrations Relating to Two New Sciences](https://doi.org/10.1038/050485a0) - Galileo Galilei (1638).
- [[[Classical Mechanics]]](https://books.google.com/books?id=P1S_DQAAQBAJ) - John R. Taylor (2005). Detailed drag derivations.
- [Projectile motion in a medium with quadratic drag at constant horizontal wind](https://doi.org/10.48550/arXiv.2206.02397) - P. S. Chudinov (2022).
- [Approximate Analytical Description of the Projectile Motion with a Quadratic Drag Force](https://www.researchgate.net/publication/281300000_Approximate_Analytical_Description_of_the_Projectile_Motion_with_a_Quadratic_Drag_Force) - Shishkin (2015).
- [Range and flight time of quadratic resisted projectile motion using the Lambert W function](https://doi.org/10.1088/0143-0807/35/5/055025) - S. M. Stewart (2014).
