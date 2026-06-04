# In-Silico-Drug-Discovery-Virtual-Screening-Workflow
CADD pipeline targeting VEGFR2 (6XVK). Integrates SQL filtering (Lipinski's Rule), PyRx/AutoDock Vina molecular docking, ADME profiling, and interactive Power BI analytics

---

## 📌 Project Overview
Vascular Endothelial Growth Factor Receptor 2 (VEGFR2) is a primary regulator of angiogenesis, making it a crucial target in cancer therapy. This project filters a library of 23 literature-mined phytochemicals down to the top 5 lead candidates using a hybrid workflow of computational biology tools and SQL-based data analytics.

---

## 🛠️ Tech Stack & Tools
* **Target & Ligand Preparation:** RCSB PDB, Biovia Discovery Studio, AutoDock Tools, PyMOL
* **Virtual Screening & Data Filtering:** SQLite (SQL), PyRx (AutoDock Vina)
* **Pharmacokinetics:** ADME/Tox Prediction Servers
* **Data Visualization & Analytics:** Power BI, Discovery Studio (2D plots), PyMOL (3D rendering)

---

## 🚀 Workflow Architecture

### 1. Target & Ligand Preparation
* **Target Protein:** Downloaded the 3D structure of **VEGFR2 (PDB ID: 6XVK)** from RCSB PDB. Cleaned the structure by removing water molecules, heteroatoms, and adding polar hydrogens/Kollman charges using Biovia Discovery Studio and AutoDock Tools.
* **Initial Ligand Library:** Sourced 23 cancer-associated phytochemicals from literature in `.sdf` format.

### 2. Virtual Screening via SQL (Lipinski's Rule of 5)
* Imported the molecular descriptors of all 25 phytochemicals into a **SQLite** database.
* Executed SQLite to filter compounds based on Lipinski's criteria (Molecular Weight ≤ 500, LogP ≤ 5, H-bond Donors ≤ 5, H-bond Acceptors ≤ 10).
* **Result:** Successfully screened the dataset down to **13 drug-like phytochemicals**, which were then converted to `.pdb` format and prepared using PyMOL.

### 3. Molecular Docking
* Conducted high-throughput virtual screening of the 13 filtered ligands against the prepared VEGFR2 protein using **PyRx (AutoDock Vina)**.
* Generated 8–9 binding conformation models (poses) for each phytochemical.

### 4. Post-Docking Data Mining via SQL Workbench
* Exported the raw docking log files containing all generated models, binding affinities, and RMSD values for the 13 ligands into **SQL Workbench**.
* Utilized precise SQL queries to parse the data and extract the **single best-performing model (Pose 1) for all 13 ligands** by filtering for the lowest binding energy (kcal/mol) where **RMSD Upper Bound & Lower Bound = 0**.
* **SQL Query Used:**
* ```sql
SELECT DISTINCT *
FROM dockingresults
WHERE Rmsd_ub = 0 AND Rmsd_lb = 0
ORDER BY binding_affinity ASC;

### 5. ADME & Toxicity Profiling
* Submitted the top 5 lead candidates to pharmacokinetics prediction servers to evaluate gastrointestinal absorption, blood-brain barrier (BBB) permeability, drug-likeness, and safety profiles.

### 6. Interactive Analytics & Visualization
* **Power BI Dashboard:** Engineered an interactive dashboard to comprehensively visualize, compare, and cross-reference docking scores and ADME traits across the compounds.
* **Structural Visualization:** Rendered the final lead candidates' 3D binding pockets using PyMOL and mapped their 2D ligand-protein interaction networks using Biovia Discovery Studio.

---

## 📂 Repository Structure
├── data/
│   ├── raw_phytochemicals.csv       # Original list of 25 compounds & descriptors
│   └── filtered_ligands.csv          #list of the filtered top 13 ligands
├── docking/
│   ├── docking_results/                # Raw docking log files
│   └── docking_analysis.sql         # SQL queries used to extract best poses (RMSD=0) for the 13 ligands
├── adme/
│   └── swissadme_results.csv             # Pharmacokinetics data for the selected top 5 compounds
├── dashboard/
│   └── VEGFR2_Docking_Analytics.pbix # Interactive Power BI Dashboard file
└── README.md
