package com.andreadevore.devore_android_final;

import android.app.Activity;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class selectRestaurant extends Activity {
    private String restaurant;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_select_restaurant);

        //get intent
        Intent intent = getIntent();
        restaurant = intent.getStringExtra("restaurant");

        TextView messageView = findViewById(R.id.suggestion);
        messageView.setText("You should check out " + restaurant);
    }
}
