#!/bin/bash
dl="0.01"
dC="1/10^12"
dL="1/10^6"
dr="0.01"
echo -n "l= "
read l
echo -n "C= "
read C
echo -n "L= "
read L
echo -n "r= "
read r
echo 
Cp=$(echo "scale=30;$C/$l" | bc)
dCp=$(echo "scale=30;sqrt(($dC/$l)^2+($C*$dl/$l^2)^2)" | bc)
Lp=$(echo "scale=30;$L/$l" | bc)
dLp=$(echo "scale=30;sqrt(($dL/$l)^2+($L*$dl/$l^2)^2)" | bc)
rp=$(echo "scale=30;$r/$l" | bc)
drp=$(echo "scale=30;sqrt(($dr/$l)^2+($r*$dl/$l^2)^2)" | bc)
p=$(echo "scale=30;sqrt($Lp/$Cp)" | bc)
dp=$(echo "scale=30;sqrt(($dLp^2/($Cp*$Lp*4))+$Lp*($dCp^2/4*$dCp^3))" | bc)
v=$(echo "scale=30;1/sqrt($Lp*$Cp)/10^7" | bc | xargs printf "%1.2f")
dv=$(echo "scale=30;sqrt(1/(4*$Lp*$Cp)*(($dLp/$Lp)^2+($dCp/$Cp)^2))/10^7" | bc |  xargs printf "%1.2f")
b=$(echo "scale=30;-4.35*$rp/$l/$p" | bc |  xargs printf "%1.4f")
db=$(echo "scale=30;4.35/$l/$p*sqrt($drp^2+($dl/$l)^2+($dp/$p)^2)" | bc)
echo
echo "Cп  = `units $Cp | sed 's/Definition://g'`"
echo "dCп = `units $dCp | sed 's/Definition://g'`"
echo "Lп  = `units $Lp | sed 's/Definition://g'`"
echo "dLп = `units $dLp | sed 's/Definition://g'`"
echo "rп  = `units $rp | sed 's/Definition://g'`"
echo "drп = `units $drp | sed 's/Definition://g'`"
echo "p   = `units $p | sed 's/Definition://g'`"
echo "dp  = `units $dp | sed 's/Definition://g'`"
echo "v   =    $v"E+7
echo "dv  =    $dv"E+7
echo "b   =   $b" 
echo "db  = `units $db | sed 's/Definition://g'`"


