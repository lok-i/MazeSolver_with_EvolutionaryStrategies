class path
{

  
float cx,cy;//mean of the vertex set
int nopathcol,pathcol;  
boolean trig; //to check wether to continue the dot selecting process
locus p;
int i,j;//point count


path()
{
p = new locus();
i=0;j=0;
trig =true;
nopathcol =0;
pathcol=255;
}

void drawpath()
{


if(i>=1)
  {
    p.mark(i-1);
  }
  
 if(j>=2)
  if(p.check(i-1))
 {
   background(nopathcol);
   
   stroke(pathcol);
   
   cx=0;cy=0;
  fill(pathcol);
 beginShape();//for original outline path
for(int u=0;u<i;u++)
{
  vertex(p.v[u].x,p.v[u].y);
  cx+=p.v[u].x;
  cy+=p.v[u].y;}
  
endShape();

cx=cx/i;
cy=cy/i;

fill(nopathcol);

beginShape(); //the secondary outline;
float xi,yi,m=5,n=1;//m should be >n
for(int u=0;u<i;u++)
{
xi=(m*p.v[u].x + n*cx)/(m+n);
yi=(m*p.v[u].y + n*cy)/(m+n);

vertex(xi,yi);
 }
 
endShape();


ellipse(cx,cy,5,5);
trig=false;
 
 }
}
 
 
void pmouseclick() 
{ if(trig)
 { p.v[i]=p.select();
  print(p.v[i].x);
  print("\t1");
  print(p.v[i].y);
   print("\n");
   
  i++;j++;
} 
 
 
 }
 
}
