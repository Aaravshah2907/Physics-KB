---
title: "Physical Constants"
tags: [physics, metrology, fundamental-physics]
date: 2026-02-12
complexity: basic
---

# Summary
Physical constants are scalar quantities believed to be universal in nature and unchanging over time. They act as the fundamental parameters of the mathematical frameworks describing physical reality, from **Classical Mechanics** to **Quantum Field Theory**. These constants define the scales of length, mass, time, and energy in the universe.

This note categorizes fundamental constants, provides their 2019 SI redefinition values, and explores their role in theoretical frameworks like [[Maxwell's Equations]] and [[Hamiltonian Mechanics]].

![SI Base Units](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/SI_base_unit.svg/600px-SI_base_unit.svg.png)

# Classification of Constants

Physical constants can be broadly categorized based on their dimension and their role in physical theories.

## 1. Universal Dimensionful Constants
These constants define the conversion factors between different physical dimensions (e.g., time to space, energy to temperature).

### Speed of Light in Vacuum ($c$)
The speed of light is the maximum speed at which all massless particles and associated fields (including [[electromagnetic-waves]] and gravitational waves) travel in a vacuum. It acts as the conversion factor between space and time in Special Relativity.

$$ c = 299,792,458 \, \text{m}\cdot\text{s}^{-1} \quad (\text{exact}) $$

In the context of [[four-vectors]], $c$ allows us to treat time ($t$) and space ($x, y, z$) on equal footing, forming the spacetime coordinate vector $x^\mu = (ct, x, y, z)$. It also connects mass and energy via the rest-energy relation $E_0 = mc^2$.

### Planck Constant ($h$) and Reduced Planck Constant ($\hbar$)
The Planck constant sets the scale of quantum effects. It relates the energy of a photon to its frequency ($E = h\nu$).

$$ h = 6.62607015 \times 10^{-34} \, \text{J}\cdot\text{s} \quad (\text{exact}) $$

The reduced Planck constant, $\hbar = \frac{h}{2\pi}$, is often more convenient in theoretical physics, particularly in [[Hamiltonian Mechanics]] where it appears in the commutation relations of position and momentum operators: $[ \hat{x}, \hat{p} ] = i\hbar$. It represents the fundamental quantum of **action**.

### Gravitational Constant ($G$)
The gravitational constant determines the strength of the gravitational interaction between masses.

$$ G \approx 6.674 \times 10^{-11} \, \text{m}^3\cdot\text{kg}^{-1}\cdot\text{s}^{-2} $$

Unlike $c$ and $h$, $G$ is known with significantly less precision due to the weakness of gravity relative to other fundamental forces.

## 2. Electromagnetic Constants
These constants govern the behavior of electric and magnetic fields and appear explicitly in [[Maxwell's Equations]].

### Vacuum Permittivity ($\varepsilon_0$)
Also known as the electric constant, $\varepsilon_0$ represents the capability of a vacuum to permit electric field lines. It is central to [[Gauss Law]], which states that the electric flux through a closed surface is proportional to the enclosed charge:

$$ \oint_{\partial V} \mathbf{E} \cdot d\mathbf{A} = \frac{Q_{\text{enc}}}{\varepsilon_0} $$

Value (derived from $\mu_0$ and $c$ in the pre-2019 system, now measured):
$$ \varepsilon_0 \approx 8.854 \times 10^{-12} \, \text{F}\cdot\text{m}^{-1} $$

### Vacuum Permeability ($\mu_0$)
The magnetic constant, $\mu_0$, determines the magnetic field produced by an electric current. It is related to $\varepsilon_0$ and $c$ by the wave equation derived from [[Maxwell's Equations]]:

$$ c = \frac{1}{\sqrt{\varepsilon_0 \mu_0}} $$

### Elementary Charge ($e$)
The magnitude of the electric charge carried by a single proton or electron.
$$ e = 1.602176634 \times 10^{-19} \, \text{C} \quad (\text{exact}) $$

## 3. Thermodynamic and Physico-Chemical Constants

### Boltzmann Constant ($k_B$)
The Boltzmann constant relates temperature to energy. It is the bridge between macroscopic statistical mechanics and microscopic thermal physics.
$$ k_B = 1.380649 \times 10^{-23} \, \text{J}\cdot\text{K}^{-1} \quad (\text{exact}) $$

### Avogadro Constant ($N_A$)
The number of constituent particles (atoms, molecules) per mole.
$$ N_A = 6.02214076 \times 10^{23} \, \text{mol}^{-1} \quad (\text{exact}) $$

# Dimensionless Constants

Dimensionless constants are pure numbers, independent of the system of units used. They are often considered more fundamental than dimensionful constants because their values represent intrinsic ratios in nature.

## Fine-Structure Constant ($\alpha$)
The fine-structure constant characterizes the strength of the electromagnetic interaction between elementary charged particles.

$$ \alpha = \frac{e^2}{4\pi\varepsilon_0 \hbar c} \approx \frac{1}{137.035999} $$

Because $\alpha$ combines $e$, $\hbar$, $c$, and $\varepsilon_0$, it links Quantum Mechanics, Relativity, and Electromagnetism.

# The 2019 SI Redefinition

Effective May 20, 2019, the SI system was redefined such that seven physical constants are fixed to exact numerical values.

| Constant | Symbol | Exact Value | Unit | Defines |
| :--- | :---: | :--- | :--- | :--- |
| Hyperfine transition freq. of Cs-133 | $\Delta \nu_{Cs}$ | $9,192,631,770$ | Hz | Second (s) |
| Speed of light | $c$ | $299,792,458$ | m/s | Meter (m) |
| Planck constant | $h$ | $6.62607015 \times 10^{-34}$ | J s | Kilogram (kg) |
| Elementary charge | $e$ | $1.602176634 \times 10^{-19}$ | C | Ampere (A) |
| Boltzmann constant | $k_B$ | $1.380649 \times 10^{-23}$ | J/K | Kelvin (K) |
| Avogadro constant | $N_A$ | $6.02214076 \times 10^{23}$ | mol$^{-1}$ | Mole (mol) |
| Luminous efficacy | $K_{cd}$ | $683$ | lm/W | Candela (cd) |

This shift eliminates the reliance on physical artifacts (like the International Prototype of the Kilogram) and ties measurement standards directly to the fundamental properties of the universe.

# Natural Units (Planck Units)
In theoretical physics, specifically in high-energy physics and cosmology, it is common to nondimensionalize equations by setting fundamental constants to 1. In **Planck Units**, we set:
$$ c = \hbar = G = k_B = k_e = 1 $$
This simplifies equations significantly. For example, the Einstein field equations of General Relativity become $G_{\mu\nu} = 8\pi T_{\mu\nu}$.

# Further Reading
*   [[Maxwell's Equations]] - For the interplay of $c, \mu_0, \varepsilon_0$.
*   [[Electromagnetic Waves]] - Derivation of light speed from vacuum constants.
*   [[Hamiltonian Mechanics]] - Context for $\hbar$ and phase space.
*   [[Euler-Lagrange Equations for Unconstrained Systems]] - Foundational classical mechanics often preceding constant integration.
