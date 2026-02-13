---
title: "Electromagnetic Waves"
tags: [physics, electromagnetism, waves, optics]
date: 2026-02-12
complexity: intermediate
---

# Summary

Electromagnetic (EM) waves are synchronized oscillations of electric and magnetic fields that propagate at the speed of light through a vacuum. They are a direct consequence of [[maxwell's-equations]], which predict that a time-varying electric field generates a magnetic field and vice versa. These waves carry energy, momentum, and angular momentum away from their source particle and can have no mass. The study of EM waves forms the basis of optics, telecommunications, and radiative transfer.

![Electromagnetic Wave Propagation](https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Electromagneticwave3D.png/640px-Electromagneticwave3D.png)

# Derivation from [[Maxwell's Equations]]

To understand the origin of electromagnetic waves, we consider **Maxwell's equations** in a vacuum (source-free region), where charge density $\rho = 0$ and current density $\mathbf{J} = 0$.

## Vacuum Equations
Using the standard formulation in [[maxwell's-equations]]:

1.  **[[Gauss's Law]]**: $\nabla \cdot \mathbf{E} = 0$
2.  **[[Gauss's Law]] for Magnetism**: $\nabla \cdot \mathbf{B} = 0$
3.  **Faraday's Law**: $\nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t}$
4.  **Ampère-Maxwell Law**: $\nabla \times \mathbf{B} = \mu_0 \epsilon_0 \frac{\partial \mathbf{E}}{\partial t}$

Here, $\epsilon_0$ is the vacuum permittivity and $\mu_0$ is the vacuum permeability (see [[physical-constants]]).

## The Wave Equation
We take the curl of Faraday's Law (equation 3):
$$
\nabla \times (\nabla \times \mathbf{E}) = -\frac{\partial}{\partial t} (\nabla \times \mathbf{B})
$$

Using the vector identity $\nabla \times (\nabla \times \mathbf{A}) = \nabla(\nabla \cdot \mathbf{A}) - \nabla^2 \mathbf{A}$, and substituting [[Gauss's Law]] ($\nabla \cdot \mathbf{E} = 0$):
$$
-\nabla^2 \mathbf{E} = -\frac{\partial}{\partial t} \left( \mu_0 \epsilon_0 \frac{\partial \mathbf{E}}{\partial t} \right)
$$

Rearranging terms yields the standard 3D wave equation for the electric field:
$$
\nabla^2 \mathbf{E} - \mu_0 \epsilon_0 \frac{\partial^2 \mathbf{E}}{\partial t^2} = 0
$$

A similar derivation applies to the magnetic field $\mathbf{B}$:
$$
\nabla^2 \mathbf{B} - \mu_0 \epsilon_0 \frac{\partial^2 \mathbf{B}}{\partial t^2} = 0
$$

## Speed of Light
Comparing this to the general wave equation $\nabla^2 \psi - \frac{1}{v^2} \frac{\partial^2 \psi}{\partial t^2} = 0$, we identify the speed of propagation $v$ as:
$$
c = \frac{1}{\sqrt{\mu_0 \epsilon_0}}
$$
Substituting numerical values for $\mu_0$ and $\epsilon_0$:
$$
c \approx 2.998 \times 10^8 \text{ m/s}
$$
This theoretically predicted speed matched the experimental speed of light, leading Maxwell to conclude that light itself is an electromagnetic wave.

# Monochromatic Plane Waves

The simplest solution to the wave equation is the **monochromatic plane wave**, where the fields are uniform over any plane perpendicular to the direction of propagation.

## Mathematical Representation
For a wave propagating in the direction of the wave vector $\mathbf{k}$:
$$
\tilde{\mathbf{E}}(\mathbf{r}, t) = \tilde{\mathbf{E}}_0 e^{i(\mathbf{k} \cdot \mathbf{r} - \omega t)}
$$
$$
\tilde{\mathbf{B}}(\mathbf{r}, t) = \tilde{\mathbf{B}}_0 e^{i(\mathbf{k} \cdot \mathbf{r} - \omega t)}
$$
Where:
*   $\tilde{\mathbf{E}}_0, \tilde{\mathbf{B}}_0$ are complex amplitudes (encoding phase and polarization).
*   $\omega$ is the angular frequency.
*   $k = |\mathbf{k}| = \omega/c$ is the wave number.

The physical fields are the real parts of these complex expressions: $\mathbf{E} = \text{Re}(\tilde{\mathbf{E}})$.

## Transverse Nature
Applying [[Gauss's Law]] $\nabla \cdot \mathbf{E} = 0$ to the plane wave solution implies:
$$
\mathbf{k} \cdot \tilde{\mathbf{E}} = 0 \quad \text{and} \quad \mathbf{k} \cdot \tilde{\mathbf{B}} = 0
$$
This means electromagnetic waves are **transverse**: the electric and magnetic fields oscillate perpendicular to the direction of propagation.

## Orthogonality of Fields
Using Faraday's Law $\nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t}$:
$$
i \mathbf{k} \times \tilde{\mathbf{E}} = i \omega \tilde{\mathbf{B}}
$$
$$
\tilde{\mathbf{B}} = \frac{1}{c} \hat{\mathbf{k}} \times \tilde{\mathbf{E}}
$$
Key Implications:
1.  **Orthogonality**: $\mathbf{E}$ and $\mathbf{B}$ are perpendicular to each other ($\mathbf{E} \perp \mathbf{B}$).
2.  **Phase**: $\mathbf{E}$ and $\mathbf{B}$ are in phase.
3.  **Magnitude**: The field amplitudes are related by $E_0 = c B_0$.

The triad $(\mathbf{E}, \mathbf{B}, \mathbf{k})$ forms a right-handed orthogonal system.

# Energy and Momentum

Electromagnetic waves carry energy and momentum, facilitating the transfer of interaction between charges.

## Energy Density
The energy density $u$ (Joules/m$^3$) stored in the EM fields is the sum of electric and magnetic contributions:
$$
u = \frac{1}{2} \left( \epsilon_0 E^2 + \frac{1}{\mu_0} B^2 \right)
$$
For a monochromatic plane wave in vacuum, since $B = E/c$ and $c = 1/\sqrt{\mu_0 \epsilon_0}$, the electric and magnetic contributions are equal:
$$
u_E = u_B = \frac{1}{2} \epsilon_0 E^2
$$
$$
u_{total} = \epsilon_0 E^2
$$

## Poynting Vector
The rate of energy transport per unit area is described by the **Poynting vector** $\mathbf{S}$:
$$
\mathbf{S} = \frac{1}{\mu_0} \mathbf{E} \times \mathbf{B}
$$
*   **Direction**: $\mathbf{S}$ points in the direction of wave propagation ($\hat{\mathbf{k}}$).
*   **Magnitude**: $S = c u$. This represents the instantaneous power per unit area.

## Intensity
The **intensity** $I$ is the time-averaged magnitude of the Poynting vector, $\langle S \rangle$. For sinusoidal fields, the average of $\cos^2(\omega t)$ is $1/2$:
$$
I = \langle S \rangle = \frac{1}{2} c \epsilon_0 E_0^2
$$

## Momentum and Radiation Pressure
EM waves carry linear momentum density $\mathbf{g}$:
$$
\mathbf{g} = \frac{1}{c^2} \mathbf{S} = \epsilon_0 (\mathbf{E} \times \mathbf{B})
$$
When these waves strike a surface, they transfer momentum, exerting **radiation pressure** $P$.
*   **Perfect Absorber**: $P = \frac{I}{c}$
*   **Perfect Reflector**: $P = \frac{2I}{c}$ (due to momentum reversal)

# Polarization

Polarization describes the orientation of the electric field oscillations.

1.  **Linear Polarization**: $\mathbf{E}$ oscillates along a fixed line perpendicular to $\mathbf{k}$.
2.  **Circular Polarization**: The $\mathbf{E}$ vector rotates around $\mathbf{k}$ with constant magnitude. This occurs when two orthogonal linear components have a phase difference of $\pi/2$.
3.  **Elliptical Polarization**: The general case where the tip of the $\mathbf{E}$ vector traces an ellipse.

Polarization is crucial in the study of optics and is deeply connected to the spin angular momentum of photons (see [[four-vectors]] for relativistic treatments).

# References
*   Griffiths, D. J. *Introduction to Electrodynamics*.
*   Jackson, J. D. *Classical Electrodynamics*.
*   Feynman, R. P. *The Feynman Lectures on Physics, Vol. II*.
