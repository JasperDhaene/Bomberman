class HUD
{
  private int time;
  private int clock = 1000;
  final static int m_hudX = 0; //just so everybody can ask the HUD
  final static int m_hudY = 100;
  HUD()
  {
    time = 0;
    time++;
  
  }
  public void timer()
  {

    time++;
    if (time > 60) {
      clock--;
      time = 0;
    }
    if (clock < 1)
    {
      clock=-1;
      fill (0, 0, 0);
      rect(0, 0, width, height);
      fill(255, 255, 255);
      textSize(50);
      textAlign(CENTER);
      text("Game Over", width/2, height/2);
      textSize(20);
      text("Restart to play again", width/2, height/2+50);
      //nog geen win conditie, en geen reset knop.
    }

    if (clock > 0) {

      fill(255, 255, 255);
    } else
    {
      fill(0, 0, 0);
    }
    textSize(20);
    text (clock, width-60, 20);
    
    textSize(20);
    text ("Bombs:" + player.getAmountOfBombs(), 20, 20);
  }
  public int getHudX(){
    return m_hudX;
  }
  public int getHudY(){
    return m_hudY;
  }
  
}