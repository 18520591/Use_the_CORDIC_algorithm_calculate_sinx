# Use the CORDIC algorithm calculate sinx (language: verilog)
* CORDIC algorithm:
![image](https://user-images.githubusercontent.com/67142437/117984342-f8111200-b361-11eb-91d7-8a99fb9b3ed3.png)
* Datapath:

![image](https://user-images.githubusercontent.com/67142437/117990377-5260a180-b367-11eb-828a-82e61dbc6e50.png)
* Number processing block: Perform conversion of the input value from 0 to 90.
![image](https://user-images.githubusercontent.com/67142437/117985651-19bec900-b363-11eb-81bc-d1995bed27d5.png)
  * Converts the input value from 0 to 360:
  ![image](https://user-images.githubusercontent.com/67142437/117988233-6b685300-b365-11eb-952e-3486d678f810.png)
  * Converts the input value from 0 to 180:
  ![image](https://user-images.githubusercontent.com/67142437/117987815-07de2580-b365-11eb-95b3-3d6ae878e383.png)
  * Converts the input value from 0 to 90:
  ![image](https://user-images.githubusercontent.com/67142437/117987672-e715d000-b364-11eb-864c-d799402b85f3.png)
* Block calculates x, y, z values:
![image](https://user-images.githubusercontent.com/67142437/117988659-d3b73480-b365-11eb-83b5-79fed457092c.png)
* Block initialize the values:
![image](https://user-images.githubusercontent.com/67142437/117990298-3b21b400-b367-11eb-943d-7e5bee95cc79.png)
* Control signal:
![image](https://user-images.githubusercontent.com/67142437/117990630-86d45d80-b367-11eb-8c5b-6014d2107c04.png)
* Finite-state machine:
![image](https://user-images.githubusercontent.com/67142437/117990673-92278900-b367-11eb-9ae4-c38f0d86a1e1.png)
