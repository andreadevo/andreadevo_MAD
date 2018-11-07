package andrea.devore_lab5;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void sayGobble(View view){
        TextView gobbleText=findViewById(R.id.message);
        EditText name=findViewById(R.id.editText);
        String nameValue=name.getText().toString();
        gobbleText.setText("Happy Thanksgiving " + nameValue + "!");
        ImageView turkey=findViewById(R.id.imageView);
        turkey.setImageResource(R.drawable.turkey);
    }
}
