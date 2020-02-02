

path pa;//path object

int pl=1000;
boolean start = false;
 boolean stop = false ;
int it=0;
float mr =0.2;
float[] fc = new float[pl];


popul p = new popul(pl,mr);
int[] sj=new int[4];//path dependent


void setup()
{

  size(1000,800);
 pa=new path();
p.init(0,0,0,0);
p.weightcal();

 
}



void draw() {
line(0,700,1000,700);

sj = pa.drawpath();


 if(start)
{
       if(it==0)
       {
         
            p.init(sj[0],sj[1],sj[2],sj[3]);
       it=1;}
         
  
             if(!stop)
            {p.action();
             delay(10);
             }

          else
        {
         /*
         fc=sort(fc);
         fc=reverse(fc);
         background(255);
         for(int i=0;i<10;i++)
         {
  
          textSize(30);
          fill(0);
          text("Score"+(i+1)+" "+fc[i],50,50*(i+1));}
        */}
  
}

}


void mouseClicked()
{
 pa.pmouseclick(); 
  
  
}



void keyPressed()
{
   if(key == 'r')
   start = true;
  
  
  if(key == 's')
stop = true;

if(key == 'b')
 {p.calf();
   p.newgen();
   start = false;
   stop = false;
   
 }
  
}
