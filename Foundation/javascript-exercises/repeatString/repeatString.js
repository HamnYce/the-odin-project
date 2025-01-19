const repeatString = function(s,n) {
    let string = ""
    if (n < 0)
        string = 'ERROR'
    else{
        for (let i = 0; i < n; i++) {
            string += s;
        }
    }
    return string;
};

module.exports = repeatString;
