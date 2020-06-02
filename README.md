# Neural style transfer with TensorFlow

This is a set of instructions, surrounding and complementary to those at:

https://www.tensorflow.org/tutorials/generative/style_transfer

.

The official docker image contains only the core tools. To run
the Neural Style Transfer example, it is necesssary to build on top
of the official image:

```
# docker pull tensorflow/tensorflow:2.1.1
...
# docker build -t tensorflow-2.1.1-styles .
...
```

Then you have:

```
# docker images
REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
tensorflow-2.1.1-styles   latest              a1315b187530        18 minutes ago      2.26GB
tensorflow/tensorflow     2.1.1               684ce605b42e        13 days ago         2.04GB
...
```

After this, you can launch an interactive session with:

```
# docker run -u 1000:1000 --rm -it -v /host-dir:/tf-tryout:z -w /tf-tryout tensorflow-2.1.1-styles:latest
```
