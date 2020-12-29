const pinNum = 1;
const pinName = (n => (['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'][(n - (n%32))/32] + Number(n%32).toString()))(pinNum);
console.log(pinName);
