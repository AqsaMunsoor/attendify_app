# Prevent ML Kit Text Recognizer classes from being removed
-keep class com.google.mlkit.vision.text.** { *; }
-keep class com.google.mlkit.vision.text.chinese.** { *; }
-keep class com.google.mlkit.vision.text.japanese.** { *; }
-keep class com.google.mlkit.vision.text.korean.** { *; }
-keep class com.google.mlkit.vision.text.devanagari.** { *; }

# Prevent ML Kit Common classes from being stripped
-keep class com.google.mlkit.common.** { *; }
-keep class com.google.mlkit.vision.common.** { *; }

# Avoid warnings
-dontwarn com.google.mlkit.**
