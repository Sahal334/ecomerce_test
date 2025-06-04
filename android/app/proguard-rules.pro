# Razorpay ProGuard rules
-keep class com.razorpay.** { *; }
-keep class proguard.annotation.** { *; }
-dontwarn com.razorpay.**
-dontwarn proguard.annotation.**

# Keep all classes with @Keep annotation
-keep @proguard.annotation.Keep class * { *; }
-keep @proguard.annotation.KeepClassMembers class * { *; }

# Additional Razorpay rules
-keep class com.razorpay.AnalyticsEvent { *; }
-keep class com.razorpay.BaseRazorpay { *; }
-keep class com.razorpay.Razorpay { *; }
-keep class com.razorpay.RzpTokenReceiver { *; }

# Keep annotation classes
-keepattributes *Annotation*
-keepclassmembers class * {
    @proguard.annotation.Keep *;
}