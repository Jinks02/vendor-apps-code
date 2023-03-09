-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
-keep class androidx.appcompat.** { *; }
-keepattributes JavascriptInterface
-keepattributes *Annotation*

-dontwarn com.razorpay.**
-keep class com.razorpay.** {*;}

-optimizations !method/inlining/*

-keepclasseswithmembers class * {
  public void onPayment*(...);
}