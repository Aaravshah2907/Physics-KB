---
title: "Trajectory of a Particle Under Gravity"
tags: [physics, classical-mechanics, kinematics, projectile-motion, analytical-mechanics]
date: 2026-02-13
complexity: advanced
---

# Trajectory of a Particle Under Gravity

Summary: This note explores the motion of a particle subject to a uniform gravitational field, analyzing both the ideal vacuum case and the more realistic scenarios involving aerodynamic drag. We derive the equations of motion using Newtonian and Lagrangian formalisms, examine the resulting parabolic and non-parabolic trajectories, and discuss the analytical and numerical solutions for linear and quadratic air resistance.

## 1. Ideal Projectile Motion (Vacuum)

In the absence of air resistance, the only force acting on a particle of mass $m$ is gravity. We assume a uniform gravitational field $\vec{g} = -g \hat{j}$.

### 1.1. Newtonian Formulation

According to [[Classical Mechanics]], Newton's second law states:
$$ m \ddot{\vec{r}} = m \vec{g} $$
Resolving this into Cartesian components (with $x$ horizontal and $y$ vertical):
$$ \ddot{x} = 0 $$
$$ \ddot{y} = -g $$

Integrating these equations with initial conditions $\vec{r}(0) = (0,0)$ and $\vec{v}(0) = (v_0 \cos\theta, v_0 \sin\theta)$:
$$ x(t) = v_0 t \cos\theta $$
$$ y(t) = v_0 t \sin\theta - \frac{1}{2}gt^2 $$

### 1.2. The Trajectory Equation

To find the path $y(x)$, we eliminate $t$ from the equations of motion. From the $x$-equation, $t = \frac{x}{v_0 \cos\theta}$. Substituting this into the $y$-equation:

$$ y(x) = v_0 \left( \frac{x}{v_0 \cos\theta} \right) \sin\theta - \frac{1}{2}g \left( \frac{x}{v_0 \cos\theta} \right)^2 $$

$$ y(x) = x \tan\theta - \frac{g x^2}{2 v_0^2 \cos^2\theta} $$

This is the equation of a downward-opening parabola, characteristic of ideal projectile motion.

![[ideal-projectile-motion-for-different-angles.svg]]

### 1.3. Lagrangian Formalism

We can alternatively derive these results using [[Euler-Lagrange Equations for Unconstrained Systems]]. The kinetic energy $T$ and potential energy $V$ are:
$$ T = \frac{1}{2}m(\dot{x}^2 + \dot{y}^2) $$
$$ V = mgy $$
The Lagrangian $\mathcal{L} = T - V$ is:
$$ \mathcal{L} = \frac{1}{2}m(\dot{x}^2 + \dot{y}^2) - mgy $$

The Euler-Lagrange equations $\frac{d}{dt}\frac{\partial \mathcal{L}}{\partial \dot{q}_i} - \frac{\partial \mathcal{L}}{\partial q_i} = 0$ yield:
*   **For $x$**: $\frac{d}{dt}(m\dot{x}) - 0 = 0 \implies m\ddot{x} = 0$ (Conservation of horizontal momentum $p_x$).
*   **For $y$**: $\frac{d}{dt}(m\dot{y}) - (-mg) = 0 \implies m\ddot{y} = -mg$.

This confirms the Newtonian results and highlights the conservation laws inherent in the system.

## 2. Motion with Linear Air Resistance

For small particles moving at low velocities (low Reynolds number), the drag force is proportional to velocity: $\vec{F}_d = -k\vec{v}$, where $k$ is a constant.

### 2.1. Equations of Motion

The equations of motion become coupled to the mass but decoupled in coordinates:
$$ m\ddot{x} = -k\dot{x} $$
$$ m\ddot{y} = -mg - k\dot{y} $$

### 2.2. Analytical Solution

Defining the characteristic time constant $\tau = m/k$:
$$ \ddot{x} = -\frac{1}{\tau}\dot{x} \implies v_x(t) = v_{0x} e^{-t/\tau} $$
$$ \ddot{y} = -g - \frac{1}{\tau}\dot{y} $$

Integrating $v_x(t)$ gives the horizontal position:
$$ x(t) = v_{0x} \tau (1 - e^{-t/\tau}) $$
Notice that as $t \to \infty$, $x(t) \to x_{\text{max}} = v_{0x}\tau$. The particle has a finite maximum range even if it falls forever!

For the vertical component, the solution approaches a terminal velocity $v_{\text{term}} = -mg/k = -g\tau$. The general solution is:
$$ v_y(t) = (v_{0y} + g\tau)e^{-t/\tau} - g\tau $$
$$ y(t) = (v_{0y}\tau + g\tau^2)(1 - e^{-t/\tau}) - g\tau t $$

## 3. Motion with Quadratic Air Resistance

For most macroscopic projectiles (baseballs, cannonballs), the drag force is proportional to the square of the speed: $\vec{F}_d = -cv v \hat{v}$. This is the standard drag equation.

### 3.1. Coupled Non-Linear Equations

The resistive force opposes the velocity vector $\vec{v}$:
$$ \vec{F}_d = -c v \vec{v} = -c \sqrt{v_x^2 + v_y^2} (v_x \hat{i} + v_y \hat{j}) $$
The equations of motion are:
$$ m\ddot{x} = -c \sqrt{\dot{x}^2 + \dot{y}^2} \dot{x} $$
$$ m\ddot{y} = -mg - c \sqrt{\dot{x}^2 + \dot{y}^2} \dot{y} $$

These equations are **coupled** and **non-linear**. Unlike the linear case, the $x$ and $y$ motions affect each other through the speed term $\sqrt{\dot{x}^2 + \dot{y}^2}$.

### 3.2. Qualitative Features

*   **No Analytic Solution**: generally, there is no closed-form solution for the trajectory $y(x)$. Solutions are obtained via numerical integration or approximation series (e.g., perturbation theory).
*   **Asymmetry**: The trajectory is no longer a parabola. The descent is steeper than the ascent because the horizontal velocity is continuously drained by drag.
*   **Terminal Velocity**: If the particle falls vertically, it reaches a terminal velocity $v_t = \sqrt{mg/c}$.

## 4. Simulation: Vacuum vs. Drag

Since the quadratic drag case requires numerical solution, we provide a simulation script to compare the three regimes.

---SIMULATION:python:projectile_simulation.py---
import numpy as np
import matplotlib.pyplot as plt

def simulate_projectile():
    # Parameters
    g = 9.81
    m = 1.0
    v0 = 50.0
    theta = 45.0 * np.pi / 180.0
    dt = 0.01
    t_max = 10.0
    
    # Initial conditions
    vx0 = v0 * np.cos(theta)
    vy0 = v0 * np.sin(theta)
    
    # 1. Vacuum
    t = np.arange(0, t_max, dt)
    x_vac = vx0 * t
    y_vac = vy0 * t - 0.5 * g * t**2
    y_vac = y_vac[y_vac >= 0] # Clip at ground
    x_vac = x_vac[:len(y_vac)]

    # 2. Linear Drag (F = -kv)
    k = 0.5
    tau = m / k
    t_lin = np.arange(0, t_max, dt)
    x_lin = vx0 * tau * (1 - np.exp(-t_lin/tau))
    y_lin = (vy0 * tau + g * tau**2) * (1 - np.exp(-t_lin/tau)) - g * tau * t_lin
    
    # Clip linear
    valid_lin = y_lin >= 0
    x_lin = x_lin[valid_lin]
    y_lin = y_lin[valid_lin]

    # 3. Quadratic Drag (F = -cv^2) - Euler Method
    c = 0.05
    x_quad = [0]
    y_quad = [0]
    vx = vx0
    vy = vy0
    
    dt_q = 0.001
    while y_quad[-1] >= 0:
        v = np.sqrt(vx**2 + vy**2)
        ax = -(c/m) * v * vx
        ay = -g - (c/m) * v * vy
        
        vx += ax * dt_q
        vy += ay * dt_q
        
        x_new = x_quad[-1] + vx * dt_q
        y_new = y_quad[-1] + vy * dt_q
        
        if y_new < 0: break
        
        x_quad.append(x_new)
        y_quad.append(y_new)

    # Plotting
    plt.figure(figsize=(10, 6))
    plt.plot(x_vac, y_vac, 'k--', label='Vacuum (Ideal)')
    plt.plot(x_lin, y_lin, 'b-', label=f'Linear Drag (k={k})')
    plt.plot(x_quad, y_quad, 'r-', label=f'Quadratic Drag (c={c})')
    
    plt.title('Projectile Motion: Vacuum vs. Air Resistance')
    plt.xlabel('Distance (m)')
    plt.ylabel('Height (m)')
    plt.legend()
    plt.grid(True)
    plt.savefig('projectile_comparison.png')
    print("Simulation complete. Plot saved to projectile_comparison.png")

if __name__ == "__main__":
    simulate_projectile()
---

## References

*   - [Approximate Analytical Description of the Projectile Motion with a Quadratic Drag Force](https://doi.org/10.30958/ajs.1-2-2) - Chudinov, P. (2013)
*   - [Analytic Approximations of Projectile Motion with Quadratic Air Resistance](https://www.scirp.org/journal/paperinformation.aspx?paperid=1930) - Warburton, R., & Wang, J. (2010)
*   - [Projectile Motion with Air Resistance](https://farside.ph.utexas.edu/teaching/336k/lectures/node28.html) - Fitzpatrick, R.
