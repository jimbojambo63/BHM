/**
**/

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.ArrayList;
import java.lang.reflect.Method;
import java.lang.Runnable;
import java.net.*;
import java.io.*;
import java.nio.charset.Charset;



ExecutorService pool;
boolean invio=true;
int stoptime=0;
int index=0;
boolean mainMouse=false;
int indexButton=0;
boolean ricevi=true;
int stoptimeRicevi=0;


PImage bg;
PImage logo;
PImage astronaut;
PImage bannerText;
PImage graphs;

PFont font;
PFont mono;
ArrayList <Button> bottoni;
ArrayList<Astronaut> astronauts;
void setup()
{
  mono = loadFont("AndaleMono-48.vlw");
  font =loadFont("CaviarDreams-48.vlw");
  textFont(font);
  bg = loadImage("bg.png");
  logo=loadImage("logo.png");
  graphs = loadImage("graphs.png");
  astronaut = loadImage("astronaut.png");
  bannerText = loadImage("banner.png");
  //size(350, 600);

  bottoni=new ArrayList<Button>(); 
  //button for changing theire vertical position
  bottoni.add(new Button(0, width*0.15, height*0.89, astronaut, height*0.094));
  bottoni.add(new Button(1, width*0.85, height*0.89, astronaut, height*0.094));
  bottoni.add(new Button(2, width*0.48, height*0.89, graphs, height*0.094));
  //bottoni.add(new Button(2,));



  astronauts = new ArrayList();
  astronauts.add(new Astronaut("Parmitano", 1));
  astronauts.add(new Astronaut("Cristoforetti", 2));
  pool=Executors.newFixedThreadPool(6);

  for (Astronaut a : astronauts)
  {
    a.FromSensors();
    println(a);
  }
  // println(createJsonToSend());
  pool.submit(new SenderThread());
  //pool.submit(new ReceiveThread());
  stoptime=millis()+5000;
}


void draw()
{
  //println(a.getTemperature());
  drawer(astronauts.get(index));
  for (int i=0; i<bottoni.size (); i++)
    if (bottoni.get(i).mousePressed())
    {  
      mainMouse=true;
      indexButton=i;
    }

  if (stoptime<millis())
  {
    for (Astronaut a : astronauts)
    {
      a.FromSensors();
    }
    pool.submit(new SenderThread());
    stoptime=millis()+5000;
  }
}

void mouseReleased()
{
  if (mainMouse == true)
    if (bottoni.get(indexButton).mouseOverIt())
      bottoni.get(indexButton).effettoBottoni(indexButton);
  mainMouse=false;
}




JSONObject createJsonToSend()
{
  JSONArray values = new JSONArray();
  JSONObject json = new JSONObject();
  int i= 0;
  for (Astronaut a : astronauts)
  {
    values.setJSONObject(i, a.createJsonObj());
    i++;
  }

  json = new JSONObject();
  json.setJSONArray("astronauts", values);
  return json;
}

Astronaut getAstronautFromID(int id)
{
  return astronauts.get(id-1);
}

