<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FileBoxx</title>
</head>
<style>
    *{
        margin: 0px;
        color: #00fec3;
        padding: 0px;
        font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    }
body::before{
    content: "";
    width: 100%;
    height: 100vh;
    background-image: url("./Welcome.jpg");
    z-index: -1;
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    position: absolute;
    opacity: 0.9;
}
.navbar  {
    box-shadow: 0px 28px 52px;
    font-size: 1.5rem;
    display: flex;
    height: 10vh;
    align-items: center;
    justify-content: space-between;
    >div{
        >a{
            margin: 40px;
            text-decoration: none;
        }
    }
    >p{
        margin: 20px;
    }
}
.welcome {
height: 70vh;
width: 99.7%;
display: flex;
justify-content: center;
align-items: center;
flex-direction: column;
font-size: 2rem;
}
</style>
<body>
    <nav class="navbar">
        <p>FileBoxx</p>
        <div>
           <a href="">Files</a>
           <a href="">About Us</a>
           <a href="">Sign In / Sign Up</a> 
        </div>
        
    </nav>
    <div class="welcome">
        <h1>WELCOME TO</h1>
        <h1>FileBoxx</h1>
        <p>Want to checkout your files!!<a href="<%= request.getContextPath() %>/FileManager"> click</a></p>
    </div>
    
</body>
</html>