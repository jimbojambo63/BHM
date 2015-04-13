public class ReceiveThread implements Runnable {

  public void run()
  {
    try {
      /*
      Socket socket = new Socket("192.168.1.68", 31946);
      InputStream in = socket.getInputStream();
      StringBuilder stringaJson = new StringBuilder();
      InputStreamReader reader = new InputStreamReader(in, "ASCII");
      for (int c = reader.read (); c != -1; c = reader.read()) {
        stringaJson.append((char) c);
      }
      println(stringaJson);
      
      String blabla= stringaJson.toString();
      */
      
      
      
      String lines[] = loadStrings("http://thebit.altervista.org/spaceapps/getValues.php?id_astronauta=2");
      for(String s : lines)
      {
           println(s);
      }
      JSONObject json = JSONObject.parse(lines[0]);
      JSONArray listaJson= json.getJSONArray("astronauts");
      for (int i=0; i<listaJson.size (); i++)
      {
        JSONObject j = listaJson.getJSONObject(i);
        Astronaut a = getAstronautFromID(j.getInt("id"));
        a.setph_saliva(j.getFloat("ph_saliva"));
        a.setTemperature(j.getFloat("temperature"));
        a.setph_gas(j.getFloat("ph_gas"));
      }
      //socket.close();
    }
    catch(Exception e)
    {
      println("asdhhh");
    }
  }
}

