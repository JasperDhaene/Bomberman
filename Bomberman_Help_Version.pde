/*Commentaar voor hulp : 

Problemen met het inladen van destroyable blocks. Random Generation op het moment, maar het gebeurt 60/seconde. Ik weet niet hoe ik ervoor moet zorgen dat hij het 1-malig uitrekend, en dan dat behoud. 
Hit detectie : Geen enkel idee hoe ik ervoor kan zorgen dat mn bomberman niet door de rotsen loopt
             : hit detectie van de bomb (destroyable destroyed, gewone niet, hit myself? dead)
             : hit detectie van destroyable block wegnemen wanneer dat het weg is.
             ((ook al eens aan anderen gevraagd, een soort array aanmaken was het hoofdidee))
             -Waar- bereken ik best de hit detectie? Player? in de main tab? 
             Typ ik redelijk efficient, of, ben ik op plaatsen gewoon enorm slecht bezig?
             


*/
Board b1;
Player p1;
Bomb bomb1;
HUD h1;


int[] bombArr = new int[0];

boolean bombPlaced = false;
int counterBomb=0;


void setup()

{
  background(1, 186, 0);
  size(480, 516);
  b1 = new Board();
  p1 = new Player();
  bomb1 = new Bomb();
  h1 = new HUD();
  
}



void draw()
{
  background(1, 186, 0);
  


  b1.display();
  // bricks(destroyable) blijven op het moment constant resetten. geprobeerd om er rond te werken, maar iedere keer moest mn background weg uit mn draw, en dat zorgt voor lelijke trails. Nog niet gevonden hoe ik het 'proper' moet doen.


  

  //Er is ook geen hit detectie, ik ben pas op het punt geraakt waar ik mn vaste blokken kan inladen, en hit detection met de blocken was nog iets buiten mijn verstandscapaciteiten.
  if ( keyPressed == true) 
  {
    //print("a");

    if (key == 'd' || keyCode == RIGHT )
    {
      p1.moveRight();
    }
    if (key == 'a' || keyCode == LEFT)
    {
      p1.moveLeft();
    }
    if (key == 's' || keyCode == DOWN)
    {
      p1.moveDown();
    }
    if (key == 'w' || keyCode == UP)
    {
      p1.moveUp();
    }
    if (key == ' ')
    {
      p1.display();
    }
  } else { 
    p1.display();
  }
  
  if (key == ' ' && bombPlaced == false )
  {
    counterBomb = 0;
    bombPlaced = true;
    bomb1.display();
  }
  if (bombPlaced == true )
  {

    if (counterBomb < 60) {
      bomb1.bombDrop();
      counterBomb++;
    } else if (counterBomb < 120)
    {
      bomb1.nearExplosion();
      counterBomb++;
    } else  
    {
      bomb1.explosion();
      counterBomb++;
    }

    if (counterBomb == 145)
    {
      bombPlaced = false;
      counterBomb = 0;
    }
  }
  h1.timer();
}




//void dead nog niet geimplementeerd
//if (touched), black screen en game over
//stats like, bombs exploded, enemies killed