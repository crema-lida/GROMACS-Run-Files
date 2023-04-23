# GROMACS-Run-Files
An archive of MD simulations using GROMACS.

This repository contains run files for animations uploaded to https://space.bilibili.com/402206352/video

Common Files
---
- `run.sh` is a bash script for conducting the full simulation. It builds the initial configuration and the simulation box, do energy minimization and then run NVT/NPT simulations. You might want to modify `.mdp` files before running this script.
- `xvgplot.ipynb` is a python script for plotting `.edr` files generated during simulation.

Software and Online Services used in simulations
---
**GROMACS** is a free and open-source software suite for high-performance molecular dynamics and output analysis.
> https://www.gromacs.org/

**Packmol** is a free software for creating an initial point for molecular dynamics simulations by packing molecules in defined regions of space.
> https://m3g.github.io/packmol/

**ATB** is a free online service that provides classical molecular force fields for novel compounds. It can automatically generate topology files for small molecules. It also provides a database of existing molecules.
> http://atb.uq.edu.au/index.py

**TPPmktop** is a free online service that automatically generates topology files for OPLS/AA force field.
> http://erg.biophys.msu.ru/erg/tpp/
