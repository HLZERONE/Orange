<html>
<body>
<h2>Discussion 4!</h2>

<form action="./add" method="get">
    <label for="name">Name: </label>
    <input type="text" name="name" id="name">
    <label for="email">Email: </label>
    <input type="email" name="email" id="email">

    <button type="button">Submit</button>
</form>



<form action="./show" method="post">
    <p>${param.param1}</p>
    <p>${param.param2}</p>
    <button type="submit">Update params</button>
</form>


</body>
</html>