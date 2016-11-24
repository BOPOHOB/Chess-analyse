# Chess-analyse
## Chess problem
The queen stand on d1. Find the sequance of steps which have maximum of passed fields and no one of field is passed more then one time.
## Solution
### Chess table representation

| Fields numeration |  queen motions |
|---|---|
| ![](https://raw.githubusercontent.com/BOPOHOB/Chess-analyse/master/img/table.png) | ![](https://raw.githubusercontent.com/BOPOHOB/Chess-analyse/master/img/dest.png) |

To have a way to describe the steps we set the number to each field. It's usefull to have invalid values between each row to have simple way to detect attempting to leave from chess field



To describe queen step we only need to add correspond value to it position

| ![Points shuffle](https://raw.githubusercontent.com/BOPOHOB/Chess-analyse/master/img/1.png)  | ![Points shuffle](https://raw.githubusercontent.com/BOPOHOB/Chess-analyse/master/img/2.png)  | ![Points shuffle](https://raw.githubusercontent.com/BOPOHOB/Chess-analyse/master/img/3.png)  |
| ------- | ----------- | ----------- |
| ![Points shuffle](https://raw.githubusercontent.com/BOPOHOB/Chess-analyse/master/img/4.png)  | ![Points shuffle](https://raw.githubusercontent.com/BOPOHOB/Chess-analyse/master/img/5.png)  | ![Points shuffle](https://raw.githubusercontent.com/BOPOHOB/Chess-analyse/master/img/6.png)  |

Finally program reach six equal solutions. Each of sequence of motions hold 31 fields

Program output:

```Prolog
Solutions = [[14, 13, 12, 11, 21, 22], [14, 13, 12, 11, 21, 23], [14, 13, 12, 11, 21, 24], [14, 13, 12, 11, 21|...], [14, 13, 12, 11|...], [14, 13, 12|...], [14, 13|...], [14|...], [...|...]|...],
I = [5, 6, 7, 8, 9, 10, 11, 5, 6|...],
Max = 31,
V = 436738,
Sol = [14, 18, 88, 81, 11, 77] ;
Solutions = [[14, 13, 12, 11, 21, 22], [14, 13, 12, 11, 21, 23], [14, 13, 12, 11, 21, 24], [14, 13, 12, 11, 21|...], [14, 13, 12, 11|...], [14, 13, 12|...], [14, 13|...], [14|...], [...|...]|...],
I = [5, 6, 7, 8, 9, 10, 11, 5, 6|...],
Max = 31,
V = 438526,
Sol = [14, 18, 88, 11, 81, 87] ;
Solutions = [[14, 13, 12, 11, 21, 22], [14, 13, 12, 11, 21, 23], [14, 13, 12, 11, 21, 24], [14, 13, 12, 11, 21|...], [14, 13, 12, 11|...], [14, 13, 12|...], [14, 13|...], [14|...], [...|...]|...],
I = [5, 6, 7, 8, 9, 10, 11, 5, 6|...],
Max = 31,
V = 438532,
Sol = [14, 18, 88, 11, 81, 27] ;
Solutions = [[14, 13, 12, 11, 21, 22], [14, 13, 12, 11, 21, 23], [14, 13, 12, 11, 21, 24], [14, 13, 12, 11, 21|...], [14, 13, 12, 11|...], [14, 13, 12|...], [14, 13|...], [14|...], [...|...]|...],
I = [5, 6, 7, 8, 9, 10, 11, 5, 6|...],
Max = 31,
V = 465018,
Sol = [14, 18, 81, 88, 11, 71] ;
Solutions = [[14, 13, 12, 11, 21, 22], [14, 13, 12, 11, 21, 23], [14, 13, 12, 11, 21, 24], [14, 13, 12, 11, 21|...], [14, 13, 12, 11|...], [14, 13, 12|...], [14, 13|...], [14|...], [...|...]|...],
I = [5, 6, 7, 8, 9, 10, 11, 5, 6|...],
Max = 31,
V = 465843,
Sol = [14, 18, 81, 11, 88, 82] ;
Solutions = [[14, 13, 12, 11, 21, 22], [14, 13, 12, 11, 21, 23], [14, 13, 12, 11, 21, 24], [14, 13, 12, 11, 21|...], [14, 13, 12, 11|...], [14, 13, 12|...], [14, 13|...], [14|...], [...|...]|...],
I = [5, 6, 7, 8, 9, 10, 11, 5, 6|...],
Max = 31,
V = 465849,
Sol = [14, 18, 81, 11, 88, 28] ;
false.
```
