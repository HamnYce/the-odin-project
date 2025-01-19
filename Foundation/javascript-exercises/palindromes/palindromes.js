const palindromes = function (s = "") {
    s = s.replaceAll(/[\W]/g,"")
    s = s.toLowerCase();

    for (let i = 0;i < Math.floor(s.length/2);i++) {
        let lastIndex = s.length-i-1;
        if((s[i] !== s[lastIndex])) {
            return false;
        }
    }
    return true;
};

module.exports = palindromes;
