# Dockerfile for Android Studio

Dockerfile for android-studio

## Running

### 1. Create a directory for Android Studio on local system
```
mkdir android
cd android
mkdir .android
mkdir .AndroidStudio3.4
mkdir .idea
mkdir .java
mkdir Android
mkdir AndroidStudioProjects
```

### 2. Download Android Studio under android/Android

### 3. Start a container
```
docker run --rm \
  -e DISPLAY=${DISPLAY} \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /path/to/android/you/created/.android:/home/devwindsw/.android \
  -v /path/to/android/you/created/.AndroidStudio3.4:/home/devwindsw/.AndroidStudio3.4 \
  -v /path/to/android/you/created/.idea:/home/devwindsw/.idea \
  -v /path/to/android/you/created/.java:/home/devwindsw/.java \
  -v /path/to/android/you/created/Android:/home/devwindsw/Android \
  -v /path/to/android/you/created/AndroidStudioProjects:/home/devwindsw/AndroidStudioProjects \
  --name idea-$(head -c 4 /dev/urandom | xxd -p)-$(date +'%Y%m%d-%H%M%S') \
  android-studio:latest

```
