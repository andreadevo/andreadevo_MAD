package com.andreadevore.chatterbox;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TextView;

import org.w3c.dom.Text;

public class tellFortuneActivity extends Activity {
    private String fortune;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tell_fortune);

        Intent intent = getIntent();
        fortune = intent.getStringExtra("fortune");

        // update text view
        TextView messageView = findViewById(R.id.fortuneView);
        messageView.setText(fortune);

        Button button = findViewById(R.id.button);

        // found code from https://stackoverflow.com/questions/9664108/how-to-finish-parent-activity-from-child-activity
        View.OnClickListener onclick = new View.OnClickListener() {
            public void onClick(View view) {
                setResult(RESULT_OK, null);
                finish();
                Intent firstIntent = new Intent(view.getContext(), chooseFortuneActivity.class);
                startActivity(firstIntent);
            }
        };

        // setup listener
        button.setOnClickListener(onclick);
    }
}
