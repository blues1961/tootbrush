/*
Auteur:    Sylvain Arbour
Creation:  2020-06-17
*/

/*
use <enclosure.scad>

longueur=35; //longueur interieure
largeur=18;   //largeur interieure
hauteur=18;   //hauteur interieure

epcote=3;    //epaisseur des cotes
ephaut=3;    //epaisseur du dessus
epbas=3;     //epaisseur du dessous

precision=1; //espace entre interieur enclosure du haut et exterieur enclosure du bas.  (1 = .5 de chaque cote)

encPct=0.50;  // poucentage de la hauteur de la boite a couvrir par l'enclosure du haut



translate([0,0,12+9+epbas]) rotate([180,-90,0])enclosure_haut(longueur,largeur,hauteur,epcote,epbas,ephaut,precision,encPct);
enclosure_bas(longueur,largeur,hauteur,epcote,epbas,ephaut,precision,encPct);
*/

module enclosure_haut(longueur,largeur,hauteur,epcote,epbas,ephaut,precision,encPct){
    lo = longueur+epcote+precision;
    la = largeur+epcote+precision;
    ha = (hauteur+epbas+ephaut)*encPct;
    offset=epcote;
    difference(){   
    cube(lo,la,ha,offset);
    translate([0,0,ephaut])cube(lo-offset,la-offset,ha,offset);
    }
}

//////////////////////////////////////////////////////////////////
// bas de l'enclosure
//////////////////////////////////////////////////////////////////
module enclosure_bas(longueur,largeur,hauteur,epcote,epbas,ephaut,precision,encPct){
    difference(){
      union(){
      cube(longueur,largeur,hauteur+epbas,epcote);
      cube(longueur+epcote+precision,largeur+epcote+precision,hauteur*(1-encPct)+epbas,epcote);
      }
      translate([0,0,epbas])cube(longueur,largeur,hauteur+2,0);
    }
   //   }
      
    //}
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
