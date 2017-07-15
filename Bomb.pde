public class Bomb
{

  public float b_posX, b_posY;
  public int b_counter;
  public Boolean bombExploded;

  public PImage m_bomb;
  public Bomb() {

    m_bomb = loadImage("Bomb_sprite.png");
  }
 public void display() 
  {

    if (key == ' ' ) 
    {
      b_posX = p1.getPosX();
      b_posY = p1.getPosY();
    }
    //(img, posX, posY, size, size, pixelstart, pixelstart, pixelend, pixelend)
  }

  //extra voids tijdelijk, zal in display geanimeerd worden zoals walking cycle
  public void bombDrop()
  {

    image(m_bomb, b_posX+5, b_posY+5, 20, 20, 53, 7, 69, 24);
  }
  public void nearExplosion()
  {

    image(m_bomb, b_posX+5, b_posY+5, 20, 20, 197, 2, 213, 19);
  }
  public void explosion()
  {

    image(m_bomb, b_posX, b_posY, 30, 30, 73, 1, 96, 24);
  }
}