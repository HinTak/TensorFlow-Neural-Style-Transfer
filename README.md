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

For most parts, the code just works. I was not interested in image display, so I just skip all the plotting code. I had opened a pull
https://github.com/tensorflow/docs/pull/1592 for a small code improvement.

My outcome after 100 steps:

```
Train step: 100
Total time: 1202.7
```

![my run](images/stylized-image-100.png)

Theirs first half of 1000 steps:

```
Train step: 1000
Total time: 22.3
```

A whole line of dots comes out for them, every 2 seconds. So obviously, they never noticed the progress bar does not work.

My hardware is about 540x slower (without GPU acceleration). For me, it is 20 minutes. So without my fix, I could be staring
at the screen for 20 minutes wondering what's going on. And I did, twice, interrupting the run, thinking it has gone wrong!

Here is the reference outcome:

![the official tutorial reference](images/stylized-image.png)

```
# docker image rm tensorflow-2.1.1-styles:latest
Untagged: tensorflow-2.1.1-styles:latest
Deleted: sha256:a1315b18753062561d1185e19b4f78be139c3d83b8c9d2ea31617398be4ecb86
Deleted: sha256:a919d216ca6b50a5393187e5f1b96b2d68ffb8327f1b75aa2d1c96225dfad8b4
```

```
# docker image prune
WARNING! This will remove all dangling images.
Are you sure you want to continue? [y/N] y
Total reclaimed space: 0B
```

```
# docker image rm tensorflow/tensorflow:2.1.1
Error response from daemon: conflict: unable to remove repository reference "tensorflow/tensorflow:2.1.1" (must force) - container ecb4925f1eb8 is using its referenced image 684ce605b42e
```

```
# docker ps -a
CONTAINER ID   IMAGE          COMMAND                  CREATED       STATUS                   PORTS     NAMES
ecb4925f1eb8   684ce605b42e   "/bin/sh -c 'apt-get…"   2 years ago   Exited (1) 2 years ago             strange_lewin

# docker ps -a -q
ecb4925f1eb8

# docker rm ecb4925f1eb8
ecb4925f1eb8
# docker ps -a -q

# docker image rm tensorflow/tensorflow:2.1.1
Untagged: tensorflow/tensorflow:2.1.1
Untagged: tensorflow/tensorflow@sha256:2904f332656af61c76145523676f8431dd32f64800b4211a97bc7b7d0176a8db
Deleted: sha256:684ce605b42e5a72b0152fa50757c01ce2f9dd107c7b215a85d75af9f95ad558
Deleted: sha256:3b9c932dbd4b3417fef2d1405c10e0ee3796e9263442949267a6dd33811529fd
Deleted: sha256:5548aeae48816e0133bf8941612abf3896171af86f1133e8d62489d24b9dcb07
Deleted: sha256:d897e8e6ba8ce25cb446c55d33f43333dfd25d6c580c6a434fafcb43d69f129f
Deleted: sha256:ee48be82dbbd0ca547f95c9e22069995ac84813b13fa5b907ee382324602e676
Deleted: sha256:267d379cabfb0e8740baab20ceea639e3ab763266227ecb6c513f9c46a752654
Deleted: sha256:e857acd09a4246a35dceef02e730876a388e4156ca938ae6898c10d96dda4e6b
Deleted: sha256:1ca0178eeed1b7e7db63418c19be386cdaef9e0e500dbfce22422259f2dc8762
Deleted: sha256:82751c4dcc36265daceeee0abd938806b591eb66700863186377348c96e8aead
Deleted: sha256:24b16cac34768092d57cdb429a12de6c9ee870a3724d70098a189ae0ac344c42
Deleted: sha256:b1daff3b271fede2bec31812c398e28952f792935f608e467271cdfaccab7de2
Deleted: sha256:b7f7d2967507ba709dbd1dd0426a5b0cdbe1ff936c131f8958c8d0f910eea19e
```
