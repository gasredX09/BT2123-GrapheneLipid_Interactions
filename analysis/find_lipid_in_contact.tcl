lassign $argv psf dcd
mol load psf $psf dcd $dcd
set numframe [molinfo top get numframes]
package require pbctools
set out [open "lipid_in_contact.dat" w ]
for {set i 0} {$i <$numframe} {incr i} {
    animate goto $i
    set con [ as top "name N and within 3 of resname GRA"]

    set n1 [$con num]
#    set z [$lit get z]
puts $out "[expr (($i+1)*0.0192) ] $n1"
}
close $out
quit
