const add = function(a,b) {
	return a+b;
};

const subtract = function(a,b) {
	return a-b;
};

const sum = function(args) {
  let total = 0;
  if (args.length > 0)
    args.forEach(arg => total+=arg);

  return total;
};

const multiply = function(args) {
  let total = 1;
  if (args.length > 0)
    args.forEach(arg => total*=arg);

  return total;
};

const power = function(a,b) {
	return a**b
};

const factorial = function(a) {
  let total = 1;
  for (let i = 1; i <= a; i++) {
    total *= i;
  }
	return total;
};

module.exports = {
  add,
  subtract,
  sum,
  multiply,
  power,
  factorial
};
