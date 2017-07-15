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
  size(480, 516); //Always first!
  background(1, 186, 0);
  this.board = new Board();
  this.player = new Player();
  this.hud = new HUD();
  
}


//NOTE: function name is 'draw', but better think of it as 'game-loop'. Draw implies rendering has to happen here and that is its main purpose. It is not.
void draw()
{
  checkInput();
  //updateMovement();
  checkCollision();
  render();
  renderBlockNumbers();
  
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

void checkInput(){
  if ( keyPressed == true) 
  {
    if (key == 'd' || keyCode == RIGHT )
    {
      player.moveRight();
    }
    if (key == 'a' || keyCode == LEFT)
    {
      player.moveLeft();
    }
    if (key == 's' || keyCode == DOWN)
    {
      player.moveDown();
    }
    if (key == 'w' || keyCode == UP)
    {
      player.moveUp();
    }
  }
}

void updateMovement(){
  
}
void checkCollision(){
  for(int i = 0; i < board.getRow();i++){
    for(int j = 0; j < board.getCol();j++){
      if(board.arrayBoard[i][j] == board.WALL || board.arrayBoard[i][j] == board.BRICK){
        
        //TODO: why is i and j switched here?? Logical representation different from graphical one?!
        if(abs(player.getPosX() - j*32) < player.getPlayerWidth() && abs(player.getPosY() - i*32) < player.getPlayerHeight()  ){
          switch(player.getPlayerDirection()){
            //Do the opposite of the player's direction
            case Player.UP: player.incrY();break;
            case Player.DOWN: player.decrY();break;
            case Player.LEFT: player.incrX();break;
            case Player.RIGHT: player.decrX();break;
            
          }
        }
        
      }
        
    }
  }
}

void render(){
   background(1, 186, 0);

   board.display();
   player.display();
   hud.timer();
}

void renderBlockNumbers(){
  for(int i = 0; i < board.getRow();i++){
    for(int j = 0; j < board.getCol();j++){
      textSize(32);
      text(board.arrayBoard[i][j], j*32 , i*32 + 130);
    }
  }
  
   
}



//void dead nog niet geimplementeerd
//if (touched), black screen en game over
//stats like, bombs exploded, enemies killed