/*
Auteur:    Sylvain Arbour
Creation:  2020-06-17
*/
/////////////////////////////////////////////////
//  haut de l'enclosure
/////////////////////////////////////////////////

module enclosure_haut(longueur,largeur,hauteur,epcote,epbas,ephaut,precision,encPct){
    lo = longueur+2*epcote+precision;
    la = largeur+2*epcote+precision;
    ha = (hauteur+epbas+ephaut)*encPct;
    offset=epcote;
    
    difference(){
       cube(lo,la,ha,offset);
       translate([0,0,epbas]) cube(lo-offset,la-offset,ha);
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
        cube(lo,la,hauteur*(1-encPct)+epbas,2*offset+precision/2);
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