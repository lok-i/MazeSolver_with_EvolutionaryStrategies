class path
{

 
int[] sj;//mean of the vertex set
int nopathcol; 
int spotst;
boolean trig; //to check wether to continue the dot selecting process
locus p;
int i;//point count


path()
{
  spotst = 0;
  sj = new int[4];
p = new locus();
i=0;
trig =true;
nopathcol =0;

}

int[] drawpath()
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
 fill(255);
  ellipse(sj[0],sj[1],5,5);
}

if(spotst==2)
{fill(255);
 strokeWeight(1);
  ellipse(sj[2],sj[3],5,5);
}


return(sj);
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
   case(0):{sj[0]=mouseX;sj[1]=mouseY;spotst=1;println("Startpoint "+sj[0]+" "+sj[1]);
            break;}
   case(1):{sj[2]=mouseX;sj[3]=mouseY;spotst=2;print("End point "+sj[2]+" "+sj[3]);
            break;}
   }
   

 }
  
}
 
}
