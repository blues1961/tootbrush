/*
Auteur:    Sylvain Arbour
Creation:  2020-06-17
*/

module enclosure_haut(longueur,largeur,hauteur,epcote,epbas,ephaut,precision,encPct){
    lo = longueur+2*epcote+precision;
    la = largeur+2*epcote+precision;
    ha = (hauteur+epbas+ephaut)*encPct;
    offset=epcote;
    
    difference(){
       cube(lo,la,ha,offset);
       translate([0,0,epbas]) cube(lo-offset,la-offset,ha,offset);
    }
}

//////////////////////////////////////////////////////////////////
// bas de l'enclosure
//////////////////////////////////////////////////////////////////
module enclosure_bas(longueur,largeur,hauteur,epcote,epbas,ephaut,precision,encPct){
    lo = longueur;
    la = largeur;
    ha = (hauteur+epbas);
    offset=epcote;
    
    difference(){
      union(){
        cube(lo,la,ha,offset);
        cube(lo,la,ha,0);
        cube(lo+precision,la+precision,hauteur*(1-encPct)+epbas,offset);
      }
      translate([0,0,epbas])cube(lo,la,ha,0);
    }
}

///////////////////////////////////////////
// cube builder
///////////////////////////////////////////
module cube(lo,la,ha,offset){
   linear_extrude(height=ha,center=false){ 
       offset(r=offset,$fn=50)
       square([lo,la],center=true);
   }
}