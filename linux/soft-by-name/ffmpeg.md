<h1>ffmpeg</h1>

````text
Утилита для преобразования аудио и видео файлов.
````

<hr>
<h2>Примеры</h2>

````BASH
# где лежит
type ffmpeg
# ffmpeg является /usr/bin/ffmpeg

# Найти опции, для указания позиции относительно начала файла
ffmpeg --help | grep start
# Найти опции, для указания позиции относительно конца файла
ffmpeg --help | grep EOF
# Найти опции, связанные с длительностью
ffmpeg --help | grep duration

# Взять "input.wav", перейти к позиции 11 секунд, выкусить 5 секунд, созранить в output.wav
ffmpeg -i input.wav -ss 11 -t 5 output.wav

# Взять аудио-файл "input.wav", выкусить из него 1740 секунд с позиции 0 и соъранить в файл "out-0-to-29m.mp3"
ffmpeg -i input.wav -t 1740 out-0-to-29m.mp3
````
<hr>
<h2>Справка</h2>

Команда:
````bash
man ffmpeg
````
Вывод:
````TEXT
NAME
       ffmpeg - ffmpeg video converter
...
OPTIONS
...
   Stream specifiers
...
   Generic options
       These options are shared amongst the ff* tools.

       -L  Show license.

       -h, -?, -help, --help [arg]
           Show help. An optional parameter may be specified to print help about a specific item. If no argument is specified, only basic (non advanced) tool options are shown.

           Possible values of arg are:

           long
               Print advanced tool options in addition to the basic tool options.

           full
               Print complete list of options, including shared and private options for encoders, decoders, demuxers, muxers, filters, etc.

           decoder=decoder_name
               Print detailed information about the decoder named decoder_name. Use the -decoders option to get a list of all decoders.

           encoder=encoder_name
               Print detailed information about the encoder named encoder_name. Use the -encoders option to get a list of all encoders.

           demuxer=demuxer_name
               Print detailed information about the demuxer named demuxer_name. Use the -formats option to get a list of all demuxers and muxers.

           muxer=muxer_name
               Print detailed information about the muxer named muxer_name. Use the -formats option to get a list of all muxers and demuxers.

           filter=filter_name
               Print detailed information about the filter named filter_name. Use the -filters option to get a list of all filters.

           bsf=bitstream_filter_name
               Print detailed information about the bitstream filter named bitstream_filter_name.  Use the -bsfs option to get a list of all bitstream filters.

           protocol=protocol_name
               Print detailed information about the protocol named protocol_name.  Use the -protocols option to get a list of all protocols.

       -version
           Show version.

       -buildconf
           Show the build configuration, one option per line.

       -formats
           Show available formats (including devices).
           
 Main options
 
       -f fmt (input/output)
           Force input or output file format. The format is normally auto detected for input 
           files and guessed from the file extension for output files, so 
           this option is not needed in most cases.
!!!
       -i url (input)
           input file url

       -y (global)
           Overwrite output files without asking.

       -n (global)
           Do not overwrite output files, and exit immediately if a specified output file already exists.

       -stream_loop number (input)
           Set number of times input stream shall be looped. Loop 0 means no loop, loop -1 means infinite loop.

       -recast_media (global)
           Allow forcing a decoder of a different media type than the one detected or designated by the demuxer. Useful for decoding media data muxed as data streams.

       -c[:stream_specifier] codec (input/output,per-stream)
       -codec[:stream_specifier] codec (input/output,per-stream)
           Select an encoder (when used before an output file) or a decoder (when used before an input file) for one or more streams. codec is the name of a decoder/encoder or a special value "copy"
           (output only) to indicate that the stream is not to be re-encoded.

           For example

                   ffmpeg -i INPUT -map 0 -c:v libx264 -c:a copy OUTPUT

           encodes all video streams with libx264 and copies all audio streams.

           For each stream, the last matching "c" option is applied, so

                   ffmpeg -i INPUT -map 0 -c copy -c:v:1 libx264 -c:a:137 libvorbis OUTPUT

           will copy all the streams except the second video, which will be encoded with libx264, and the 138th audio, which will be encoded with libvorbis.
!!!
       -t duration (input/output)
           When used as an input option (before "-i"), limit the duration of data read from the input file.

           When used as an output option (before an output url), stop writing the output after its duration reaches duration.

           duration must be a time duration specification, see the Time duration section in the ffmpeg-utils(1) manual.

           -to and -t are mutually exclusive and -t has priority.
!!!
       -to position (input/output)
           Stop writing the output or reading the input at position.  position must be a time duration specification, see the Time duration section in the ffmpeg-utils(1) manual.

           -to and -t are mutually exclusive and -t has priority.

       -fs limit_size (output)
           Set the file size limit, expressed in bytes. No further chunk of bytes is written after the limit is exceeded. The size of the output file is slightly more than the requested file size.
!!!
       -ss position (input/output)
           When used as an input option (before "-i"), seeks in this input file to position. Note that in most formats it is not possible to seek exactly, so ffmpeg will seek to the closest seek point
           before position.  When transcoding and -accurate_seek is enabled (the default), this extra segment between the seek point and position will be decoded and discarded. When doing stream copy
           or when -noaccurate_seek is used, it will be preserved.

           When used as an output option (before an output url), decodes but discards input until the timestamps reach position.

           positi           on must be a time duration specification, see the Time duration section in the ffmpeg-utils(1) manual.

       -sseof position (input)
           Like the "-ss" option but relative to the "end of file". That is negative values are earlier in the file, 0 is at EOF.


````