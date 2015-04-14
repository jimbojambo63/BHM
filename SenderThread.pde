public class SenderThread implements Runnable {

  public void run()
  {
    
    String urlParameters  = "value="+createJsonToSend().toString();
    println(urlParameters);
    byte[] postData       = urlParameters.getBytes( Charset.forName( "UTF-8" ));
    int    postDataLength = postData.length;
    String request        = "http://thebit.altervista.org/spaceapps/insertValues.php";
    try {
      URL url = new URL(request);
      HttpURLConnection cox= (HttpURLConnection) url.openConnection();  
      cox.setDoOutput( true );
      cox.setDoInput ( true );
      cox.setInstanceFollowRedirects( false );
      cox.setRequestMethod( "POST" );
      cox.setRequestProperty( "Content-Type", "application/x-www-form-urlencoded"); 
      cox.setRequestProperty( "charset", "utf-8");
      cox.setRequestProperty( "Content-Length", Integer.toString( postDataLength ));
      cox.setUseCaches( false );
      DataOutputStream wr = new DataOutputStream( cox.getOutputStream());
      try  {
        wr.write( postData );
        wr.close();
        println("tutto ok");
        println(cox.getResponseCode());
      }
      
    catch(Exception e)
    {
      println("problema1");
    }
    }
    catch(Exception e)
    {
      println("problema2");
    }
    
  }
  
}

