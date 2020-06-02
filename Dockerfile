FROM tensorflow/tensorflow:2.1.1

# "DEBIAN_FRONTEND=noninteractive TZ=Europe/London" is necessary
#     to inhibit tzdata from prompting for user inputs, even with "-y"
RUN apt-get update && \
   DEBIAN_FRONTEND=noninteractive TZ=Europe/London apt-get install -y python3-matplotlib python3-pil.imagetk && \
   pip install google.colab tensorflow_hub
