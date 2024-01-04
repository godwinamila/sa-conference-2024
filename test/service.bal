import ballerina/http;


configurable string apiUrl = "http://localhost:9090";

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9091) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        
        if name is "" {
            return error("name should not be empty!");
        }
        http:Client backendClient = check new(apiUrl);
        string ratesJson = check backendClient->get("/greeting?name=" + name);
        return ratesJson;
    }
    resource function post create() returns string|error {
        // Send a response back to the caller.
            
        return "Creation successful!!";
    }
}
