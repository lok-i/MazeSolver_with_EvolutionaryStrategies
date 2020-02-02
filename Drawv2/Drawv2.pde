

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
