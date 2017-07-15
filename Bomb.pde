public class Bomb
{

  public float m_posX, m_posY;
  public int m_counter;
  public boolean m_hasExploded;

  public PImage m_bomb;
  public Bomb( ) {
    m_bomb = loadImage("Bomb_sprite.png");
    m_posX = player.getScreenX();
    m_posY = player.getScreenY();
    m_hasExploded = false;
  }
 public void display() 
  {
    m_counter++;
    if (m_counter == 145) {
      m_hasExploded = true;
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

    image(m_bomb, m_posX+5, m_posY+5, 20, 20, 53, 7, 69, 24);
  }
  public void nearExplosion()
  {

    image(m_bomb, m_posX+5, m_posY+5, 20, 20, 197, 2, 213, 19);
  }
  public void explosion()
  {

    image(m_bomb, m_posX, m_posY, 30, 30, 73, 1, 96, 24);
  }
  
  public boolean hasExploded(){
    return m_hasExploded;
  }
}