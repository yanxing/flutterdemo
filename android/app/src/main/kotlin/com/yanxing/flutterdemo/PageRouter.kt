package com.yanxing.flutterdemo

import android.content.Context
import android.content.Intent

/**
 * @author 李双祥 on 2019/6/5.
 */
object PageRouter  {

    val FLUTTER_PAGE_URL="sample://firstPage"

    fun openPageByUrl(content:Context,url:String):Boolean{
        return openPageByUrl(content,url,0)
    }

    fun openPageByUrl(content: Context,url: String,requestCode:Int):Boolean{
        try {
            if (url.startsWith(FLUTTER_PAGE_URL)){
                content.startActivity(Intent(content,FlutterPageActivity::class.java))
                return true
            }
            return false
        }catch (e:Exception){}
        return false
    }


}