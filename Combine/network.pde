class brain
{

double[][] weight1;
double[][] weight2;
int[] dist;
double[] hidden;
double[] deci;

brain()
{
  dist = new int[4];
  weight1 = new double[3][4];
  hidden = new double[3];
  weight2 = new double[4][3];
  deci = new double[4];
}


void readdis(int[] X)
{
dist[0]=X[0];
dist[1]=X[1];
dist[2]=X[2];
dist[3]=X[3];
}

void weightcalc()
{

  for( int i=0;i<3;i++)
  for(int j=0;j<4;j++)
 { 
   
   weight1[i][j]=(double)random(-1,1)/1000;// random(0.0367);//0.0367  
   weight2[j][i]= (double)random(-1,1)/1000;// random(0.052);//0.052 
  }

}

void change1(int i,int j)
{
weight1[i][j] = (double)random(-1,1)/1000;
}

void change2(int i,int j)
{
weight2[i][j] = (double)random(-1,1)/1000;
}


void decide()
{
  double[] sum=new double[3],sum2 = new double[4];
  for(int i=0;i<3;i++)
  {sum[i]=0;
  for(int k=0;k<4;k++)
  sum[i]+=weight1[i][k]*dist[k];
  
hidden[i]=sum[i];// yet to b decided YTB
/*
fill(0);
text("deci"+i+"  "+deci[i],70,70+i*30);
*/}
  
  for(int i=0;i<4;i++)
  {sum2[i]=0;
   for(int k=0;k<3;k++)
   sum2[i]+=weight2[i][k]*hidden[k];
   
   deci[i]=sum2[i];//yet to be decided YTB
    
  }
  
}
  
  
  

}
