package com.andreadevore.mexicanfood;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Spinner;

public class FindMexicanFoodActivity extends Activity {
    private MexicanRestaurant myMexicanRestaurant = new MexicanRestaurant();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_find_mexican_food);

        //get button
        Button button = findViewById(R.id.button);
        //create listener
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                findExperience(view);
            }
        };
        //add listener to the button
        button.setOnClickListener(onclick);
    }

    private void findExperience(View view){
        //get spinner
        Spinner experienceSpinner = findViewById(R.id.spinner);
        //get spinner item array position
        Integer experience = experienceSpinner.getSelectedItemPosition();

        //set the coffee shop
        myMexicanRestaurant.setMexicanRestaurant(experience);
        //get suggested coffee shop
        String suggestedMexicanRestaurant = myMexicanRestaurant.getMexicanRestaurant();
        //get URL of suggested coffee shop
        String suggestedMexicanRestaurantURL = myMexicanRestaurant.getMexicanRestaurantURL();
        Log.i("shop", suggestedMexicanRestaurant);
        Log.i("url", suggestedMexicanRestaurantURL);

        //create an Intent
        Intent intent = new Intent(this, ReceiveMexicanRestaurant.class);

        //pass data
        intent.putExtra("mexicanRestaurantName", suggestedMexicanRestaurant);
        intent.putExtra("mexicanRestaurantURL", suggestedMexicanRestaurantURL);

        //start intent
        startActivity(intent);
    }
}
