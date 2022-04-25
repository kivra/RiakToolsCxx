# RiakToolsCxx

### Requirements

- `gcc`
- `gcc-c++`
- `make`
- `openssl-devel`
- `boost-devel`
- `snappy-devel`


### Build

```
cd RiakToolsCxx
mkdir build
cd build
cmake ..
make
```

To confirm that `snappy` has been statically-linked to the `riakcomapct` binary, you can
run the following command.

```
ldd -v riakcompact | grep snappy
```

which should output something along the following lines

```
libsnappy.so.1 => /lib64/libsnappy.so.1 (0x00007f0f41ba1000)
/lib64/libsnappy.so.1:
```

### Get Started

```
./riakcompact /var/lib/riak/leveldb/<vnode>`
```