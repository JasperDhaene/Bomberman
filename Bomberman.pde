/*Commentaar voor hulp : 

Problemen met het inladen van destroyable blocks. Random Generation op het moment, maar het gebeurt 60/seconde. Ik weet niet hoe ik ervoor moet zorgen dat hij het 1-malig uitrekend, en dan dat behoud. 
Hit detectie : Geen enkel idee hoe ik ervoor kan zorgen dat mn bomberman niet door de rotsen loopt
             : hit detectie van de bomb (destroyable destroyed, gewone niet, hit myself? dead)
             : hit detectie van destroyable block wegnemen wanneer dat het weg is.
             ((ook al eens aan anderen gevraagd, een soort array aanmaken was het hoofdidee))
             -Waar- bereken ik best de hit detectie? Player? in de main tab? 
             Typ ik redelijk efficient, of, ben ik op plaatsen gewoon enorm slecht bezig?
             


*/

//NOTE: This is GLOBAL EVERYWHERE. No encapsulating class.
Board board;
Player player;
HUD hud;
ArrayList<Bomb> bombList = new ArrayList<Bomb>();
//boolean bombPlaced = false;
//int counterBomb=0;





void setup()

{
  background(1, 186, 0);
  size(480, 516);
  this.board = new Board();
  this.player = new Player();
  this.hud = new HUD();
  
}



void draw()
{
  background(1, 186, 0);

  this.board.display();
  // bricks(destroyable) blijven op het moment constant resetten. geprobeerd om er rond te werken, maar iedere keer moest mn background weg uit mn draw, en dat zorgt voor lelijke trails. Nog niet gevonden hoe ik het 'proper' moet doen.

  //Er is ook geen hit detectie, ik ben pas op het punt geraakt waar ik mn vaste blokken kan inladen, en hit detection met de blocken was nog iets buiten mijn verstandscapaciteiten.
  if ( keyPressed == true) 
  {
    //print("a");

    if (key == 'd' || keyCode == RIGHT )
    {
      this.player.moveRight();
    }
    if (key == 'a' || keyCode == LEFT)
    {
      this.player.moveLeft();
    }
    if (key == 's' || keyCode == DOWN)
    {
      this.player.moveDown();
    }
    if (key == 'w' || keyCode == UP)
    {
      this.player.moveUp();
    }
    if (key == ' ')
    {
      this.player.display();
    }
  } else { 
    this.player.display();
  }
  
  this.hud.timer();
  
  
  /*
  if (key == ' ' && bombPlaced == false )
  {
    counterBomb = 0;
    bombPlaced = true;
    //bomb1.display();
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
  */
  
}




//void dead nog niet geimplementeerd
//if (touched), black screen en game over
//stats like, bombs exploded, enemies killed