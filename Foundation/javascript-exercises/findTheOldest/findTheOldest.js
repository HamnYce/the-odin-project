//Given an array of objects representing people with a birth and death year, return the oldest person.
const findTheOldest = function(x) {
    let y = x;
    let person = x[0];
    if (!person.yearOfDeath )
            person.yearOfDeath = new Date().getFullYear();
    
    for (const item of x) {
        if (!item.yearOfDeath)
            item.yearOfDeath = new Date().getFullYear()
            
        let age1 = person.yearOfDeath - person.yearOfBirth;
        let age2 = item.yearOfDeath - item.yearOfBirth;

        if (age2 > age1) 
            person = item;
    }
    return person;
};

module.exports = findTheOldest;
