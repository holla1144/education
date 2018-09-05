// In TS, classes and Interfaces play well together
// labeling an argument in a constructor Public automatically creates properties
// on the class with the argument name

// Two types don't have to match exactly. For example, Student still fits the Person interface shape
// even though it has a middleInital property, but Person doesn't.

class Student {
  fullName: string; // declare property name and type
  constructor(public firstName: string, public middleInitial: string, public lastName: string) {
    this.fullName = firstName + " " + middleInitial + " " + lastName;
  }
}

function greeter_with_class(person: Person) {
  return "Hello " + person.firstName + " " + person.lastName;
}

interface Person {
  firstName: string,
  lastName: string
}

let user3 = new Student("Richard", "M", "Holland");

document.getElementById('greeter_with_class').innerText = greeter_with_class(user3);
