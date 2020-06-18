//Auteur: sylvain arbour
//creation date: 2020-06-16

//intérieur boite

lo=35;   //longueur 
la=18;   //largeur 
ha=18;   //hauteur

mur=3;   // epaisseur des mur
hb=5;    // epaisseur du dessus/dessous

offset = mur; // rayon utiliser pour offset

ou=8;    // ouverture pour manche


precision=0.4; //espace entre le couvercle et la base

texte="Charles";

//receptacle

 difference(){
     union(){
         translate([0,0,0])   base(lo+mur+2*precision,la+mur+2*precision,hb,mur);  
         translate([0,0,hb])  base(lo+mur+2*precision,la+mur+2*precision,ha/2,mur);  
         translate([0,0,hb])  base(lo,la,ha,mur);
      
     }
     union(){
         translate([lo/2,-(la-ou)/2,(ha+hb+hb)/2-(ou/2)+hb/2]) base(1.5*lo,ou,ha+5,0);
         translate([0,0,hb]) base(lo,la,ha+2,0);
     }
}
 
        
      coverX = lo+3*mur+2*precision+5;
      coverY = la+3*mur+2*precision;
      
      difference(){
      union(){
        translate([coverX,0,0]) 
          #base(lo+mur+2*precision,la+mur+2*precision,hb,mur);
        translate([coverX,0,hb]) 
          base(lo+mur+2*precision,la+mur+2*precision,ha/2,mur);
      }
      union(){
        translate([coverX+lo/2,(la-ou)/2,(ha+hb)/2-ou/2])base(1.5*lo,ou,ha+5,0);    
      translate([coverX,0,hb])
        base(lo+2*precision,la+2*precision,ha,mur);
      }
  }
      translate([-lo/2+3,-la/2-mur-precision-1,3])rotate([90,0,0]) linear_extrude(height=2,center=true) text(texte,6,3);
  
      translate([lo/2-3,coverY/2-.5,3])rotate([90,0,180]) linear_extrude(height=2,center=true) text(texte,6,3);

module base(lo,la,ha,mur){
   linear_extrude(height=ha,center=false){ 
       offset(r=mur,$fn=100)
        square([lo,la],center=true);
   }
}