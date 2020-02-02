class doto
{
 brain B;
  float fitness;//tobdouble
  float t;//fitness factors
 int pos[];
 boolean life;
 boolean suc;
 int x,y;
 int nopathc;
 int fcolor;

 
 doto(int sx,int sy)
 {t=0;

 B =new brain();
 suc = false;
 life = true;
 x= sx;//(int)random(200,700);
 y= sy;//(int)random(50,650);
pos = new int[4];//+x,+y,-x,-y ditance sence
fcolor=255;//#ff0000 ;
nopathc = 0;//blak
//to initlaix=ze path c
B.weightcalc();
fitness = 0;

 }
 
 float cfit(int tx,int ty)
 {
  
    if(suc)
   {   
    fitness = 30000/t +1;//time let it be relative to the best time , change the 30k
   }
   else if(life)
   {
    fitness = 30000/t + 1/dist(tx,ty,x,y) ; 
   }
   
return(fitness);
 }
 
 void dplot()
 {  
  
   if(life)
   {
  stroke(0);
 
  fill(fcolor);  
    ellipse(x,y,5,5);}
else if(suc)
{ stroke(0);
 fill(#ff0000);  
   ellipse(x,y,5,5);

}

 //println("x:"+x+"  y:"+y);
 }

  void think()
  { 
    long[] C = new long[4];
    long[] D = new  long[4];
    int j=0;
    C[0] = get(x+7,y);D[0] = get(x+6,y);
    C[1] = get(x,y+7);D[1] = get(x,y+6); 
    C[2] = get(x-7,y);D[2] = get(x-6,y);
    C[3] = get(x,y-7);D[3] = get(x,y-6);
    
    
    for(int i=0;i<4;i++)
    if(C[i] == color(nopathc) && D[i] == color(nopathc))
    j++;
   if(x>420 && y<400 && y>350)
   {
    suc = true;
    life = false;
   }
    

    if(j>0)
    life = false ;//dead
    
    
    
    
    if(life)
    {
    t = millis();
    
    pos[0]=abs(get(x+7,y)-get(x+6,y)/16777215);
    pos[1]=abs(get(x,y+7)-get(x,y+6)/16777215);
    pos[2]=abs(get(x-7,y)-get(x-6,y)/16777215);
    pos[3]=abs(get(x,y-7)-get(x,y-6)/16777215);
    
    B.readdis(pos);
    B.decide();
    }
}
  
 
 
 void move()
 { 
   if(life)
  { int j=0,i;
  double m;
  m=B.deci[0];
   
   for(i=1;i<4;i++)
   if(m<B.deci[i])
   {m=B.deci[i];j=i;}
   
   
  if(x>=1000||x<=0||y<=0||y>=700)
   {x=500;//(int)random(1000);
    y=350;//(int)random(700);
  }
   
   switch(j)
   {
     case 0:{y=y-2;break;}
     case 1:{y=y+2;break;}
     case 2:{x=x+2;break;}
     case 3:{x=x-2;break;}
   //  default:
   }
   
  }
 }
 
};
