const removeFromArray = function(arr = [],...x) {
    for (let i = 0;i<x.length;i++) {
        if (arr.indexOf(x[i]) != -1) {
            arr.splice(arr.indexOf(x[i]),1);
        }
    }
    
    return arr;
};

module.exports = removeFromArray;
