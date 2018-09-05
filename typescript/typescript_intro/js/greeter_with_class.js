// In TS, classes and Interfaces play well together
// labeling an argument in a constructor Public automatically creates properties
// on the class with the argument name
// Two types don't have to match exactly. For example, Student still fits the Person interface shape
// even though it has a middleInital property, but Person doesn't.
var Student = /** @class */ (function () {
    function Student(firstName, middleInitial, lastName) {
        this.firstName = firstName;
        this.middleInitial = middleInitial;
        this.lastName = lastName;
        this.fullName = firstName + " " + middleInitial + " " + lastName;
    }
    return Student;
}());
function greeter_with_class(person) {
    console.log(person);
    return "Hello " + person.firstName + " " + person.lastName;
}
var user3 = new Student("Richard", "M", "Holland");
document.getElementById('greeter_with_class').innerText = greeter_with_class(user3);
