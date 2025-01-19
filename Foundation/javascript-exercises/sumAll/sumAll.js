const sumAll = function(x,y) {
    let sum = 0;
    
    if ((typeof x == typeof 0) && (typeof y == typeof 0) && x > 0 && y > 0) {
        if (x > y) {
            let s = x;
            x = y;
            y = s;
        }
        for (let i = x;i<=y;i++) {
            sum += i;
        }
        return sum;
    }
    else
        return 'ERROR'
};

module.exports = sumAll;
