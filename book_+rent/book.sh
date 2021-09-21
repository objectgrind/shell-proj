 #!/bin/bash
 echo "BOOK RENTAL  APPLICATION"
 echo "############################################"
 # here we can set the cost according to  cost per day
 cost_per_day=30

 read -p "How  many days was Book Rented : " days_rented
 read -p "What day the Book rented  : " day_rented

 h=$(date +%H)
 if [ $h  -ge 21 ];then
  days_rented=$[days_rented+1]
 fi

 if [ $day_rented = "Sunday" ]; then
  cost=$(echo "$days_rented * $cost_per_day * 0.5" | bc )
 elif [ $day_rented = "Saturday" ]; then
  cost=$(echo "$days_rented * $cost_per_day * 0.7" | bc )
 else
  cost=$(echo "$days_rented * $cost_per_day " | bc )
 fi

 echo "The Cost Of Book Rental: Rs $cost"
 original_cost=$[days_rented * cost_per_day]
 discountF=$(echo "$original_cost - $cost" | bc)
 discountI=$(echo "$discountF" | cut -d "." -f1)

 if [ $discountI -gt 0 ]; then
  echo "Hello, You got Rs $discountF Discount, Enjoy.."
 fi
 echo "Visit Again............"
