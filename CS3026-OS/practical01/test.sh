echo Hello world
case $2 in
	"+") let z=$1+$3 ;;
	"-") let z=$1-$3 ;;
esac
echo $z
