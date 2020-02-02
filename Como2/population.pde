class popul
{
 int pl;
 doto[] sp;
 float fitsum;
 long nos;
 float mr; 
  
  popul(int p,float m)
  { nos =0;
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
    nos =0;
              for(int i=0;i<pl;i++)
             {
                if(sp[i].suc)
                nos++;
            
                sp[i].dplot();
                sp[i].think();
                 sp[i].move();
               
                
              
              
            }
   
       
    
    
    
    
  }




void calf()
{
  fitsum=0;
 for(int i=0;i<pl;i++)
  fitsum+=sp[i].cfit(); 
}



doto selp(int spn)
{
   float r = random(fitsum); 
  float runsum=0;
  for(int i=0;i<pl;i++)
    { 
      runsum+= sp[i].fitness;
    
    if(runsum>r)//hoping to select the week dna's
    return(sp[i]);
   }  
   
  return(this.sp[spn]);
}




  
  
 void newgen()
{
 for(int i=0;i<pl;i++)
 {
  if(!sp[i].suc) 
  { sp[i].x=sp[i].sx;sp[i].y=sp[i].sy;sp[i].life=true;
  sp[i].cpy(selp(i));
  sp[i].mutate(mr);
  } 
}
}
   doto runfittest()
   { 
     float m = 0;
     int j=0;
     this.calf();
     for(int i=0;i<pl;i++) 
     { if(m<sp[i].fitness)
       {j=i;m=sp[i].fitness;}
     }
     doto clone = new doto(sp[j].sx,sp[j].sy,sp[j].tx,sp[j].ty);
     clone.cpy(sp[j]);
     
     println("max Fitness :"+m);
 return(clone);
 
 
 }
   
  
   
   
   
 
 
 }//class end
