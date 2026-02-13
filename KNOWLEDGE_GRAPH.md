# Physics Knowledge Base - Visual Concept Map

```mermaid
graph TD
  classical_mechanics([Classical Mechanics])
  electromagnetic_waves([Electromagnetic Waves])
  eulerlagrange_equations_for_constrained_systems([Euler-Lagrange Equations for Constrained Systems])
  eulerlagrange_equations_for_unconstrained_systems([Euler-Lagrange Equations for Unconstrained Systems])
  four_vectors([Four-Vectors])
  gauss_law([Gauss's Law])
  hamiltonian_mechanics([Hamiltonian Mechanics])
  maxwell_s_equations([Maxwell's Equations])
  particle_trajectory_gravity([Trajectory of a Particle in a Uniform Gravitational Field])
  physical_constants([Physical Constants])
  trajectory_under_gravity([Trajectory of a Particle Under Gravity])
  classical_mechanics --> hamiltonian_mechanics
  eulerlagrange_equations_for_constrained_systems --> hamiltonian_mechanics
  gauss_law --> maxwell_s_equations
  gauss_law --> physical_constants
  hamiltonian_mechanics --> eulerlagrange_equations_for_constrained_systems
  hamiltonian_mechanics --> physical_constants
  physical_constants --> electromagnetic_waves
  physical_constants --> eulerlagrange_equations_for_unconstrained_systems
  physical_constants --> hamiltonian_mechanics
  physical_constants --> maxwell_s_equations
```
