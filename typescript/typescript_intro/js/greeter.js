// By adding a type definition, we ensure a compile-time error
// if we try to pass anything other than a string to greeter
// NOTE: the ts file will still compile to js, even if there are errors
function greeter(person) {
    return "Hello " + person;
}
var user = "Jane1";
// let user = [1, 2, 3] will throw an error, because it is not a string
document.getElementById('greeter').innerText = greeter(user);
