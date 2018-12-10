package com.andreadevore.chatterbox;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TextView;

public class chooseFortuneActivity extends Activity {
    int countClicks = 0;        // counts num times button pressed
    int fortuneCount = 0;       // tracks total count for numbers selected
    String fortune;         // final selected fortune
    ImageButton imageButtonA;
    ImageButton imageButtonB;
    ImageButton imageButtonC;
    ImageButton imageButtonD;
    TextView text;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_choose_fortune);

        // setup buttons based on UI
        imageButtonA = findViewById(R.id.imageButtonA);
        imageButtonB = findViewById(R.id.imageButtonB);
        imageButtonC = findViewById(R.id.imageButtonC);
        imageButtonD = findViewById(R.id.imageButtonD);
        text = findViewById(R.id.textView);

        // create listener
        View.OnClickListener onclick = new View.OnClickListener() {
            public void onClick(View view) {
                // increment number of times button clicked
                countClicks = countClicks + 1;
                changeScreen(view);
            }
        };

        // setup listener
        imageButtonA.setOnClickListener(onclick);
        imageButtonB.setOnClickListener(onclick);
        imageButtonC.setOnClickListener(onclick);
        imageButtonD.setOnClickListener(onclick);
    }

    private void changeScreen(View view) {
        // CLICK COLOR
        if (countClicks == 1) {
            text.setText("Now pick a number!");

            // check which button pressed
            switch (view.getId()) {
                case R.id.imageButtonA:
                    fortuneCount = 3;
                    break;
                case R.id.imageButtonB:
                    fortuneCount = 5;
                    break;
                case R.id.imageButtonC:
                    fortuneCount = 4;
                    break;
                case R.id.imageButtonD:
                    fortuneCount = 6;
                    break;
                default:
                    Log.i("Choose Fortune", "None");
            }
            // set image resource
            setButton();
        } else if (countClicks == 2) {
            // CLICK NUMBERS 1ST TIME
            text.setText("Last time!");
            if ((fortuneCount % 2) == 0) {
                // even page
                switch (view.getId()) {
                    case R.id.imageButtonA:
                        fortuneCount = fortuneCount + 8;
                        break;
                    case R.id.imageButtonB:
                        fortuneCount = fortuneCount + 3;
                        break;
                    case R.id.imageButtonC:
                        fortuneCount = fortuneCount + 7;
                        break;
                    case R.id.imageButtonD:
                        fortuneCount = fortuneCount + 4;
                        break;
                    default:
                        Log.i("Choose Fortune", "None");
                }
            } else {
                // odd page
                switch (view.getId()) {
                    case R.id.imageButtonA:
                        fortuneCount = fortuneCount + 1;
                        break;
                    case R.id.imageButtonB:
                        fortuneCount = fortuneCount + 2;
                        break;
                    case R.id.imageButtonC:
                        fortuneCount = fortuneCount + 7;
                        break;
                    case R.id.imageButtonD:
                        fortuneCount = fortuneCount + 5;
                        break;
                    default:
                        Log.i("Choose Fortune", "None");
                }
            }
            // set image resource
            setButton();
        } else {
            // CLICK NUMBERS 2ND TIME
            text.setText("Last time!");
            if ((fortuneCount % 2) == 0) {
                // even page
                switch (view.getId()) {
                    case R.id.imageButtonA:
                        fortune = "Most likely";
                        break;
                    case R.id.imageButtonB:
                        fortune = "Try again!";
                        break;
                    case R.id.imageButtonC:
                        fortune = "You must be joking!";
                        break;
                    case R.id.imageButtonD:
                        fortune = "Definitely not!";
                        break;
                    default:
                        fortune = "Try again!";
                }
            } else {
                // odd page
                switch (view.getId()) {
                    case R.id.imageButtonA:
                        fortune = "Better luck next time.";
                        break;
                    case R.id.imageButtonB:
                        fortune = "Good luck!";
                        break;
                    case R.id.imageButtonC:
                        fortune = "The odds are in your favor.";
                        break;
                    case R.id.imageButtonD:
                        fortune = "Good things come to those who wait.";
                        break;
                    default:
                        fortune = "Try again!";
                }
            }

            // GO TO NEW ACTIVITY
            // create a new intent
            Intent intent = new Intent(this, tellFortuneActivity.class);

            // pass data
            intent.putExtra("fortune", fortune);

            // start the activity
            startActivityForResult(intent, 1);
        }
    }

    private void setButton () {
        // change image button based on modulo of fortune count
        if ((fortuneCount % 2) == 0) {
            // even page
            Log.i("Choose Fortune", "Even");
            imageButtonA.setImageResource(R.drawable.eight_3a);
            imageButtonB.setImageResource(R.drawable.three_3b);
            imageButtonC.setImageResource(R.drawable.seven_3c);
            imageButtonD.setImageResource(R.drawable.four_3d);
        } else {
            // odd page
            Log.i("Choose Fortune", "Odd");
            imageButtonA.setImageResource(R.drawable.one_2a);
            imageButtonB.setImageResource(R.drawable.two_2b);
            imageButtonC.setImageResource(R.drawable.seven_3c);
            imageButtonD.setImageResource(R.drawable.five_2d);
        }
    }

    // found code from https://stackoverflow.com/questions/9664108/how-to-finish-parent-activity-from-child-activity
    // ends activity before restarting
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == 1) {
            if (resultCode == RESULT_OK) {
                this.finish();
            }
        }
    }
}
