/*
5/12/18
The below model is working in designing several paths were the data set is scatteres and discrete,
on the other hand wen the data set has the tendency to fluctuate or so as to oscillate the inner 
polygon tends to inter fere the outer (also) wen the average of the data set lies outside the polygon enclosing it this error occurs*/

// PATH FINISHED WHEN DOBLE CLICKED ON THE SAME A POINT

path p;//path object



void setup()
{
  size(1000,700);
 p=new path();
 
}



void draw() {
p.drawpath();
  
}


void mouseClicked()
{
 p.pmouseclick(); 
  
  
}
