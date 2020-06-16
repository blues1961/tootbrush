
//intérieur boite

lo=35;  //longueur
la=18;  //largeur
ha=18;  //hauteur
mur=3;   // /epaisseur des mur
hb=5;   //hauteur base
ou=8; // ouverture pour manche
precision=0.25; //espace entre le couvercle et la base

//receptacle

       difference(){
       union(){
       translate([0,0,0])base(lo+mur+2*precision,la+mur+2*precision,hb,mur);  
       translate([0,0,hb])base(lo+mur+2*precision,la+mur+2*precision,ha/2,mur);  
       translate([0,0,hb]) base(lo,la,ha,mur);
      
       }
       union(){
       translate([lo/2,-(la-ou)/2,(ha+hb)/2-ou/2])base(1.5*lo,ou,ha+5,0);
       translate([0,0,hb]) base(lo,la,ha+2,0);
        }
      }
    // text("Étienne",6);
//cover
        
      coverX = lo+2*mur+2*precision+5;
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
      translate([-14,0,hb]) text("Étienne",6,3);

module base(lo,la,ha,mur){
   linear_extrude(height=ha,center=false){ 
       offset(r=mur,$fn=100)
        square([lo,la],center=true);
   }
}