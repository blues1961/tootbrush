use <enclosure.scad>
//////////////////////////////////////
// Auteur: Sylvain Arbour
// Date: 2020-06-17
//////////////////////////////////////

// enclosure de brosse a dent

longueur=35; //longueur interieure
largeur=18;   //largeur interieure
hauteur=18;   //hauteur interieure

epcote=3;    //epaisseur des cotes
ephaut=3;    //epaisseur du dessus
epbas=3;     //epaisseur du dessous

precision=1; //espace entre interieur enclosure du haut et exterieur enclosure du bas.  (1 = .5 de chaque cote)
encPct=0.50;  // poucentage de la hauteur de la boite a couvrir par l'enclosure du haut

ou = 8;  // ouverture pour laisser passer le manche de la brosse

prenom="Tootbrush";



/*
  enclosure haut - ajout ouverture manche brosse & prenom
*/
translate([2*longueur+5,0,0])
    difference(){
        difference(){
            enclosure_haut(longueur,largeur,hauteur,epcote,epbas,ephaut,precision,encPct);
            translate([0.5*longueur,(largeur-ou)/2,hauteur/2-ou/2]) cube(longueur,ou,ou+hauteur,0);
        }
        translate([-longueur/2-2,+4,1])rotate([180,0,0])linear_extrude(3,center=true) text(prenom,7);
    }

/*
  enclosure bas - ajout ouverture manche brosse & prenom
*/
translate([21,0,0])
    difference(){
        difference(){
            enclosure_bas(longueur,largeur,hauteur,epcote,epbas,ephaut,precision,encPct);
            translate([0.5*longueur,-(largeur-ou)/2,(hauteur-ou)/2+epbas]) cube(longueur,ou,ou+hauteur,0);
        }
    translate([-longueur/2-2,4,1])rotate([180,0,0])linear_extrude(3,center=true) text(prenom,7);
}

