package com.example.diceroller

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ImageView
import android.widget.Button
import android.widget.EditText

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val diceImage = findViewById<ImageView>(R.id.imageView)
        val button = findViewById<Button>(R.id.button)
        val textField = findViewById<EditText>(R.id.editTextNumber)
        textField.setText("1");

        button.setOnClickListener {
            rollDice(diceImage, textField)
        }
    }

    private fun rollDice(diceImage: ImageView, textField: EditText) {
        val randIdx = (1..6).random()

        val currentDice = when (randIdx) {
            1 -> R.drawable.dice1
            2 -> R.drawable.dice2
            3 -> R.drawable.dice3
            4 -> R.drawable.dice4
            5 -> R.drawable.dice5
            else -> R.drawable.dice6
        }
        diceImage.setImageResource(currentDice)
        textField.setText(randIdx.toString())
    }
}