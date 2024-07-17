public with sharing class ApiController {
    public ApiController() {

    }

    
    
    public static void accuWeather(String city){

        HttpRequest req =new HttpRequest();
        req.setEndpoint('http://dataservice.accuweather.com/locations/v1/cities/search?apikey=hacCsJyi6nDDCIAC143HUOAKVnPbHm6D&q='+city);
        req.setMethod('GET');
        Http http =new Http();
        HttpResponse res=http.send(req);
        AccuWeatherData accObj = AccuWeatherData.parse(res.getBody());
        System.debug(accObj);
        
        
    }
}
