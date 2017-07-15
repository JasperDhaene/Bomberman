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
  private int m_playerWidth;
  private int m_playerHeight;
  private int m_amountOfBombs;
  private ArrayList<Bomb> bombList;
  
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
    m_playerWidth = 28; //best beetje kleiner om toch te kunnen bewegen
    m_playerHeight = 28;
    m_amountOfBombs = 1;
    bombList = new ArrayList<Bomb>();
    
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
    
    for(int i = 0; i < bombList.size();i++){
      if(!bombList.get(i).hasExploded()){
        bombList.get(i).display();
      }else{
        m_amountOfBombs++;
        bombList.remove(i);
      }
      
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
    incrX();
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
    decrX();
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
    incrY();
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
    decrY();
    m_direction = UP;
  }
  
  public void dropBomb(){
    if(m_amountOfBombs>0){
      m_amountOfBombs--;
      bombList.add(new Bomb());
    }
  }
  
  public void incrX(){
    m_posX+=m_move;
  }
  public void incrY(){
    m_posY+=m_move;
  }
  public void decrX(){
    m_posX-=m_move;
  }
  public void decrY(){
    m_posY-=m_move;
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
  public void setPosX(float x) //to be used for internal logic
  {
    m_posX = x;
  }
  public void setPosY(float y)
  {
    m_posY = y;
  }
  
  public int getPlayerHeight() //to be used for internal logic
  {
    return m_playerHeight;
  }
  public int getPlayerWidth()
  {
    return m_playerWidth;
  }
  public int getPlayerDirection()
  {
    return m_direction;
  }
  public int getAmountOfBombs(){
    return m_amountOfBombs;  
  }
}