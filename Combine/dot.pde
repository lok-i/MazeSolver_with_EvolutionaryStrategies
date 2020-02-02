class doto
{
 brain B;
  float fitness;//tobdouble
  float t;//fitness factors
 int pos[];
 boolean life;
 boolean suc;
 int x,y,tx,ty,sx,sy;
 int nopathc;
 int fcolor;

 
 doto(int xs,int ys,int xt,int yt)
 {t=0;
tx=xt;
ty=yt;
 B =new brain();
 suc = false;
 life = true;
 sx=xs;
 sy=ys;
 x= xs;//(int)random(200,700);
 y= ys;//(int)random(50,650);
pos = new int[4];//+x,+y,-x,-y ditance sence
fcolor=255;//#ff0000 ;
nopathc = 0;//blak
//to initlaix=ze path c
B.weightcalc();
fitness = 0;

 }
 
 float cfit()
 {
  
    if(suc)
   {   
    fitness = 30000/t +1;//time let it be relative to the best time , change the 30k and functions needs to be worke on YTD
    
   }
   else //if(life)
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
   if(dist(tx,ty,x,y)<30)
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
   

   
   switch(j)
   {
     case 0:{y=y-2;break;}
     case 1:{y=y+2;break;}
     case 2:{x=x+2;break;}
     case 3:{x=x-2;break;}
  
   }
   
  }
 }
 

void mutate(float mr)
{
 
    for(int i=0;i<3;i++)
     for(int j=0;j<4;j++)
    { if(random(1)<mr)
       B.change1(i,j);
      if(random(1)<mr)
       B.change2(j,i);
     }

}
}
