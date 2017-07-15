class Player
{
  private PImage m_player;
  private float m_posX, m_posY;
  private float m_move;
  private int m_direction;
  private int m_counter;
  private int timer;
  private int m_hudX;
  private int m_hudY;
  
  
  final static int DOWN = 0;
  final static int RIGHT = 1;
  final static int LEFT = 2;
  final static int UP = 3;


  Player() {
    m_player = loadImage("Player_sprite_03.png");
    m_posX = 35;
    m_posY = 35;
    m_move = 1;
    m_direction = DOWN;
    m_hudX = 0;
    m_hudY = 100;
  }
  public void display() 
  {

    // (img, posX, posY, size, size, pixelstart, pixelstart, pixelend, pixelend)
    if (m_direction == DOWN)
    {
      image(m_player, getScreenX(), getScreenY(), 30, 30, 0+(m_counter%4*17), 0, 17+(m_counter%4*17), 21);
    } else if (m_direction == RIGHT)
    {
      image(m_player, getScreenX(), getScreenY(), 30, 30, 210+(m_counter%4*18), 0, 228+(m_counter%4*18), 21);
    } else if (m_direction == LEFT)
    {
      image(m_player, getScreenX(), getScreenY(), 30, 30, 137+(m_counter%4*18), 0, 155+(m_counter%4*18), 21);
    } else if (m_direction == UP)
    {
      image(m_player, getScreenX(), getScreenY(), 30, 30, 68+(m_counter%4*17), 0, 85+(m_counter%4*17), 21);
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
    m_direction = RIGHT;
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
    m_direction = LEFT;
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
    m_direction = DOWN;
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
    m_direction = UP;
  }
  
  public float getScreenX() //to be used for rendering
  {
    return m_posX + m_hudX;
  }
  public float getScreenY()
  {
    return m_posY + m_hudY;
  }
  
  public float getPosX() //to be used for internal logic
  {
    return m_posX;
  }
  public float getPosY()
  {
    return m_posY;
  }
}