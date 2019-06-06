package com.yanxing.flutterdemo

import com.taobao.idlefish.flutterboost.containers.BoostFlutterActivity
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.GeneratedPluginRegistrant
import java.util.HashMap

/**
 * @author 李双祥 on 2019/6/5.
 */
class FlutterPageActivity : BoostFlutterActivity() {

    override fun onRegisterPlugins(registry: PluginRegistry?) {
        GeneratedPluginRegistrant.registerWith(registry)
    }

    /**
     * 该方法返回当前Activity在Flutter层对应的name，
     * 混合栈将会在flutter层根据这个名字，在注册的Route表中查找对应的Widget
     *
     * 在flutter层有注册函数：
     *     FlutterBoost.singleton.registerPageBuilders({
     *       'first': (pageName, params, _) => FirstRouteWidget(),
     *       'second': (pageName, params, _) => SecondRouteWidget(),
     *       ...
     *     });
     *
     * 该方法中返回的就是注册的key：first , second
     *
     * @return
     */
    override fun getContainerName(): String {
        return "sample://firstPage"
    }

    /**
     * 该方法返回的参数将会传递给上层的flutter对应的Widget
     *
     * 在flutter层有注册函数：
     *    FlutterBoost.singleton.registerPageBuilders({
     *       'first': (pageName, params, _) => FirstRouteWidget(),
     *       'second': (pageName, params, _) => SecondRouteWidget(),
     *        ...
     *     });
     *
     * 该方法返回的参数就会封装成上面的params
     *
     * @return
     */
    override fun getContainerParams(): Map<String, String> {
        val params = HashMap<String, String>()
        params["aaa"] = "bbb"
        return params
    }
}