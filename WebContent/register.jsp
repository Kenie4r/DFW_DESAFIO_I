<%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 9/8/2022
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrarse</title>
    <meta name="author" content="David Grzyb">
    <meta name="description" content="">

    <!-- Tailwind -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Karla:400,700&display=swap');

        .font-family-karla {
            font-family: karla;
        }
    </style>
</head>
<body class="bg-white font-family-karla h-screen">

<div class="w-full flex flex-wrap">

    <!-- Register Section -->
    <div class="w-full md:w-1/2 flex flex-col">

          <div class="flex justify-center md:justify-start pt-12 md:pl-12 md:-mb-24">
		<img src="https://cdn-icons-png.flaticon.com/512/3706/3706131.png" style="width: 50px" />
    </div>

        <div class="flex flex-col justify-center md:justify-start my-auto pt-8 md:pt-0 px-8 md:px-24 lg:px-32">
            <p class="text-center text-3xl">Join Us.</p>
            <form class="flex flex-col pt-3 md:pt-8" action="ClienteRegistroController" >
                <input type="text" name="op" value="register" hidden>
                <div class="flex flex-col pt-4">
                    <label for="name" class="text-lg">Name</label>
                    <input type="text" id="name" name="name" placeholder="John Smith" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mt-1 leading-tight focus:outline-none focus:shadow-outline" />
                </div>

                <div class="flex flex-col pt-4">
                    <label for="name" class="text-lg">Apellido</label>
                    <input type="text" id="apellido"  name="apellido" placeholder="John Smith" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mt-1 leading-tight focus:outline-none focus:shadow-outline" />
                </div>
                <div class="flex flex-col pt-4">
                    <label for="name" class="text-lg">username</label>
                    <input type="text" id="username" name="username" placeholder="username" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mt-1 leading-tight focus:outline-none focus:shadow-outline" />
                </div>
                <div class="flex flex-col pt-4">
                    <label for="email" class="text-lg">Email</label>
                    <input type="email" id="email" name="email" placeholder="your@email.com" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mt-1 leading-tight focus:outline-none focus:shadow-outline" />
                </div>

                <div class="flex flex-col pt-4">
                    <label for="password" class="text-lg">Password</label>
                    <input type="password" id="password" name="password" placeholder="Password" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mt-1 leading-tight focus:outline-none focus:shadow-outline" />
                </div>

                <div class="flex flex-col pt-4">
                    <label for="confirm-password" class="text-lg">Confirm Password</label>
                    <input type="password" name="confirm-password" id="confirm-password" placeholder="Password" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mt-1 leading-tight focus:outline-none focus:shadow-outline" />
                </div>

                <input type="submit" value="Register" class="bg-black text-white font-bold text-lg hover:bg-gray-700 p-2 mt-8" />
            </form>
            <p>${requestScope.fracaso}</p>
            <p>${requestScope.exito}</p>
            <div class="text-center pt-12 pb-12">
                <p>Already have an account? <a href="index.jsp" class="underline font-semibold">Log in here.</a></p>
            </div>
        </div>

    </div>

    <!-- Image Section -->
    <div class="w-1/2 shadow-2xl">
        <img class="object-cover w-full h-screen hidden md:block" src="https://source.unsplash.com/IXUM4cJynP0" alt="Background" />
    </div>
</div>

</body>
</html>
