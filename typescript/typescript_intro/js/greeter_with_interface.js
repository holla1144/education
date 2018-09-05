// Now that we have our Person interface, we can change
// the signature of our greeter_with_interface function
function greeter_with_interface(person) {
    return "Hello " + person.firstName + " " + person.lastName;
}
// This should fail, because user2 does not match the shape of our
// Person interface
// let user2 = "Jane2";
// NOTE: shapes match even if the order of elements in an object
// or class are not the same as those in the interface definition
var newUser2 = { lastName: "Fonda", firstName: "Jane" };
document.getElementById('greeter_with_interface').innerText = greeter_with_interface(newUser2);
