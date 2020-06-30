use <encBrosseAD.scad>
//////////////////////////////////////
// Auteur: Sylvain Arbour
// Date: 2020-06-17
//////////////////////////////////////

// enclosure de brosse a dent


  translate([0,0,13])rotate([180,0,0]){enclosureBAD_haut(false);
  prenom("Charles");}

  module prenom(Prenom){
     translate([0,0,3]){
    resize([40,0,0])rotate([180,0,0])
       linear_extrude(4, convexity = 10)
          text(Prenom,halign="center",valign="center");
  }}