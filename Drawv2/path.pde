class path
{

 
float ex,ey,sx,sy;//mean of the vertex set
int nopathcol; 
int spotst;
boolean trig; //to check wether to continue the dot selecting process
locus p;
int i;//point count


path()
{
  spotst = 0;
  ex=0;ey=0;
p = new locus();
i=0;
trig =true;
nopathcol =0;

}

void drawpath()
{
  if(i>=1&&trig)
  {
    p.mark(i-1);
  }
  
if(i>=2)//this is because it shuld start cheking only after aleast 2 pts have been selected else will be an error
  if(p.check(i-1))
 { trig = false ;
  
   
   background(255);

  
   stroke(nopathcol);
   strokeWeight(5);  
   
   for(int u=0;u<i-1;u++)
   {
    line(p.v[u].x,p.v[u].y,p.v[u+1].x,p.v[u+1].y); 
   }
   line(p.v[0].x,p.v[0].y,p.v[i-1].x,p.v[i-1].y);
 }
if(spotst >=1)
{stroke(0);
 strokeWeight(1);
  ellipse(sx,sy,5,5);
}

if(spotst==2)
{
 strokeWeight(1);
  ellipse(ex,ey,5,5);
}



}
 
 
void pmouseclick() 
{ if(trig)
 { p.v[i]=p.select();
  print(p.v[i].x);
  print("\t1");
  print(p.v[i].y);
   print("\n");
   
  i++;
} 
 else
 {
   switch(spotst)
   {
   case(2):{break;}
   case(0):{sx=mouseX;sy=mouseY;spotst=1;println("Startpoint "+sx+" "+sy);
            break;}
   case(1):{ex=mouseX;ey=mouseY;spotst=2;print("End point "+ex+" "+ey);
            break;}
   }
   

 }
  
}
 
}
