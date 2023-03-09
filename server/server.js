const express = require('express')
const app = express()

app.listen(5500, ()=>{console.log("Server started on port 5500")} );
app.get("/getRequest", (req, res) => {
    res.json({"users": ["userOne", "userTwo", "userThree", "userFour", "userFive", "userSix"]})
});
app.post("/postRequest", (req, res) =>{
    res.send("Hello this is successfull Post Request")
});