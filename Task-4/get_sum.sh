#!/usr/bin/env bash
#Function to check if number is positive
is_positive() {
    local num=$1
    if [[ $num -gt 0 ]]; then
        return 0    # true
    else
        return 1    # false
    fi
}
sum=0
while true; do
    read -p "Enter a number (0 to stop): " num
    # Stop if user enters 0
    if [[ $num -eq 0 ]]; then
        break
    fi
 # Add to sum if number is positive
    if is_positive "$num"; then
        sum=$((sum + num))
    fi
done
echo "Sum of positive numbers: $sum"
