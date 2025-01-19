const ftoc = function(fer) {
  if (typeof fer == typeof 0) {
    let cel = (fer-32) * (5/9)
  cel = Math.round(cel * 10)/10
  return cel
  }
  else
    return 'ERROR'
  //(fer − 32) × 5⁄9
};

const ctof = function(cel) {
  if (typeof cel == typeof 0) {
    let fer = cel * (9/5) + 32
    fer = Math.round(fer*10)/10
    return fer
  }
  else
    return 'ERROR'
  //cel * 9⁄5 + 32
};

module.exports = {
  ftoc,
  ctof
};
