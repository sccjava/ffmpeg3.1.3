# ffmpeg3.1.3

User ndk-build to compile ffmpeg for Android platform.

For iOS:
./build_iOS.sh

For Android:
./build_android.sh
ndk-build

Why use ndk-build instead of make?
Because using make, it will crash on some Android 5.0 phone, stranger!!!  but it won't crash on Android 6.0/7.0
