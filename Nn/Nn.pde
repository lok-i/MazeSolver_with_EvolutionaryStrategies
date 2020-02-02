 

 int pl=1000;
 boolean stop = false ;
float[] fc = new float[pl];
int[] times = new int[pl];

doto[] p=new doto[pl];
int stx=40,sty=230,tx=420,ty=375;//path dependent
///doto p;



void setup()
{ 
  size(1000,700);


for(int i=0;i<pl;i++)
{
  p[i]=new doto(stx,sty);
  
  
 }

for(int i=0;i<pl;i++)
p[i].B.weightcalc();
}

void draw()
{
background(0);


if(!stop)
{


stroke(255);
rect(30,200,220,50);
rect(220,200,50,200);
rect(220,350,200,50);
rect(420,350,20,50);
 
//rect(370,150,50,200);

/*
stroke(255);
fill(255);
ellipse(500,350,600,600);
stroke(0);
fill(0);
ellipse(500,350,400,400);

*/


//ellipse(500,350,600,600);

for(int i=0;i<pl;i++)
{
  p[i].dplot();
  p[i].think();
  p[i].move();
 

}
 delay(50);

}

else
{
  for(int i=0;i<pl;i++)
  {
   fc[i] = p[i].cfit(tx,ty); 
   
 }
  
fc=sort(fc);
fc=reverse(fc);
background(255);
for(int i=0;i<10;i++)
  {
  
  textSize(30);
  fill(0);
  text("Score"+(i+1)+" "+fc[i],50,50*(i+1));
  
 }

}
}

void keyPressed()
{
if(key == 's')
stop = true;
  
}
