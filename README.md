# A Docker image that provides svg2swf.

svg2swf is an SVG to Flash SWF converter. The instructions to build the binaries is collected from https://sourceforge.net/projects/svg2swf and http://svg2swf.sourceforge.net/build.html

The reason to use this docker image is to convert svg-files to swf-files without having the svg2swf binary locally installed.

## Usage
```
cat image.svg | docker run -i molflow/svg2swf > image.swf
``` 
I find this a good way to create vector graphics for prezi.
