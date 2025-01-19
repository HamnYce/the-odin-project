const reverseString = function(s) {
    let newstring = "";
    for (let i = s.length-1;i>=0;i--) {
        newstring += s[i];
    }
    return newstring;
};

module.exports = reverseString;
