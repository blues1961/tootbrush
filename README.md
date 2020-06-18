# enclosure pour brosse à dents avec OpenSCAD

#paramètres généraux de l'enclosure

mesure de l'intérieur la boite

longueur=35;     //longueur
largeur=18;      //largeur
hauteur=18;      //hauteur

epcote=3;        // épaisseur des cotes
ephaut=3;        //épaisseur dessus enclosure 
epbas=3;         // épaisseur dessous enclosure 

precision=1      //espace entre l'intérieur de l'enclosure du haut et l'extérieur de l'enclosure du bas

#paramètres spécifiques pour l'enclosure de la brosse à dents

ouverture=8;     // ouverture pour le manche de la brosse
texte="Étienne"  // personnalisation de l'enclosure de la brosse a dent


Le module enclosure.scad doit être déplacé dans la  librairie d'OpenSCAD.

Sous Linux: ~/.local/share/OpenSCAD/libraries
