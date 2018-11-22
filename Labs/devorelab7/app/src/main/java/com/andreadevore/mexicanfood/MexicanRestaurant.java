package com.andreadevore.mexicanfood;

import android.util.Log;

public class MexicanRestaurant {
    private String mexicanRestaurant;
    private String mexicanRestaurantURL;

    private void setMexicanInfo(Integer mexicanExperience) {
        switch (mexicanExperience) {
            case 0: // authentic
                mexicanRestaurant = "La Choza";
                mexicanRestaurantURL = "http://lachozaboulder.com/";
                break;
            case 1: // rooftop bar
                mexicanRestaurant = "Rio";
                mexicanRestaurantURL = "https://riograndemexican.com/locations/boulder/";
                break;
            case 2: // creative
                mexicanRestaurant = "T/aco";
                mexicanRestaurantURL = "https://tacocolorado.com/";
                break;
            case 3: // chain
                mexicanRestaurant = "Cafe Mexicali";
                mexicanRestaurantURL = "https://www.cafemexicali.com/";
                break;
            case 4: // chill
                mexicanRestaurant = "Tahona";
                mexicanRestaurantURL = "http://www.tahonaboulder.com/";
                break;
            default:
                mexicanRestaurant = "none";
                mexicanRestaurantURL = "https://www.google.com/search?q=boulder+mexican+restaurants&oq=boulder+mexican+restaurants&aqs=chrome..69i57j0l5.3871j0j4&sourceid=chrome&ie=UTF-8";
        }
    }

    public void setMexicanRestaurant(Integer mexicanExperience){
        setMexicanInfo(mexicanExperience);
        String mexicanExperienceString = String.valueOf(mexicanExperience);
    }

    public void setMexicanRestaurantURL(Integer mexicanExperience){
        setMexicanInfo(mexicanExperience);
    }

    public String getMexicanRestaurant(){
        return mexicanRestaurant;
    }

    public String getMexicanRestaurantURL(){
        return mexicanRestaurantURL;
    }
}
