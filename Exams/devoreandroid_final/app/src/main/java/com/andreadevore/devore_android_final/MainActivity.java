package com.andreadevore.devore_android_final;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

public class MainActivity extends Activity {
    String suggestedRestaurant = "";
    boolean glutenFree;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void buildPizza(View view) {
        // toggle button to determine sauce type
        ToggleButton selectSauce = findViewById(R.id.sauceToggle);
        boolean redSauce = selectSauce.isChecked();
        String sauceValue;

        // spinner to select size
        Spinner selectSize = findViewById(R.id.sizeSpinner);
        String sizeValue = String.valueOf(selectSize.getSelectedItem());

        // radio group to choose crust
        RadioGroup selectCrust = findViewById(R.id.radioGroup);
        int crustID = selectCrust.getCheckedRadioButtonId();
        String crustValue;

        // name my pizza
        EditText name = findViewById(R.id.pizzaName);
        String nameValue = name.getText().toString();

        // switch to check for gluten-free
        Switch selectGluten = findViewById(R.id.switchGluten);
        glutenFree = selectGluten.isChecked();
        String glutenValue;

        // content to be filled
        TextView fillContent = findViewById(R.id.pizzaDescription);

        if (nameValue.matches("")){
            fillContent.setText("");
            // toast
            Context context = getApplicationContext();
            CharSequence text = "Please name your pizza!";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
        } else {
            // description only show if user named pizza

            // set sauce value
            if (redSauce) {
                sauceValue = "red";
            } else {
                sauceValue = "white";
            }

            if (glutenFree) {
                glutenValue = "gluten-free";
                suggestedRestaurant = "Boss Lady";
            } else {
                glutenValue = "regular";
            }

            // set crust value
            if (crustID == R.id.radioButton1) {
                crustValue = "thin";
                suggestedRestaurant = "Pizzeria Locale";
            } else if (crustID == R.id.radioButton2)  {
                crustValue = "thick";
                suggestedRestaurant = "Backcountry Pizza";
            } else {
                crustValue = "";
                suggestedRestaurant = "Boss Lady";
            }
            fillContent.setText("The " + nameValue + " is a " + sizeValue + " " + glutenValue + " " + crustValue + " pizza with " + sauceValue + " sauce.");
        }
    }

    public void findFood(View view){
        if (suggestedRestaurant.matches("")) {
            // toast
            Context context = getApplicationContext();
            CharSequence text = "Please create your pizza first!";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
        } else {
            if (glutenFree) {
                // check if gluten free selected
                suggestedRestaurant = "Boss Lady";
            }
            Intent intent = new Intent(this, selectRestaurant.class);
            intent.putExtra("restaurant", suggestedRestaurant);
            startActivity(intent);
        }
    }
}
