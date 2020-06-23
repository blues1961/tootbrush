use <enclosure.scad>
//////////////////////////////////////
// Auteur: Sylvain Arbour
// Date: 2020-06-17
//////////////////////////////////////

// enclosure de brosse a dent

longueur=35; //longueur interieure
largeur=18;   //largeur interieure
hauteur=18;   //hauteur interieure

epcote=4;    //epaisseur des cotes
ephaut=4;    //epaisseur du dessus
epbas=4;     //epaisseur du dessous

precision=0.3; //espace entre interieur enclosure du haut et exterieur enclosure du bas.  (1 = .5 de chaque cote)
encPct=0.50;  // poucentage de la hauteur de la boite a couvrir par l'enclosure du haut

ou = 8;  // ouverture pour laisser passer le manche de la brosse

enclosureBAD_bas();
translate([longueur+4*epcote+5,0,0])enclosureBAD_haut();

/*
  enclosure haut - ajout ouverture manche brosse & prenom
*/

module enclosureBAD_haut(){
        difference(){
           enclosure_haut(longueur,largeur,hauteur,epcote,epbas,ephaut,precision,encPct);
           translate([longueur/2,(largeur-ou)/2,(hauteur/2+ephaut-ou/2)]) cube(longueur,ou,ou+hauteur,0);
           translate([-longueur/2,0,hauteur/2+ephaut])rotate([0,90,0])cylinder(h = longueur, r=2,$fn=60, center = true);
           translate([0,0,0])rotate([0,0,0])cylinder(h = longueur, r=2,$fn=60, center = true);
           translate([0,0,largeur/2+epcote])rotate([90,0,0])cylinder(h = longueur, r=2,$fn=60, center = true);
        }
          
}

/*
  enclosure bas - ajout ouverture manche brosse & prenom
*/

module enclosureBAD_bas(){
    difference(){
        enclosure_bas(longueur,largeur,hauteur,epcote,epbas,ephaut,precision,encPct);
        translate([longueur/2,-(largeur-ou)/2,epbas+hauteur/2-ou/2])cube(longueur,ou,ou+hauteur,0);
        translate([-longueur/2,0,epbas+hauteur/2])rotate([0,90,0])cylinder(h = longueur, r= 2, $fn=60,center = true);
        translate([0,0,0])rotate([0,0,0])cylinder(h = longueur, r=2,$fn=60, center = true);
        translate([0,0,epbas+hauteur/2])rotate([0,90,90])cylinder(h = 2*largeur, r= 2, $fn=60,center = true);
    }
 }


 
 