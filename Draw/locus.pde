class locus
{
 vert v[];
 
 locus()
 {
 
 v=new vert[25];
 for(int i=0;i<25;i++)
 {
  v[i] = new vert(); 
   
 }
 
 }
 
 void mark(int i)
 {
   ellipse(v[i].x,v[i].y,3,3);
 }
 
 
 vert select()
 {
 vert t =new vert();
 t.x=mouseX;
 t.y=mouseY;
 return t;
}

boolean check(int i)
{

int k=abs(v[i].x-v[i-1].x);
int h=abs(v[i].y-v[i-1].y);

if(h<=2 && k<=2)
 
return true ;
else
return false;


}



 
 
  
  
}
