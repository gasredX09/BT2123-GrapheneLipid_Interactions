package require psfgen 
mol load psf gph.psf pdb gph.pdb
set sel [as top all] 
$sel moveby [vecinvert [measure center $sel]]
$sel moveby {0 0 30}
$sel writepdb graph.pdb

mol load psf new.psf pdb new.pdb
set sel [as top all]
$sel moveby [vecinvert [measure center $sel]]
$sel moveby {0 0 -30}
$sel writepdb graph_copy.pdb


readpsf  new.psf 
coordpdb graph_copy.pdb 
readpsf  gph.psf 
coordpdb graph.pdb 
readpsf  dopc.psf
coordpdb dopc.pdb  

writepsf grp_dppc.psf
writepdb grp_dppc.pdb

package require solvate
solvate grp_dppc.psf grp_dppc.pdb -minmax "{-31 -31 -50} { 31 31 50}" -o solvate
package require autoionize
autoionize -psf solvate.psf -pdb solvate.pdb -cation POT -o graph_dopc_wi -sc 0.15
mol delete all

mol load psf graph_dopc_wi.psf pdb graph_dopc_wi.pdb
set sel [as top "segname S01 SHT"]
set all [as top all] 
$all set beta 0 
$sel set beta 1
$all writepdb graph_dopc_wi_restrain.pdb
quit
