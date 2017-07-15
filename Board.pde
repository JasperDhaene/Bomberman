public class Board
{
  public PImage m_board, m_block, m_brick, m_grass;
  private int col, row;
  private String board[] ;
  private int arrayBoard [][];
  
  final static int FREE = 0;
  final static int WALL = 1;
  final static int SPAWN = 2;
  final static int BRICK = 3;
  

  //String[] list = split(board,';');

  public Board() {

    m_board = loadImage("Bomberman_Board.jpg"); //in de file is zijn er wat extra vakjes aan de zijkant overgehouden, anders kan je niet weg van de eerste bom die je mogelijk moet leggen.
    m_block = loadImage("Block_Solid.png"); 
    m_brick = loadImage("Block_breakable.png");
    board = loadStrings("startLayout.txt");
    row = board.length;
    col = board[0].split(";").length;
    arrayBoard = new int [row][col];
    
    //INIT BOARD FROM FILE
    for (int i=0; i < row; i++) {
      for (int j= 0; j< col; j++) {
        arrayBoard [i][j] = int (board[i].split(";")[j]);
      }
    }
    
    //GENERATE DESTROYABLE BLOCKS
    for (int i=1; i < row; i++) {
      for (int j= 1; j< col; j++) {
        if ( arrayBoard [i][j] == 0) {
          if ( random(0, 5) > 3) {
            arrayBoard [i][j] = 3;
          }
        }
      }
    }
  }
  public void display() 
  {
    for (int i=0; i < row; i++) {
      for (int j= 0; j< col; j++) {
        if ( arrayBoard [i][j] == WALL) {
          m_block.resize( 32, 32);

          image( m_block, j*32, 100+(i*32));
        }else if( arrayBoard [i][j] == BRICK) {
          m_brick.resize(32,32);
          image( m_brick,j*32, 100+(i*32));
        }
      }
    }
    //Dit stuk laad de bricks in, maar op het moment is het 1 keer per frame, constant 
    
      
    
    //hit detectie?
    //some boolean, if player moves into square, return true, if true, m_move = 0
    // bord is 13 box hoog, 15 lang
  }
  
}