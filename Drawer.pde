void drawer(Astronaut a)
{
  //logo
  imageMode(CORNER);
  
    image(bg,0,0,width, height);
  imageMode(CENTER);  
//  image(logo,width/2,height*0.06,width*0.66, height*0.33);

  //Astronaut Name
  textSize(width*0.1);
  textAlign(CENTER, CENTER);
  text(a.getName(), width*0.50, height*0.35);

  //banner under text from Sensors
  textSize(width*0.1);
  fill(0, 0, 0);
  textAlign(LEFT, CENTER);
  //da vedere
//  image(bannerText, width*0.48, height*0.45, width*0.9, height*0.07);
//  image(bannerText, width*0.48, height*0.53, width*0.9, height*0.07);
//	image(bannerText, width*0.48, height*0.61, width*0.9, height*0.07);
  
  //text from sensors
  text(""+String.format("%.2f", a.getph_saliva()), width*0.68, height*0.45);
  text(""+String.format("%.2f", a.getph_gas()), width*0.68, height*0.53);
  text(""+String.format("%.2f", a.getTemperature())+"°", width*0.68, height*0.61);

  textSize(width*0.09);
  fill(255, 255, 255);
  //textAlign();
  text("Saliva Ph:", width*0.05, height*0.45);  
  //risolvere lunghezza riga, si sovrappone al numero
  text("Gastric Gas Ph:", width*0.05, height*0.53 );

  text("Temperature:", width*0.05, height*0.61 );

  

textFont(mono);

  textSize(width*0.04);
  textAlign(CENTER, CENTER);
  text("Astronaut1", width*0.15, height*0.95 );
  text("Graphs", width*0.48, height*0.95 );
  text("Astronaut2", width*0.85, height*0.95 );
  
    for(Button b:bottoni)
      b.display();
  
  textFont(font);
}

void keyPressed(){
  if(key=='s'||key=='S')
  saveFrame();
}
