const fibonacci = function(n) {
    let a = 0;
    let b = 1;
    let temp;
    if (n < 0) return "OOPS";
    for (let i = 0;i < n-1;i++) {
        temp = b;
        b = a + b;
        a = temp;
    }
    return b;
};

module.exports = fibonacci;
