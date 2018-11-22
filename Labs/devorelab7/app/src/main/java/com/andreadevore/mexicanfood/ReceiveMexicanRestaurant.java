package com.andreadevore.mexicanfood;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TextView;

public class ReceiveMexicanRestaurant extends Activity {
    private String mexicanRestaurant;
    private String mexicanRestaurantURL;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_receive_mexican_restaurant);

        //get intent
        Intent intent = getIntent();
        mexicanRestaurant = intent.getStringExtra("mexicanRestaurantName");
        mexicanRestaurantURL = intent.getStringExtra("mexicanRestaurantURL");
        Log.i("shop received", mexicanRestaurant);
        Log.i("url received", mexicanRestaurantURL);

        //update text view
        TextView messageView = findViewById(R.id.textViewResult);
        messageView.setText("You should check out " + mexicanRestaurant);

        //get image button
        Button searchWeb = findViewById(R.id.webButton);

        //create listener
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                loadWebSite(view);
            }
        };

        //add listener to the button
        searchWeb.setOnClickListener(onclick);
    }

    private void loadWebSite(View view){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(mexicanRestaurantURL));
        startActivity(intent);
    }

}
