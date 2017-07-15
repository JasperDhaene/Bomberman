class Player
{
  private PImage m_player;
  private float m_posX, m_posY;
  private float m_move;
  private int m_direction;
  private int m_counter;
  private int timer;


  Player() {
    m_player = loadImage("Player_sprite_03.png");
    m_posX = 35;
    m_posY = 134;
    m_move = 1.5;
    m_direction = 0;
  }
  public void display() 
  {

    // (img, posX, posY, size, size, pixelstart, pixelstart, pixelend, pixelend)
    if (m_direction == 0) /* down */
    {
      image(m_player, m_posX, m_posY, 30, 30, 0, 0, 17, 21);
    } else if (m_direction == 1) /* Right */
    {
      image(m_player, m_posX, m_posY, 30, 30, 210, 0, 228, 21);
    } else if (m_direction == 2)/* Left */
    {
      image(m_player, m_posX, m_posY, 30, 30, 137, 0, 155, 21);
    } else if (m_direction == 3)/* Up */
    {
      image(m_player, m_posX, m_posY, 30, 30, 68, 0, 85, 21);
    }
  }
  public void moveRight()
  {
    timer++;
    if (timer == 20) 
    {
      m_counter++ ; 
      timer = 0 ;
    }
    m_posX += m_move;
    m_direction = 1;
    image(m_player, m_posX, m_posY, 30, 30, 210+(m_counter%4*18), 0, 228+(m_counter%4*18), 21);
  }
  public void moveLeft()
  {
    timer++;
    if (timer == 20) 
    { 
      m_counter++ ; 
      timer = 0 ;
    }
    m_posX -= m_move;
    m_direction = 2;
    image(m_player, m_posX, m_posY, 30, 30, 137+(m_counter%4*18), 0, 155+(m_counter%4*18), 21);
  }
  public void moveDown()
  {
    timer++;
    if (timer == 20) 
    {
      m_counter++ ; 
      timer = 0 ;
    }
    m_posY += m_move;
    m_direction = 0;
    image(m_player, m_posX, m_posY, 30, 30, 0+(m_counter%4*17), 0, 17+(m_counter%4*17), 21);
  }
  public void moveUp()
  {
    timer++;
    if (timer == 20) 
    {
      m_counter++ ; 
      timer = 0 ;
    }
    m_posY -= m_move;
    m_direction = 3;
    image(m_player, m_posX, m_posY, 30, 30, 68+(m_counter%4*17), 0, 85+(m_counter%4*17), 21);
  }
  public float getPosX()
  {
    return m_posX;
  }
  public float getPosY()
  {
    return m_posY;
  }
}