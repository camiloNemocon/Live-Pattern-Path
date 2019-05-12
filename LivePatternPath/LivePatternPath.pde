import controlP5.*;
import ddf.minim.*;

ControlFrame cf;
Minim minim;

lineaCompleta linea1;
lineaCompleta linea2;
lineaCompleta linea3;
lineaCompleta linea4;
lineaCompleta linea5;
lineaCompleta linea6;

boolean[] movi;
float[] blend;
float [] redColor;
float [] greenColor;
float [] blueColor;
float [] vel;
int [] distancia;
int [] numPuntos;
int [] y;
int [] x;
int [] ang;
boolean[] mutePoints;
boolean[] muteBorders;

void settings()
{
  size(1280, 768, P3D);
}

void setup() 
{
  frameRate(30);
  
  cf = new ControlFrame(this, 400, 800, "Controls");
  surface.setLocation(420, 10);
  
   minim = new Minim(this);
   
   movi = new boolean[10];
   blend = new float[10];
   redColor = new float[10];
   greenColor = new float[10];
   blueColor = new float[10];
   vel = new float[10];
   distancia = new int[10];
   numPuntos = new int[10];
   y = new int[10];
   x = new int[10];
   ang = new int[10];
   mutePoints = new boolean[10];
   muteBorders = new boolean[10];
   
   for(int i=0; i<10; i++)
   {
     movi[i] = false;  
     blend[i] = 255; 
     redColor[i] = 255;
     greenColor[i] = 0;
     blueColor[i] = 0;
     vel[i] = 1;
     distancia[i] = 50;
     numPuntos[i] = 4;
     y[i] = 0;
     x[i] = 0;
     ang[i] = 0;
     mutePoints[i] = true;
     muteBorders[i] = true;
   }
   
  //String cancionExtremo, String cancionPunto, int numeroCirculos, int distanciaCirculos, boolean movimiento, int Ypos, int Xpos
  linea1 = new lineaCompleta("linea1Extremos.mp3","linea1Puntos.mp3",4,60,false,20,0); 
  linea2 = new lineaCompleta("linea2Extremos.mp3","linea2Puntos.mp3",4,60,false,20,0);
  linea3 = new lineaCompleta("linea3Extremos.mp3","linea3Puntos.mp3",4,60,false,20,0);
  linea4 = new lineaCompleta("linea4Extremos.mp3","linea4Puntos.mp3",4,60,false,20,0);
  linea5 = new lineaCompleta("linea5Extremos.mp3","linea5Puntos.mp3",4,60,false,20,0);
  linea6 = new lineaCompleta("linea6Extremos.mp3","linea6Puntos.mp3",4,60,false,20,0);
}


void draw() 
{
   background(0);
   linea1.update(movi[0], blend[0], redColor[0], greenColor[0], blueColor[0], vel[0], distancia[0], numPuntos[0], y[0], x[0], ang[0], mutePoints[0], muteBorders[0]);
   linea2.update(movi[1], blend[1], redColor[1], greenColor[1], blueColor[1], vel[1], distancia[1], numPuntos[1], y[1], x[1], ang[1], mutePoints[1], muteBorders[1]);
   linea3.update(movi[2], blend[2], redColor[2], greenColor[2], blueColor[2], vel[2], distancia[2], numPuntos[2], y[2], x[2], ang[2], mutePoints[2], muteBorders[2]);
   linea4.update(movi[3], blend[3], redColor[3], greenColor[3], blueColor[3], vel[3], distancia[3], numPuntos[3], y[3], x[3], ang[3], mutePoints[3], muteBorders[3]);
   linea5.update(movi[4], blend[4], redColor[4], greenColor[4], blueColor[4], vel[4], distancia[4], numPuntos[4], y[4], x[4], ang[4], mutePoints[4], muteBorders[4]);
   linea6.update(movi[5], blend[5], redColor[5], greenColor[5], blueColor[5], vel[5], distancia[5], numPuntos[5], y[5], x[5], ang[5], mutePoints[5], muteBorders[5]);

}






class ControlFrame extends PApplet 
{
  int w, h;
  PApplet parent;
  
  ControlP5 cp5;
  ControlP5 cp5Linea1;
  ControlP5 cp5Linea2;
  ControlP5 cp5Linea3;
  ControlP5 cp5Linea4;
  ControlP5 cp5Linea5;
  ControlP5 cp5Linea6;
  
  Accordion accordion;
  Group g1;
  Group g2;
  Group g3;
  Group g4;
  Group g5;
  Group g6;
  
  Controlador controlador1;
  Controlador controlador2;
  Controlador controlador3;
  Controlador controlador4;
  Controlador controlador5;
  Controlador controlador6;
  
  String linea1estado = "A";
  String linea2estado = "A";
  String linea3estado = "A";
  String linea4estado = "A";
  String linea5estado = "A";
  String linea6estado = "A";
  
  boolean iniciar = false;
  
  public ControlFrame(PApplet _parent, int _w, int _h, String _name) 
  {
    super();   
    parent = _parent;
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }
  
  public void settings() 
  {
    size(w, h);
  }
  
  public void setup() 
  {
    surface.setLocation(0, 10);
    
    cp5 = new ControlP5(this);
    cp5Linea1 = new ControlP5(this);
    cp5Linea2 = new ControlP5(this);
    cp5Linea3 = new ControlP5(this);
    cp5Linea4 = new ControlP5(this);
    cp5Linea5 = new ControlP5(this);
    cp5Linea6 = new ControlP5(this);
    
    // group number 1
    g1 = cp5Linea1.addGroup("LINEA 1")
            .setBackgroundColor(color(0, 64))
            .setBackgroundHeight(590)
            ;
    //ControlP5 cp5, String lineaR, Group grupo, int posXtiempo, int posYtiempo, int idLinea
    controlador1 = new Controlador(cp5Linea1,"linea1", g1, 50, 15, 1);  
    
    g2 = cp5Linea2.addGroup("LINEA 2")
            .setBackgroundColor(color(0, 64))
            .setBackgroundHeight(590)
            ;

    controlador2 = new Controlador(cp5Linea2,"linea2", g2, 50, 45, 2);  
        
    g3 = cp5Linea3.addGroup("LINEA 3")
            .setBackgroundColor(color(0, 64))
            .setBackgroundHeight(590)
            ;

    controlador3 = new Controlador(cp5Linea3,"linea3", g3, 50, 75, 3);  
    
    g4 = cp5Linea4.addGroup("LINEA 4")
            .setBackgroundColor(color(0, 64))
            .setBackgroundHeight(590)
            ;

    controlador4 = new Controlador(cp5Linea4,"linea4", g4, 250, 15, 4);  
    
    g5 = cp5Linea5.addGroup("LINEA 5")
            .setBackgroundColor(color(0, 64))
            .setBackgroundHeight(590)
            ;

    controlador5 = new Controlador(cp5Linea5,"linea5", g5, 250, 45, 5);  
    
    g6 = cp5Linea6.addGroup("LINEA 6")
            .setBackgroundColor(color(0, 64))
            .setBackgroundHeight(590)
            ;

    controlador6 = new Controlador(cp5Linea6,"linea6", g6, 250, 75, 6);  
    
    
    accordion = cp5.addAccordion("acc")
                 .setPosition(10,100)
                 .setWidth(380)
                 .addItem(g1)
                 .addItem(g2)
                 .addItem(g3)
                 .addItem(g4)
                 .addItem(g5)
                 .addItem(g6)
                 ;
                 
    accordion.open(0);
    
    // when in SINGLE mode, only 1 accordion group can be open at a time.  
    accordion.setCollapseMode(Accordion.SINGLE);
  }

  void draw()
  {
     background(0);
     
     text("LINEA 1:",10,20);
     text("SET:",10,30);
     text(linea1estado,35,30);
     controlador1.update();
     
     text("LINEA 2:",10,50);     
     text("SET:",10,60);
     text(linea2estado,35,60);
     controlador2.update();
     
     text("LINEA 3:",10,80);     
     text("SET:",10,90);
     text(linea3estado,35,90);
     controlador3.update();
     
     text("LINEA 4:",210,20);
     text("SET:",210,30);
     text(linea4estado,235,30);
     controlador4.update();
     
     text("LINEA 5:",210,50);
     text("SET:",210,60);
     text(linea5estado,235,60);
     controlador5.update();
     
     text("LINEA 6:",210,80);
     text("SET:",210,90);
     text(linea6estado,235,90);
     controlador6.update();
     
     if(controlador1.getSegundo() == 1)
     {
       iniciar = true;
     }
  }
  
  /*void mousePressed()
  {
    iniciar = true;
  }*/
  
  void controlEvent(ControlEvent theEvent) 
  {
    /*println(
    "## controlEvent / id:"+theEvent.controller().getId()+
    " / name:"+theEvent.controller().getName()+
    " / value:"+theEvent.controller().getValue()
    );*/
    
    
    if(iniciar == true)
    {
      if (theEvent.getController().getName().equals("state"))
      {
         opcionEstado(theEvent.controller().getId());         
      }
      
      if (theEvent.getController().getName().equals("movimiento"))
      {
         opcionMov(theEvent.controller().getId());         
      }
      
      if (theEvent.getController().getName().equals("blend"))
      {
        opcionTransparencia(theEvent.controller().getId());         
      }
      
      if (theEvent.getController().getName().equals("color-red"))
      {
        opcionRojo(theEvent.controller().getId());              
      }
      
      if (theEvent.getController().getName().equals("color-green"))
      {
        opcionVerde(theEvent.controller().getId());
      }
      
      if (theEvent.getController().getName().equals("color-blue"))
      {
        opcionAzul(theEvent.controller().getId());
      }
      
      if (theEvent.getController().getName().equals("speed"))
      {
        opcionVelocidad(theEvent.controller().getId()); 
      }
      
      if (theEvent.getController().getName().equals("Distancia"))
      {
        opcionDistancia(theEvent.controller().getId()); 
      }
      
      if (theEvent.getController().getName().equals("NumPuntos"))
      {
        opcionPuntos(theEvent.controller().getId()); 
      }
      
      if (theEvent.getController().getName().equals("Y"))
      {
        opcionPosY(theEvent.controller().getId());
      }
      
      if (theEvent.getController().getName().equals("X"))
      {
        opcionPosX(theEvent.controller().getId()); 
      }     
      
      if (theEvent.getController().getName().equals("Z"))
      {
        opcionAngulo(theEvent.controller().getId());
      } 
      
      if (theEvent.getController().getName().equals("sonidoPuntos"))
      {
        opcionSonidoPuntos(theEvent.controller().getId());
      }
      
      if (theEvent.getController().getName().equals("sonidoExtremos"))
      {
         opcionSonidoExtremos(theEvent.controller().getId());
      }
      
      if(theEvent.isAssignableFrom(Textfield.class)) 
      {
            if(theEvent.getName().equals("hora"))
            {
              if(theEvent.controller().getId() == 1)
              {
                controlador1.hora(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 2)
              {
                controlador2.hora(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 3)
              {
                controlador3.hora(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 4)
              {
                controlador4.hora(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 5)
              {
                controlador5.hora(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 6)
              {
                controlador6.hora(theEvent.getStringValue());
              }
            }
            
            if(theEvent.getName().equals("minuto"))
            {
              if(theEvent.controller().getId() == 1)
              {
                controlador1.minuto(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 2)
              {
                controlador2.minuto(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 3)
              {
                controlador3.minuto(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 4)
              {
                controlador4.minuto(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 5)
              {
                controlador5.minuto(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 6)
              {
                controlador6.minuto(theEvent.getStringValue());
              }
            }
            
            if(theEvent.getName().equals("segundo"))
            {
              if(theEvent.controller().getId() == 1)
              {
                controlador1.segundo(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 2)
              {
                controlador2.segundo(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 3)
              {
                controlador3.segundo(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 4)
              {
                controlador4.segundo(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 5)
              {
                controlador5.segundo(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 6)
              {
                controlador6.segundo(theEvent.getStringValue());
              }
            }            
      }
      
      if(theEvent.getController().getName().equals("guardarA"))
      {
        opcionGuardarA(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarA"))
      {
        opcionaCargarA(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("guardarB"))
      {
        opcionGuardarB(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarB"))
      {
        opcionaCargarB(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("guardarC"))
      {
        opcionGuardarC(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarC"))
      {
        opcionaCargarC(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("guardarD"))
      {
        opcionGuardarD(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarD"))
      {
        opcionaCargarD(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("guardarE"))
      {
        opcionGuardarE(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarE"))
      {
        opcionaCargarE(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("guardarF"))
      {
        opcionGuardarF(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarF"))
      {
        opcionaCargarF(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("guardarG"))
      {
        opcionGuardarG(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarG"))
      {
        opcionaCargarG(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("guardarH"))
      {
        opcionGuardarH(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarH"))
      {
        opcionaCargarH(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("guardarI"))
      {
        opcionGuardarI(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarI"))
      {
        opcionaCargarI(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("guardarJ"))
      {
        opcionGuardarJ(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarJ"))
      {
        opcionaCargarJ(theEvent.controller().getId());
      }
      
    }        
  }
  
  void opcionEstado(int id)
  {
    if(id == 1)
    {
      linea1estado = controlador1.getSet();
    }
    if(id == 2)
    {
      linea2estado = controlador2.getSet();
    }
    if(id == 3)
    {
      linea3estado = controlador3.getSet();
    }
    if(id == 4)
    {
      linea4estado = controlador4.getSet();
    }
    if(id == 5)
    {
      linea5estado = controlador5.getSet();
    }
    if(id == 6)
    {
      linea6estado = controlador6.getSet();
    }
  }
  
  void opcionMov(int id)
  {
    if(id == 1)
    {
       if(controlador1.getValueMovimiento() == 1)
       {
         movi[0] = true;       
       }
       else if(controlador1.getValueMovimiento() == 0)
       {
         movi[0] = false; 
       }
    }    
    if(id == 2)
    {
       if(controlador2.getValueMovimiento() == 1)
       {
         movi[1] = true;       
       }
       else if(controlador2.getValueMovimiento() == 0)
       {
         movi[1] = false; 
       }
    }    
    if(id == 3)
    {
       if(controlador3.getValueMovimiento() == 1)
       {
         movi[2] = true;       
       }
       else if(controlador3.getValueMovimiento() == 0)
       {
         movi[2] = false; 
       }
    }
    if(id == 4)
    {
       if(controlador4.getValueMovimiento() == 1)
       {
         movi[3] = true;       
       }
       else if(controlador4.getValueMovimiento() == 0)
       {
         movi[3] = false; 
       }
    }
    if(id == 5)
    {
       if(controlador5.getValueMovimiento() == 1)
       {
         movi[4] = true;       
       }
       else if(controlador5.getValueMovimiento() == 0)
       {
         movi[4] = false; 
       }
    }
    if(id == 6)
    {
       if(controlador6.getValueMovimiento() == 1)
       {
         movi[5] = true;       
       }
       else if(controlador6.getValueMovimiento() == 0)
       {
         movi[5] = false; 
       }
    }
  }
  
  void opcionTransparencia(int id)
  {
    if(id == 1)
    {
      g1.setBackgroundColor(color(controlador1.getValueColorRed(),controlador1.getValueColorGreen(),controlador1.getValueColorBlue(),controlador1.getValueTransparent()));
      blend[0] = controlador1.getValueTransparent();
    }    
    if(id == 2)
    {
      g2.setBackgroundColor(color(controlador2.getValueColorRed(),controlador2.getValueColorGreen(),controlador2.getValueColorBlue(),controlador2.getValueTransparent()));
      blend[1] = controlador2.getValueTransparent();
    }    
    if(id == 3)
    {
      g3.setBackgroundColor(color(controlador3.getValueColorRed(),controlador3.getValueColorGreen(),controlador3.getValueColorBlue(),controlador3.getValueTransparent()));
      blend[2] = controlador3.getValueTransparent();
    }
    if(id == 4)
    {
      g4.setBackgroundColor(color(controlador4.getValueColorRed(),controlador4.getValueColorGreen(),controlador4.getValueColorBlue(),controlador4.getValueTransparent()));
      blend[3] = controlador4.getValueTransparent();
    }
    if(id == 5)
    {
      g5.setBackgroundColor(color(controlador5.getValueColorRed(),controlador5.getValueColorGreen(),controlador5.getValueColorBlue(),controlador5.getValueTransparent()));
      blend[4] = controlador5.getValueTransparent();
    }
    if(id == 6)
    {
      g6.setBackgroundColor(color(controlador6.getValueColorRed(),controlador6.getValueColorGreen(),controlador6.getValueColorBlue(),controlador6.getValueTransparent()));
      blend[5] = controlador6.getValueTransparent();
    }
  }
  
  void opcionRojo(int id)
  {
    if(id == 1)
    {
      redColor[0] = controlador1.getValueColorRed();
      g1.setBackgroundColor(color(controlador1.getValueColorRed(),controlador1.getValueColorGreen(),controlador1.getValueColorBlue(),controlador1.getValueTransparent()));
    }    
    if(id == 2)
    {
      redColor[1] = controlador2.getValueColorRed();
      g2.setBackgroundColor(color(controlador2.getValueColorRed(),controlador2.getValueColorGreen(),controlador2.getValueColorBlue(),controlador2.getValueTransparent()));
    }    
    if(id == 3)
    {
      redColor[2] = controlador3.getValueColorRed();
      g3.setBackgroundColor(color(controlador3.getValueColorRed(),controlador3.getValueColorGreen(),controlador3.getValueColorBlue(),controlador3.getValueTransparent()));
    }
    if(id == 4)
    {
      redColor[3] = controlador4.getValueColorRed();
      g4.setBackgroundColor(color(controlador4.getValueColorRed(),controlador4.getValueColorGreen(),controlador4.getValueColorBlue(),controlador4.getValueTransparent()));
    }
    if(id == 5)
    {
      redColor[4] = controlador5.getValueColorRed();
      g5.setBackgroundColor(color(controlador5.getValueColorRed(),controlador5.getValueColorGreen(),controlador5.getValueColorBlue(),controlador5.getValueTransparent()));
    }
    if(id == 6)
    {
      redColor[5] = controlador6.getValueColorRed();
      g6.setBackgroundColor(color(controlador6.getValueColorRed(),controlador6.getValueColorGreen(),controlador6.getValueColorBlue(),controlador6.getValueTransparent()));
    }
  }
  
  void opcionVerde(int id)
  {
    if(id == 1)
    {
      greenColor[0] = controlador1.getValueColorGreen(); 
      g1.setBackgroundColor(color(controlador1.getValueColorRed(),controlador1.getValueColorGreen(),controlador1.getValueColorBlue(),controlador1.getValueTransparent()));   
    }       
    if(id == 2)
    {
      greenColor[1] = controlador2.getValueColorGreen(); 
      g2.setBackgroundColor(color(controlador2.getValueColorRed(),controlador2.getValueColorGreen(),controlador2.getValueColorBlue(),controlador2.getValueTransparent()));   
    }    
    if(id == 3)
    {
      greenColor[2] = controlador3.getValueColorGreen(); 
      g3.setBackgroundColor(color(controlador3.getValueColorRed(),controlador3.getValueColorGreen(),controlador3.getValueColorBlue(),controlador3.getValueTransparent()));   
    }
    if(id == 4)
    {
      greenColor[3] = controlador4.getValueColorGreen(); 
      g4.setBackgroundColor(color(controlador4.getValueColorRed(),controlador4.getValueColorGreen(),controlador4.getValueColorBlue(),controlador4.getValueTransparent()));   
    }
    if(id == 5)
    {
      greenColor[4] = controlador5.getValueColorGreen(); 
      g5.setBackgroundColor(color(controlador5.getValueColorRed(),controlador5.getValueColorGreen(),controlador5.getValueColorBlue(),controlador5.getValueTransparent()));   
    }
    if(id == 6)
    {
      greenColor[5] = controlador6.getValueColorGreen(); 
      g6.setBackgroundColor(color(controlador6.getValueColorRed(),controlador6.getValueColorGreen(),controlador6.getValueColorBlue(),controlador6.getValueTransparent()));   
    }
  }
  
  void opcionAzul(int id)
  {
    if(id == 1)
    {
      blueColor[0] = controlador1.getValueColorBlue(); 
      g1.setBackgroundColor(color(controlador1.getValueColorRed(),controlador1.getValueColorGreen(),controlador1.getValueColorBlue(),controlador1.getValueTransparent()));
    }    
    if(id == 2)
    {
      blueColor[1] = controlador2.getValueColorBlue(); 
      g2.setBackgroundColor(color(controlador2.getValueColorRed(),controlador2.getValueColorGreen(),controlador2.getValueColorBlue(),controlador2.getValueTransparent()));
    }    
    if(id == 3)
    {
      blueColor[2] = controlador3.getValueColorBlue(); 
      g3.setBackgroundColor(color(controlador3.getValueColorRed(),controlador3.getValueColorGreen(),controlador3.getValueColorBlue(),controlador3.getValueTransparent()));
    }
    if(id == 4)
    {
      blueColor[3] = controlador4.getValueColorBlue(); 
      g4.setBackgroundColor(color(controlador4.getValueColorRed(),controlador4.getValueColorGreen(),controlador4.getValueColorBlue(),controlador4.getValueTransparent()));
    }
    if(id == 5)
    {
      blueColor[4] = controlador5.getValueColorBlue(); 
      g5.setBackgroundColor(color(controlador5.getValueColorRed(),controlador5.getValueColorGreen(),controlador5.getValueColorBlue(),controlador5.getValueTransparent()));
    }
    if(id == 6)
    {
      blueColor[5] = controlador6.getValueColorBlue(); 
      g6.setBackgroundColor(color(controlador6.getValueColorRed(),controlador6.getValueColorGreen(),controlador6.getValueColorBlue(),controlador6.getValueTransparent()));
    }
  }
  
  void opcionVelocidad(int id)
  {
    if(id == 1)
    {
      vel[0] = controlador1.getValueSpeed();
    }
    if(id == 2)
    {
      vel[1] = controlador2.getValueSpeed();
    }
    if(id == 3)
    {
      vel[2] = controlador3.getValueSpeed();
    }
    if(id == 4)
    {
      vel[3] = controlador4.getValueSpeed();
    }
    if(id == 5)
    {
      vel[4] = controlador5.getValueSpeed();
    }
    if(id == 6)
    {
      vel[5] = controlador6.getValueSpeed();
    }
  }
  
  void opcionDistancia(int id)
  {
    if(id == 1)
    {
      distancia[0] = int(controlador1.getValueDistance());
    }    
    if(id == 2)
    {
      distancia[1] = int(controlador2.getValueDistance());
    }
    if(id == 3)
    {
      distancia[2] = int(controlador3.getValueDistance());
    }
    if(id == 4)
    {
      distancia[3] = int(controlador4.getValueDistance());
    }
    if(id == 5)
    {
      distancia[4] = int(controlador5.getValueDistance());
    }
    if(id == 6)
    {
      distancia[5] = int(controlador6.getValueDistance());
    }
  }
  
  void opcionPuntos(int id)
  {
    if(id == 1)
    {
      numPuntos[0] = int(controlador1.getValueNumPoints());
    }    
    if(id == 2)
    {
      numPuntos[1] = int(controlador2.getValueNumPoints());
    }
    if(id == 3)
    {
      numPuntos[2] = int(controlador3.getValueNumPoints());
    }
    if(id == 4)
    {
      numPuntos[3] = int(controlador4.getValueNumPoints());
    }
    if(id == 5)
    {
      numPuntos[4] = int(controlador5.getValueNumPoints());
    }
    if(id == 6)
    {
      numPuntos[5] = int(controlador6.getValueNumPoints());
    }
  }
  
  void opcionPosY(int id)
  {
    if(id == 1)
    {
      y[0] = int(controlador1.getValuePosY()); 
    }    
    if(id == 2)
    {
      y[1] = int(controlador2.getValuePosY()); 
    }
    if(id == 3)
    {
      y[2] = int(controlador3.getValuePosY()); 
    }
    if(id == 4)
    {
      y[3] = int(controlador4.getValuePosY()); 
    }
    if(id == 5)
    {
      y[4] = int(controlador5.getValuePosY()); 
    }
    if(id == 6)
    {
      y[5] = int(controlador6.getValuePosY()); 
    }
  }
  
  void opcionPosX(int id)
  {
    if(id == 1)
    {
      x[0] = int(controlador1.getValuePosX());
    }
    if(id == 2)
    {
      x[1] = int(controlador2.getValuePosX());
    }
    if(id == 3)
    {
      x[2] = int(controlador3.getValuePosX());
    }
    if(id == 4)
    {
      x[3] = int(controlador4.getValuePosX());
    }
    if(id == 5)
    {
      x[4] = int(controlador5.getValuePosX());
    }
    if(id == 6)
    {
      x[5] = int(controlador6.getValuePosX());
    }
  }  
  
  void opcionAngulo(int id)
  {
    if(id == 1)
    {
      ang[0] = int(controlador1.getValueAng()); 
    }
    if(id == 2)
    {
      ang[1] = int(controlador2.getValueAng());
    }
    if(id == 3)
    {
      ang[2] = int(controlador3.getValueAng());
    }
    if(id == 4)
    {
      ang[3] = int(controlador4.getValueAng());
    }
    if(id == 5)
    {
      ang[4] = int(controlador5.getValueAng());
    }
    if(id == 6)
    {
      ang[5] = int(controlador6.getValueAng());
    }
  }
  
  void opcionSonidoExtremos(int id)
  {
    if(id == 1)
    {
       if(controlador1.getValueMuteBorders() == 1)
       {
         muteBorders[0] = true;       
       }
       else if(controlador1.getValueMuteBorders() == 0)
       {
         muteBorders[0] = false; 
       }
    }     
    if(id == 2)
    {
       if(controlador2.getValueMuteBorders() == 1)
       {
         muteBorders[1] = true;       
       }
       else if(controlador2.getValueMuteBorders() == 0)
       {
         muteBorders[1] = false; 
       }
    }
    if(id == 3)
    {
       if(controlador3.getValueMuteBorders() == 1)
       {
         muteBorders[2] = true;       
       }
       else if(controlador3.getValueMuteBorders() == 0)
       {
         muteBorders[2] = false; 
       }
    }
    if(id == 4)
    {
       if(controlador4.getValueMuteBorders() == 1)
       {
         muteBorders[3] = true;       
       }
       else if(controlador4.getValueMuteBorders() == 0)
       {
         muteBorders[3] = false; 
       }
    }
    if(id == 5)
    {
       if(controlador5.getValueMuteBorders() == 1)
       {
         muteBorders[4] = true;       
       }
       else if(controlador5.getValueMuteBorders() == 0)
       {
         muteBorders[4] = false; 
       }
    }
    if(id == 6)
    {
       if(controlador6.getValueMuteBorders() == 1)
       {
         muteBorders[5] = true;       
       }
       else if(controlador6.getValueMuteBorders() == 0)
       {
         muteBorders[5] = false; 
       }
    }    
  }
  
  void opcionSonidoPuntos(int id)
  {
    if(id == 1)
    {
     if(controlador1.getValueMutePoints() == 1)
     {
       mutePoints[0] = true;       
     }
     else if(controlador1.getValueMutePoints() == 0)
     {
       mutePoints[0] = false; 
     }
    }     
    if(id == 2)
    { 
     if(controlador2.getValueMutePoints() == 1)
     {
       mutePoints[1] = true;       
     }
     else if(controlador2.getValueMutePoints() == 0)
     {
       mutePoints[1] = false; 
     }
    }
    if(id == 3)
    { 
     if(controlador3.getValueMutePoints() == 1)
     {
       mutePoints[2] = true;       
     }
     else if(controlador3.getValueMutePoints() == 0)
     {
       mutePoints[2] = false; 
     }
    }
    if(id == 4)
    { 
     if(controlador4.getValueMutePoints() == 1)
     {
       mutePoints[3] = true;       
     }
     else if(controlador4.getValueMutePoints() == 0)
     {
       mutePoints[3] = false; 
     }
    }
    if(id == 5)
    { 
     if(controlador5.getValueMutePoints() == 1)
     {
       mutePoints[4] = true;       
     }
     else if(controlador5.getValueMutePoints() == 0)
     {
       mutePoints[4] = false; 
     }
    }
    if(id == 6)
    { 
     if(controlador6.getValueMutePoints() == 1)
     {
       mutePoints[5] = true;       
     }
     else if(controlador6.getValueMutePoints() == 0)
     {
       mutePoints[5] = false; 
     }
    }
  }
  
  void opcionGuardarA(int id)
  {
    if(id == 1)
    {
      controlador1.guardarA();
    }
    if(id == 2)
    {
      controlador2.guardarA();
    }
    if(id == 3)
    {
      controlador3.guardarA();
    }
    if(id == 4)
    {
      controlador4.guardarA();
    }
    if(id == 5)
    {
      controlador5.guardarA();
    }
    if(id == 6)
    {
      controlador6.guardarA();
    }
  }
  
  void opcionaCargarA(int id)
  {
    if(id == 1)
    {
      controlador1.cargarA();
    }
    if(id == 2)
    {
      controlador2.cargarA();
    }
    if(id == 3)
    {
      controlador3.cargarA();
    }
    if(id == 4)
    {
      controlador4.cargarA();
    }
    if(id == 5)
    {
      controlador5.cargarA();
    }
    if(id == 6)
    {
      controlador6.cargarA();
    }
}
  
  void opcionGuardarB(int id)
  {
    if(id == 1)
    {
      controlador1.guardarB();
    }
    if(id == 2)
    {
      controlador2.guardarB();
    }
    if(id == 3)
    {
      controlador3.guardarB();
    }
    if(id == 4)
    {
      controlador4.guardarB();
    }
    if(id == 5)
    {
      controlador5.guardarB();
    }
    if(id == 6)
    {
      controlador6.guardarB();
    }
  }
  
  void opcionaCargarB(int id)
  {
    if(id == 1)
    {
      controlador1.cargarB();
    }
    if(id == 2)
    {
      controlador2.cargarB();
    }
    if(id == 3)
    {
      controlador3.cargarB();
    }
    if(id == 4)
    {
      controlador4.cargarB();
    }
    if(id == 5)
    {
      controlador5.cargarB();
    }
    if(id == 6)
    {
      controlador6.cargarB();
    }
  }
  
  void opcionGuardarC(int id)
  {
    if(id == 1)
    {
      controlador1.guardarC();
    }
    if(id == 2)
    {
      controlador2.guardarC();
    }
    if(id == 3)
    {
      controlador3.guardarC();
    }
    if(id == 4)
    {
      controlador4.guardarC();
    }
    if(id == 5)
    {
      controlador5.guardarC();
    }
    if(id == 6)
    {
      controlador6.guardarC();
    }
  }
  
  void opcionaCargarC(int id)
  {
    if(id == 1)
    {
      controlador1.cargarC();
    }
    if(id == 2)
    {
      controlador2.cargarC();
    }
    if(id == 3)
    {
      controlador3.cargarC();
    }
    if(id == 4)
    {
      controlador4.cargarC();
    }
    if(id == 5)
    {
      controlador5.cargarC();
    }
    if(id == 6)
    {
      controlador6.cargarC();
    }
  }
  
  void opcionGuardarD(int id)
  {
    if(id == 1)
    {
      controlador1.guardarD();
    }
    if(id == 2)
    {
      controlador2.guardarD();
    }
    if(id == 3)
    {
      controlador3.guardarD();
    }
    if(id == 4)
    {
      controlador4.guardarD();
    }
    if(id == 5)
    {
      controlador5.guardarD();
    }
    if(id == 6)
    {
      controlador6.guardarD();
    }
  }
  
  void opcionaCargarD(int id)
  {
    if(id == 1)
    {
      controlador1.cargarD();
    }
    if(id == 2)
    {
      controlador2.cargarD();
    }
    if(id == 3)
    {
      controlador3.cargarD();
    }
    if(id == 4)
    {
      controlador4.cargarD();
    }
    if(id == 5)
    {
      controlador5.cargarD();
    }
    if(id == 6)
    {
      controlador6.cargarD();
    }
  }
  
  void opcionGuardarE(int id)
  {
    if(id == 1)
    {
      controlador1.guardarE();
    }
    if(id == 2)
    {
      controlador2.guardarE();
    }
    if(id == 3)
    {
      controlador3.guardarE();
    }
    if(id == 4)
    {
      controlador4.guardarE();
    }
    if(id == 5)
    {
      controlador5.guardarE();
    }
    if(id == 6)
    {
      controlador6.guardarE();
    }
  }
  
  void opcionaCargarE(int id)
  {
    if(id == 1)
    {
      controlador1.cargarE();
    }
    if(id == 2)
    {
      controlador2.cargarE();
    }
    if(id == 3)
    {
      controlador3.cargarE();
    }
    if(id == 4)
    {
      controlador4.cargarE();
    }
    if(id == 5)
    {
      controlador5.cargarE();
    }
    if(id == 6)
    {
      controlador6.cargarE();
    }
  }
  
  void opcionGuardarF(int id)
  {
    if(id == 1)
    {
      controlador1.guardarF();
    }
    if(id == 2)
    {
      controlador2.guardarF();
    }
    if(id == 3)
    {
      controlador3.guardarF();
    }
    if(id == 4)
    {
      controlador4.guardarF();
    }
    if(id == 5)
    {
      controlador5.guardarF();
    }
    if(id == 6)
    {
      controlador6.guardarF();
    }
  }
  
  void opcionaCargarF(int id)
  {
    if(id == 1)
    {
      controlador1.cargarF();
    }
    if(id == 2)
    {
      controlador2.cargarF();
    }
    if(id == 3)
    {
      controlador3.cargarF();
    }
    if(id == 4)
    {
      controlador4.cargarF();
    }
    if(id == 5)
    {
      controlador5.cargarF();
    }
    if(id == 6)
    {
      controlador6.cargarF();
    }
  }
  
  void opcionGuardarG(int id)
  {
    if(id == 1)
    {
      controlador1.guardarG();
    }
    if(id == 2)
    {
      controlador2.guardarG();
    }
    if(id == 3)
    {
      controlador3.guardarG();
    }
    if(id == 4)
    {
      controlador4.guardarG();
    }
    if(id == 5)
    {
      controlador5.guardarG();
    }
    if(id == 6)
    {
      controlador6.guardarG();
    }
  }
  
  void opcionaCargarG(int id)
  {
    if(id == 1)
    {
      controlador1.cargarG();
    }
    if(id == 2)
    {
      controlador2.cargarG();
    }
    if(id == 3)
    {
      controlador3.cargarG();
    }
    if(id == 4)
    {
      controlador4.cargarG();
    }
    if(id == 5)
    {
      controlador5.cargarG();
    }
    if(id == 6)
    {
      controlador6.cargarG();
    }
  }
  
  void opcionGuardarH(int id)
  {
    if(id == 1)
    {
      controlador1.guardarH();
    }
    if(id == 2)
    {
      controlador2.guardarH();
    }
    if(id == 3)
    {
      controlador3.guardarH();
    }
    if(id == 4)
    {
      controlador4.guardarH();
    }
    if(id == 5)
    {
      controlador5.guardarH();
    }
    if(id == 6)
    {
      controlador6.guardarH();
    }
  }
  
  void opcionaCargarH(int id)
  {
    if(id == 1)
    {
      controlador1.cargarH();
    }
    if(id == 2)
    {
      controlador2.cargarH();
    }
    if(id == 3)
    {
      controlador3.cargarH();
    }
    if(id == 4)
    {
      controlador4.cargarH();
    }
    if(id == 5)
    {
      controlador5.cargarH();
    }
    if(id == 6)
    {
      controlador6.cargarH();
    }
  }
  
  void opcionGuardarI(int id)
  {
    if(id == 1)
    {
      controlador1.guardarI();
    }
    if(id == 2)
    {
      controlador2.guardarI();
    }
    if(id == 3)
    {
      controlador3.guardarI();
    }
    if(id == 4)
    {
      controlador4.guardarI();
    }
    if(id == 5)
    {
      controlador5.guardarI();
    }
    if(id == 6)
    {
      controlador6.guardarI();
    }
  }
  
  void opcionaCargarI(int id)
  {
    if(id == 1)
    {
      controlador1.cargarI();
    }
    if(id == 2)
    {
      controlador2.cargarI();
    }
    if(id == 3)
    {
      controlador3.cargarI();
    }
    if(id == 4)
    {
      controlador4.cargarI();
    }
    if(id == 5)
    {
      controlador5.cargarI();
    }
    if(id == 6)
    {
      controlador6.cargarI();
    }
  }
  
  void opcionGuardarJ(int id)
  {
    if(id == 1)
    {
      controlador1.guardarJ();
    }
    if(id == 2)
    {
      controlador2.guardarJ();
    }
    if(id == 3)
    {
      controlador3.guardarJ();
    }
    if(id == 4)
    {
      controlador4.guardarJ();
    }
    if(id == 5)
    {
      controlador5.guardarJ();
    }
    if(id == 6)
    {
      controlador6.guardarJ();
    }
  }
  
  void opcionaCargarJ(int id)
  {
    if(id == 1)
    {
      controlador1.cargarJ();
    }
    if(id == 2)
    {
      controlador2.cargarJ();
    }
    if(id == 3)
    {
      controlador3.cargarJ();
    }
    if(id == 4)
    {
      controlador4.cargarJ();
    }
    if(id == 5)
    {
      controlador5.cargarJ();
    }
    if(id == 6)
    {
      controlador6.cargarJ();
    }
  }
}
