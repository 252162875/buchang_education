import android.content.Context
import android.os.Bundle
import android.view.View
import android.widget.ImageView
import com.xy.buchang_education.R
import io.flutter.embedding.android.SplashScreen

class SimpleSplashScreen : SplashScreen {
    override fun createSplashView(p0: Context, p1: Bundle?): View? {
        var v = ImageView(p0)
        v.setBackgroundResource(R.drawable.bb)
        return v
    }

    override fun transitionToFlutter(p0: Runnable) {
        p0.run()
    }

}