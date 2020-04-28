echo -ne "hello\b\b\b\b\b"
echo -ne "hi\b\b"
echo -e "hello world"



HTML=(cart.html empty.html shopping.html shipping.html index.html login.html payment.html product.html search.html splash.html)
for i in ${HTML[*]}; do
  count=$(echo -n $i | wc -c )
  while [ $count -gt 0 ]; do
    B="$B\b"
    count=$(($count-1))
    done
      echo -n -e "copying - $i$B"
  sleep 1
  done

