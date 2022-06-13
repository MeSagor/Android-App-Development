package com.example.assignmen_2

import android.content.Context
import androidx.appcompat.app.AppCompatActivity
import android.view.inputmethod.InputMethodManager
import android.os.Bundle
import android.view.View
//import android.widget.Button
//import android.widget.EditText
//import android.widget.TextView
import androidx.databinding.DataBindingUtil
import com.example.assignmen_2.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
//        setContentView(R.layout.activity_main)
//
//        findViewById<Button>(R.id.done_btn).setOnClickListener {
//            addNickname(it)
//        }

        binding = DataBindingUtil.setContentView(this, R.layout.activity_main)
        binding.doneBtn.setOnClickListener { addNickname(it) }
    }

    private fun addNickname(view: View) {
//        val editText = findViewById<EditText>(R.id.nickname)
//        val nicknameView = findViewById<TextView>(R.id.nickname_text)
//
//        nicknameView.text = editText.text
//        editText.visibility = View.GONE
//        view.visibility = View.GONE
//        nicknameView.visibility = View.VISIBLE

        binding.apply {
            nicknameText.text = binding.nickname.text
            invalidateAll()

            nickname.visibility = View.GONE
            doneBtn.visibility = View.GONE
            nicknameText.visibility = View.VISIBLE
        }

        // Hide the keyboard.
        val imm = getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
        imm.hideSoftInputFromWindow(view.windowToken, 0)
    }
}