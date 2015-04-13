public class Astronaut
{
  private int idAstro;
  private float temperature=0;
  private String name;
  private boolean robaDaInviare=false;
  //ph_med ph_max e ph_min only for noise value generator
  private static final float PH_MAX=8;
  private static final float PH_MIN=4.5;
  private static final float PH_MED=6.5;
  private static final float maxTemp=39.5;
  private static final float minTemp=35.5;
  
  private float noiseInc0=random(5);
  private float noiseInc1=random(7);
  private float noiseInc2=random(9);
  private float noiseTemperature=random(77);
  private float ph_saliva=0; //Pressione
  private float ph_gas=0;
  private float ph_measured2=0;
  public Astronaut(String name, int idAstro)
  {
    this.name=name;
    this.idAstro=idAstro;
  }

  public float getTemperature()
  {
    return temperature;
  }

  public void setTemperature(float temperature)
  {
    this.temperature = temperature;
  }

  //this should read value from sensors and set the Astronaut state,
  //instead it randomize any value
  public void FromSensors() {
    this.noiseInc0+=0.01;
    this.noiseInc1+=0.01;
    this.noiseInc2+=0.01;
    noiseTemperature+=0.01;

    setph_saliva(PH_MIN+noise(noiseInc0)*(PH_MAX-PH_MIN));
    setph_gas(0+noise(noiseInc1)*(4));
    setPh_measured2(PH_MIN+noise(noiseInc2)*(PH_MAX-PH_MIN));
    setTemperature(minTemp+noise(noiseTemperature)*(maxTemp-minTemp));

  }

  public void setph_saliva(float ph) {
    this.ph_saliva=ph;
  }

  public void setph_gas(float ph) {
    this.ph_gas=ph;
  }

  public void setPh_measured2(float ph) {
    this.ph_measured2=ph;
  }
  
  @Override
  public String toString()
  {
      return ""+temperature+";"+ph_saliva+";"+ph_gas;
  }
  
  public JSONObject createJsonObj(){
    JSONObject json=new JSONObject();
    
    json.setInt("id",idAstro);
    json.setDouble("ph_saliva",Double.parseDouble(String.format("%.2f", ph_saliva).replace(",",".")));
    json.setDouble("ph_gas",Double.parseDouble(String.format("%.2f", ph_gas).replace(",",".")));
    json.setDouble("temperature",Double.parseDouble(String.format("%.2f", temperature).replace(",",".")));
    return json;
  }
  
    public float getph_saliva(){
    return ph_saliva;
  }
  
  public String getName()
  {
      return name;
  }
  
    public float getph_gas()
  {
    return ph_gas;
  }
  
  
}

