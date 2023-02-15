#!/usr/bin/sh


output=stdout
delay=5
format=text

help()
{
    echo "Usage: logger [ -o | --output ]
              [ -d | --delay ]
              [ -f | --format ]
              [ -h | --help  ]

         output:
             where will be the log produced
             stdout, stderr, or path to the output file
             default: ${output}
         delay:
             delay between log lines in seconds
             default: ${delay}
        format:
            format of the output line
            text or json
            default: ${format}"
    exit 2
}

SHORT=o:,d:,f:,h
LONG=output:,delay:,format:,help
OPTS=$(getopt -a -n logger --options $SHORT --longoptions $LONG -- "$@")

eval set -- "$OPTS"

while :
do
    case "$1" in
        -o | --output )
            output="$2"
            shift 2
            ;;
        -d | --delay )
            delay="$2"
            shift 2
            ;;
        -f | --format )
            format="$2"
            shift 2
            ;;
        -h | --help)
            help
            ;;
        --)
            shift;
            break
            ;;
        *)
            echo "Unexpected option: $1"
            help
            ;;
    esac
done

echo "Output: ${output}; Delay: ${delay}; Format: ${format}"

while :
do
    now=`date -Iseconds`;
    case "${format}" in
        txt | text )
            line="${now} output=${output}; delay=${delay}; format=${format}"
            ;;
        json )
            line="{\"date\": \"${now}\", \"output\": \"${output}\", \"delay\": \"${delay}\", \"format\": \"${format}\", \"nested\": {\"a\": 1, \"b\": 2, \"c\": 3}}"
            ;;
    esac

    case "${output}" in
        stdout )
            echo "${line}"
            ;;
        stderr )
            echo "${line}" >&2
            ;;
        *)
            echo "${line}" > "${output}"
            ;;
    esac


    sleep ${delay};
done
