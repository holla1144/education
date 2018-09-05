
// In typescript, two types are compatible if they have the same
// internal structure, even if they aren't called the same thing.
interface Person {
  firstName: string,
  lastName: string

}

// Now that we have our Person interface, we can change
// the signature of our greeter_with_interface function
function greeter_with_interface(person: Person) {
  return "Hello " + person.firstName + " " + person.lastName;
}

// This should fail, because user2 does not match the shape of our
// Person interface
// let user2 = "Jane2";

// NOTE: shapes match even if the order of elements in an object
// or class are not the same as those in the interface definition

let newUser2 = { lastName: "Fonda", firstName: "Jane" };

document.getElementById('greeter_with_interface').innerText = greeter_with_interface(newUser2);
