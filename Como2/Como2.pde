

path pa;//path object
doto clone = new doto(0,0,0,0); // the fittest in a gen ....has the weights ,sxtxall same but reruns the path
int pl=1000; // population 
 
 
 boolean start = false;//trigger for a group run
 boolean runf = false ;//triggr for thr fittest run
 
  int it=0;//initialize count , to initialze the weights only once
 
float mr =0.2;//0.02 , mutaion rate

popul p = new popul(pl,mr); 

int[] sj=new int[4];//path variables returned by draw path

void setup()
{

  size(1000,800);
  pa=new path();
  p.init(0,0,0,0);
  p.weightcal();
}



void draw() 
{
//line(0,700,1000,700);

sj = pa.drawpath();


 if(start)
{
       if(it==0)
       {
        p.init(sj[0],sj[1],sj[2],sj[3]); // to give the start and end points
        it=1;}
         
  
        p.action(); // plot,think,move
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
  
 
  if(runf)//to check if fittest needs to run
  {
    if(clone.life)  
  {
   clone.dplot();
   clone.think();  
   clone.move(); 
   delay(10);
  }
  else
  runf = false;
  }
}




void mouseClicked()
{
 pa.pmouseclick(); 
}



void keyPressed()
{
 
 // need to change to switxh case. 
  
  
  
  if(key == 'r')//to start a generation
   start = true;
  
  
  if(key == 's')//to stop a genration anywere in between
  start = false;
  
   if(key =='f')
   {
     runf = true;
     clone =p.runfittest();
     start  = false;
   }

  if(key == 'b')
 {
   p.calf();
   print("\n");
   println("fm:  "+p.fitsum);
   println("nos:  "+p.nos);
   p.newgen();
   start = false;
   
   
 }
  
}
