from ubuntu:12.04
run set -x && \
    apt-get update -q && \
    apt-get install -q -y \
        libcairo2-dev \
        libcairo2 \
        libexpat1-dev \
        libexpat1 \
        libfreetype6-dev \
        libfreetype6 \
        libpng12-dev \
        libpng12-0 \
        libjpeg62-dev \
        libjpeg62 \
        zlib1g-dev \
        zlib1g \
        libglib2.0-dev \
        libc6 \
        libelf1 \
        libglib2.0-0 \
        libcurl3 \
        wget \
        build-essential \
        git \
        libcurl4-openssl-dev \
        bison \
        flex \
        gnome-common \
        gtk-doc-tools && \
    mkdir /src && \
    cd /src && \
    wget -nv http://downloads.sourceforge.net/uriparser/uriparser-0.7.4.tar.gz && \
    mkdir uriparser && \
    tar xf uriparser-0.7.4.tar.gz --strip-components 1 -C uriparser && \
    cd /src/uriparser && \
    ./configure && \
    make && \
    make install && \
    cd /src && \
    rm -r uriparser uriparser-0.7.4.tar.gz && \
    git clone git://git.code.sf.net/p/svg2swf/libcroco libcroco && \
    cd /src/libcroco && \
    ./autogen.sh && \
    make && \
    make install && \
    cd /src && \
    rm -r libcroco && \
    git clone git://git.code.sf.net/p/svg2swf/libsvg libsvg && \
    cd libsvg && \
    ./autogen.sh && \
    make && \
    make install && \
    cd /src && \
    rm -r libsvg && \
    git clone git://git.code.sf.net/p/svg2swf/libsvg-cairo libsvg-cairo && \
    cd libsvg-cairo && \
    ./autogen.sh && \
    make && \
    make install && \
    cd /src && \
    rm -r libsvg-cairo && \
    wget -nv http://downloads.sourceforge.net/project/svg2swf/ming/0.4.3.1/ming-0.4.3.1-svg2swf.src.tar.gz && \
    mkdir ming && \
    tar xf ming-0.4.3.1-svg2swf.src.tar.gz --strip-components 1 -C ming && \
    cd ming && \
    ./configure && \
    make && \
    make install && \
    cd /src && \
    rm -r ming-0.4.3.1-svg2swf.src.tar.gz ming && \
    git clone git://git.code.sf.net/p/svg2swf/code svg2swf && \
    cd svg2swf && \
    ldconfig && \
    ./bootstrap && \
    ./configure && \
    make && \
    make install && \
    cd /src && \
    rm -r svg2swf && \
    apt-get remove -y -q \
        wget \
        build-essential \
        libcairo2-dev \
        libexpat1-dev \
        libfreetype6-dev \
        libpng12-dev \
        libjpeg62-dev \
        zlib1g-dev \
        libglib2.0-dev \
        git \
        libcurl4-openssl-dev \
        bison \
        flex \
        bison \
        flex \
        gtk-doc-tools && \
    apt-get -y -q autoremove && \
    apt-get -y -q autoclean && \
    rm -rf /var/lib/apt/lists/* 
cmd ["svg2swf","-"]
