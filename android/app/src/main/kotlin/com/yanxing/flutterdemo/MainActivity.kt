package com.yanxing.flutterdemo

import android.os.Bundle
import android.support.v7.app.AppCompatActivity

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import kotlinx.android.synthetic.main.main.*
import java.lang.ref.WeakReference

class MainActivity : AppCompatActivity() {

    companion object {
        var sRef: WeakReference<MainActivity>? = null
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.main)
        sRef = WeakReference<MainActivity>(this)
        //GeneratedPluginRegistrant.registerWith(this)
        button.setOnClickListener {
            PageRouter.openPageByUrl(this, PageRouter.FLUTTER_PAGE_URL)
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        sRef?.clear()
        sRef = null
    }
}
