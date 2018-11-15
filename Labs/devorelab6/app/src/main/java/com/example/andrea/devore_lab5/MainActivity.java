package com.example.andrea.devore_lab5;

import android.content.Context;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    public void createCard(View view) {
        // toggle button
        ToggleButton toggle = findViewById(R.id.toggleButton);
        boolean location = toggle.isChecked();

        // spinner
        Spinner selectImage = findViewById(R.id.spinner);
        String imageType = String.valueOf(selectImage.getSelectedItem());

        // image
        ImageView image = findViewById(R.id.imageView);

        // holiday radio group
        RadioGroup holiday = findViewById(R.id.radioGroup);
        int holiday_id = holiday.getCheckedRadioButtonId();

        // message
        TextView fillContent = findViewById(R.id.message);
        EditText name = findViewById(R.id.editText);
        String nameValue;
        String holidayValue;

        // check if text on
        if (location) {
            // checks if radio selected
            if (holiday_id == -1) {
                //toast
                Context context = getApplicationContext();
                CharSequence text = "Please select holiday message.";
                int duration = Toast.LENGTH_SHORT;
                Toast toast = Toast.makeText(context, text, duration);
                toast.show();
            }
            // show text

                // get name input

            nameValue = name.getText().toString();

            // check which radio button
            if (holiday_id == R.id.radioButton1) {
                holidayValue = "Merry Christmas";
                fillContent.setText(holidayValue + " " + nameValue + "!");
            } else if ((holiday_id == R.id.radioButton2)) {
                holidayValue = "Happy Holidays";
                fillContent.setText(holidayValue + " " + nameValue + "!");
            } else {
                fillContent.setText("");
            }
        }
        else {
            fillContent.setText("");
        }

        // choose and place image
        switch (imageType) {
            case "Bells":
                image.setImageResource(R.drawable.bells);
                break;
            case "Ornament":
                image.setImageResource(R.drawable.ornament);
                break;
            case "Snowflakes":
                image.setImageResource(R.drawable.snow);
                break;
            default:
                image.setImageResource(R.drawable.snow);
        }
    }
}
