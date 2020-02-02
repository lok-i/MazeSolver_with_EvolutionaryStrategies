class popul
{
 int pl;
 doto[] sp;
 float fitsum;
 float mr; 
  
  popul(int p,float m)
  {
    pl=p;
    mr =m;
    sp = new doto[p]; 
    fitsum=0; 
}
  
 void init(int x,int y,int z,int a)
 {
    for(int i=0;i<pl;i++)
    sp[i]=new doto(x,y,z,a);   
 }
  
  void weightcal()
  {
    for(int i=0;i<pl;i++)
     sp[i].B.weightcalc();
    
  }
  
  
  
  
  void action()
  {
    
              for(int i=0;i<pl;i++)
             {
              sp[i].dplot();
              sp[i].think();
              sp[i].move();
            }
    
    
  }




void calf()
{
  
 for(int i=0;i<pl;i++)
  fitsum+=sp[i].cfit(); 
}


void newgen()
{
   float r = random(fitsum); 
  float runsum=0;
  for(int i=0;i<pl;i++)
    { 
      if(!sp[i].suc)
   {   sp[i].x=sp[i].sx;sp[i].y=sp[i].sy;
      sp[i].life = true; 
      runsum+= sp[i].fitness;
    if(runsum>r)//hoping to select the week dna's
    sp[i].mutate(mr);  
   }  
  }
  
  
  
}





}
