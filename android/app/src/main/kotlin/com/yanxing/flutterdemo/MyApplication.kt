
package com.yanxing.flutterdemo
import android.app.Activity
import android.app.Application
import android.content.Context
import android.util.Log
import io.flutter.app.FlutterApplication

import com.taobao.idlefish.flutterboost.Debuger
import com.taobao.idlefish.flutterboost.FlutterBoostPlugin
import com.taobao.idlefish.flutterboost.interfaces.IPlatform
import com.yanxing.flutterdemo.MainActivity
import com.yanxing.flutterdemo.PageRouter

class MyApplication : FlutterApplication() {

    override fun onCreate() {
        super.onCreate()
        FlutterBoostPlugin.init(object:IPlatform{

            override fun getApplication(): Application {
                return this@MyApplication
            }

            override fun getMainActivity(): Activity? {
                if (MainActivity.sRef!=null){
                   return MainActivity.sRef?.get()
                }
                return null
            }

            override fun isDebug(): Boolean {
                return true
            }

            override fun startActivity(context: Context, url: String, requestCode: Int): Boolean {
                Log.d("flutter打开原生",url)
                return PageRouter.openPageByUrl(context, url, requestCode)
            }

            override fun getSettings(): MutableMap<Any?, Any?>? {
                return null
            }

        })
    }
}