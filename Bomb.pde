public class Bomb
{

  public float m_posX, m_posY;
  public int m_counter;
  public boolean m_hasExploded;
  private int m_hudX;
  private int m_hudY;

  public PImage m_bomb;
  public Bomb( ) {
    m_bomb = loadImage("Bomb_sprite.png");
    m_posX = player.getPosX();
    m_posY = player.getPosY();
    m_hasExploded = false;
    m_hudX = hud.getHudX();
    m_hudY = hud.getHudY();
  }
 public void display() 
  {
    m_counter++;
    if (m_counter == 145) {
      m_hasExploded = true;
      board.bombHasExploded(m_posX,m_posY);
    }else if(m_counter > 120){
      explosion();
    }else if (m_counter/30 % 2 == 0) {
      bombDrop();
    } else if (m_counter/30 % 2 == 1) {
      nearExplosion();
    }

    
    //(img, posX, posY, size, size, pixelstart, pixelstart, pixelend, pixelend)
  }

  //extra voids tijdelijk, zal in display geanimeerd worden zoals walking cycle
  public void bombDrop()
  {

    image(m_bomb, getScreenX()+5, getScreenY()+5, 20, 20, 53, 7, 69, 24);
  }
  public void nearExplosion()
  {

    image(m_bomb, getScreenX()+5, getScreenY()+5, 20, 20, 197, 2, 213, 19);
  }
  public void explosion()
  {

    image(m_bomb, getScreenX(), getScreenY(), 30, 30, 73, 1, 96, 24);
  }
  
  public boolean hasExploded(){
    return m_hasExploded;
  }
  
  public float getScreenX() //to be used for rendering
  {
    return m_posX + m_hudX;
  }
  public float getScreenY()
  {
    return m_posY + m_hudY;
  }
  
}