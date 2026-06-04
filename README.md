# VEGFR2 In-Silico Drug Discovery & Virtual Screening Pipeline

## Project Overview

This project demonstrates a complete **Computer-Aided Drug Discovery (CADD)** workflow for identifying potential phytochemical inhibitors against **Vascular Endothelial Growth Factor Receptor 2 (VEGFR2)**, a key regulator of tumor angiogenesis and cancer progression.

The workflow integrates **bioinformatics, molecular docking, SQL-based data filtering, ADME analysis, and business intelligence visualization** to systematically identify promising lead compounds from a literature-curated phytochemical library.

---

## Research Objective

To screen and prioritize phytochemicals with potential anti-cancer activity against **VEGFR2 (PDB ID: 6XVK)** using a computational drug discovery pipeline combining:

* Drug-likeness screening
* Molecular docking
* Pharmacokinetic profiling
* Data analytics and visualization

---

## Tools & Technologies

### Bioinformatics & Drug Discovery

* RCSB Protein Data Bank
* PyRx (AutoDock Vina)
* AutoDock Tools
* PyMOL
* BIOVIA Discovery Studio
* SwissADME

### Data Analytics

* SQLite
* SQL Workbench
* Microsoft Excel
* Power BI

---

## Workflow

### 1. Target Protein Preparation

* Retrieved the crystal structure of **VEGFR2 (PDB ID: 6XVK)** from RCSB PDB.
* Removed water molecules and unwanted heteroatoms.
* Added polar hydrogens and Kollman charges.
* Prepared receptor structure for docking using AutoDock Tools.

### 2. Phytochemical Dataset Collection

* Curated a library of **23 literature-reported anti-cancer phytochemicals**.
* Collected molecular descriptors required for drug-likeness screening.

---

### 3. Drug-Likeness Screening using SQL

A SQLite database was created containing molecular descriptors of all phytochemicals.

Compounds were filtered according to **Lipinski's Rule of Five**:

* Molecular Weight ≤ 500
* LogP ≤ 5
* Hydrogen Bond Donors ≤ 5
* Hydrogen Bond Acceptors ≤ 10

#### SQL Query

```sql
SELECT *
FROM phytochemicals
WHERE molecular_weight <= 500
AND logp <= 5
AND hbond_donors <= 5
AND hbond_acceptors <= 10;
```

### Result

* Initial compounds: 23
* Drug-like compounds retained: 13

---

### 4. Molecular Docking

The 13 screened phytochemicals were docked against VEGFR2 using **PyRx (AutoDock Vina)**.

For each ligand:

* Multiple binding conformations (8–9 poses) were generated.
* Binding affinities and RMSD values were recorded.
* Best docking pose was selected for further analysis.

---

### 5. Post-Docking Data Mining using SQL

Docking results were exported into SQL Workbench for systematic analysis.

The best docking model for each ligand was extracted based on:

* Lowest binding affinity (kcal/mol)
* RMSD Lower Bound = 0
* RMSD Upper Bound = 0

#### SQL Query

```sql
SELECT DISTINCT *
FROM dockingresults
WHERE Rmsd_lb = 0
AND Rmsd_ub = 0
ORDER BY binding_affinity ASC;
```

### Outcome

* Ranked all docked compounds by binding affinity.
* Selected top-performing lead candidates for ADME evaluation.

---

### 6. ADME & Pharmacokinetic Analysis

Top lead compounds were analyzed using SwissADME to evaluate:

* Gastrointestinal absorption
* Blood-Brain Barrier permeability
* Drug-likeness
* Bioavailability
* Safety-related properties

---

### 7. Data Analytics & Visualization

#### Power BI Dashboard

An interactive dashboard was developed to:

* Compare docking scores
* Rank candidate compounds
* Visualize ADME properties
* Support lead optimization decisions

#### Structural Visualization

* 3D protein-ligand complexes visualized using PyMOL.
* 2D interaction networks generated using Discovery Studio.

---

## Key Skills Demonstrated

### Computational Biology

* Structure-based drug discovery
* Molecular docking
* Protein-ligand interaction analysis
* ADME profiling

### Data Analytics

* SQL querying
* Data filtering and extraction
* Data cleaning
* Dashboard development
* Scientific data visualization

### Tools

* SQL
* Power BI
* Excel
* PyMOL
* PyRx
* Discovery Studio

---

## Repository Structure

| File                         | Description                             |
| ---------------------------- | --------------------------------------- |
| README.md                    | Complete project documentation          |
| 6XVK_protein.pdb             | Prepared VEGFR2 protein structure       |
| raw_phytochemical.csv        | Initial phytochemical dataset           |
| SQL_FILTERED_RESULTS.csv     | Lipinski-filtered compounds             |
| FILTERED_LIGANDS_13.csv      | Final screened ligand list              |
| SQL_QUERIES.sql              | SQL scripts used in analysis            |
| docking_results.csv          | Molecular docking results               |
| swissadme_results.csv        | ADME profiling results                  |
| PowerBI_Dashboard.pbix       | Interactive docking analytics dashboard |
| Dashboard_Screenshot.png     | Dashboard preview                       |
| Luteolin_2D_Interactions.png | Discovery Studio interaction map        |
| Luteolin_3D_PyMOL.png        | PyMOL binding pocket visualization      |

---

## Project Outcome

This project successfully integrated **computational drug discovery** and **data analytics techniques** to identify promising phytochemical leads targeting VEGFR2. The workflow demonstrates how SQL, Power BI, and molecular docking tools can be combined to support early-stage drug discovery and lead prioritization.

---

## Author

**Shreya Upadhyay**

Aspiring Bioinformatics & Healthcare Data Analyst

Skills: Python | SQL | Power BI | Excel | Molecular Docking | Bioinformatics | Data Visualization
