# Use the CORDIC algorithm calculate sinx (language: verilog)
* CORDIC algorithm:
![image](https://user-images.githubusercontent.com/67142437/117984342-f8111200-b361-11eb-91d7-8a99fb9b3ed3.png)
* Datapath:
* Number processing block: Perform conversion of the input value from 0 to 90.
![image](https://user-images.githubusercontent.com/67142437/117985651-19bec900-b363-11eb-81bc-d1995bed27d5.png)
** Converts the input value from 0 to 360:
![image](https://user-images.githubusercontent.com/67142437/117985474-ee3bde80-b362-11eb-8751-d2d84c6be836.png)
** Converts the input value from 0 to 180:
![image](https://user-images.githubusercontent.com/67142437/117985540-fe53be00-b362-11eb-9d9f-e5290b03c12a.png)
** Converts the input value from 0 to 90:
![image](https://user-images.githubusercontent.com/67142437/117985613-0e6b9d80-b363-11eb-81d6-d13788dd3156.png)


