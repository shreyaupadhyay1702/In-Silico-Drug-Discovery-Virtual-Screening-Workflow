SELECT * FROM dockingresults;
ALTER TABLE dockingresults
RENAME COLUMN `Binding Affinity` TO binding_affinity;
ALTER TABLE dockingresults
RENAME COLUMN `rmsd/ub` TO Rmsd_ub, 
RENAME COLUMN `rmsd/lb` TO Rmsd_lb;
SELECT distinct*
FROM dockingresults
where 
Rmsd_ub = 0 and Rmsd_lb = 0
ORDER BY binding_affinity ASC;