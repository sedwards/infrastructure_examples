# Python3 program to validate Visa
# Card number using regular expression
import re
 
# Function to validate Visa Card
# number using regular expression.
def isValidVisaCardNo(string):
     
    # Regex to check valid Visa
    # Card number
    regex = "^4[0-9]{12}(?:[0-9]{3})?$";
 
    # Compile the ReGex
    p = re.compile(regex);
     
    # If the string is empty
    # return false
    if (string == ''):
        return False;
         
    # Pattern class contains matcher()
    # method to find matching between
    # given string and regular expression.
    m = re.match(p, string);
     
    # Return True if the string
    # matched the ReGex else False
    if m is None:
        return False
    else:
        return True
 
# Driver code
if __name__ == "__main__":
     
    # Test Case 1
    str1 = "4155279860457";
    print(str1, isValidVisaCardNo(str1));
     
    # Test Case 2
    str2 = "4155279860457201";
    print(str2, isValidVisaCardNo(str2));
     
    # Test Case 3
    str3 = "4155279";
    print(str3, isValidVisaCardNo(str3));
     
    # Test Case 4
    str4 = "6155279860457";
    print(str4, isValidVisaCardNo(str4));
     
    # Test Case 5
    str5 = "415a27##60457";
    print(str5, isValidVisaCardNo(str5));
     
# This code is contributed by AnkitRai01
# https://www.geeksforgeeks.org/how-to-validate-visa-card-number-using-regular-expression/

