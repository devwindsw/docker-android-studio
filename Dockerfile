FROM ubuntu:18.04

RUN dpkg --add-architecture i386

ENV DEBIAN_FRONTEND=noninteractive

# Install prerequisites
RUN apt-get update && apt-get install --no-install-recommends -y curl unzip \
  xorg vim default-jdk \
  libc6 libncurses5 libstdc++6 lib32stdc++6 libz1 libbz2-1.0 \
  libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 \
  && rm -rf /var/lib/apt/lists/* \
  && useradd -ms /bin/bash devwindsw 

# Download specific Android Studio bundle (all packages).
#RUN curl 'https://dl.google.com/dl/android/studio/ide-zips/3.4.2.0/android-studio-ide-183.5692245-linux.tar.gz' > /tmp/studio.zip && unzip -d /opt /tmp/studio.zip && rm /tmp/studio.zip

RUN apt-get update && apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module \
  && rm -rf /var/lib/apt/lists/* \

# Clean up
RUN apt-get clean
RUN apt-get purge

USER devwindsw
ENV HOME /home/devwindsw

CMD [ "/home/devwindsw/Android/android-studio/bin/studio.sh" ]
