class doto
{
 brain B;
 float fitness,dt,ta;//tobdouble
 int pos[];//inputs for the input layer
 boolean life;//life check
 boolean suc; // sucess check
 int x,y,tx,ty,sx,sy,px,py;
 boolean altread;
 int nopathc;
 int fcolor;
 
 
 doto(int xs,int ys,int xt,int yt)
 { altread = false;
   dt = 0;
   ta = 0;
   tx=xt;
   ty=yt;
   px= 0;
   py=0;
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
   
B.weightcalc();

fitness = 0;
}
 
 float cfit()
 {
   
    if(suc)
   {   
    fitness = 100 + 1000*dt/ta;//time let it be relative to the best time , change the 30k and functions needs to be worke on YTD
    
   }
   else //if(life)
   {
    fitness = 100/dist(tx,ty,x,y) +1000*dt/ta ; 
   }
   
return(fitness);
 }
 
 void dplot()
 {  
  
   if(life)
   {
    stroke(0);
    fill(fcolor);  
    ellipse(x,y,5,5);
    ta = millis(); }
    
else if(suc)
{ /*stroke(0);
 fill(#ff0000);  
   ellipse(x,y,5,5);
*/
}

 
 }

  void think()
  { 
    
    if(life)
  {  long[] C = new long[4];
     long[] D = new  long[4];
     int j=0;
    
    C[0] = get(x+7,y);D[0] = get(x+6,y);
    C[1] = get(x,y+7);D[1] = get(x,y+6); 
    C[2] = get(x-7,y);D[2] = get(x-6,y);
    C[3] = get(x,y-7);D[3] = get(x,y-6);
    
    
    for(int i=0;i<4;i++)
    if(C[i] == color(nopathc) && D[i] == color(nopathc))
    j=1;
    
   if(dist(tx,ty,x,y)<30)
   { 
    suc = true;
    life = false;
   }
    

    if(j==1)
    life = false ;
   
   if(life)
    {pos[0]=abs(get(x+7,y)-get(x+6,y)/16777215);
    pos[1]=abs(get(x,y+7)-get(x,y+6)/16777215);
    pos[2]=abs(get(x-7,y)-get(x-6,y)/16777215);
    pos[3]=abs(get(x,y-7)-get(x,y-6)/16777215);
    
    B.readdis(pos);
    B.decide();}
     
  } 
  

} 
    

  
 
 
 void move()
 { 
   if(life)
  { 
    int j=0,i;
    double m;
    m=B.deci[0];
   
   for(i=1;i<4;i++)
   if(m<B.deci[i])
   {m=B.deci[i];j=i;}
   /* 
    if(px == x && py ==y)
    life = false;
    */
      if(altread)
      {px = x;
       py = y;
       altread = false;}
       else 
       altread = true;
  
   int e =x,f=y;
   
   switch(j)
   {
     case 0:{y=y-2;break;}
     case 1:{y=y+2;break;}
     case 2:{x=x+2;break;}
     case 3:{x=x-2;break;}
  
   }
   
dt+=dist(e,f,x,y);  

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

void cpy(doto d)//jzt copies the weights
{
  
 for(int i=0;i<3;i++)
 for(int j=0;j<4;j++)
 {
 this.B.weight1[i][j] = d.B.weight1[i][j];   
  this.B.weight2[j][i] = d.B.weight2[j][i]; 
 }
  
  
  
}


}
