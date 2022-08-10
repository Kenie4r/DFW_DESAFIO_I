<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 9/8/2022
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Carrito de Compras</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="css/index.css">
</head>
<body>
<header>

</header>
<section class="h-100 h-custom" style="background-color: #eee;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col">
                <div class="card">
                    <div class="card-body p-4">

                        <div class="row">

                            <div class="col-lg-7">
                                <h5 class="mb-3"><a href="#!" class="text-body"><i
                                        class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a></h5>
                                <hr>

                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <div>
                                        <p class="mb-1">Shopping cart</p>
                                        <p class="mb-0">You have 4 items in your cart</p>
                                    </div>
                                    <div>
                                        <p class="mb-0"><span class="text-muted">Sort by:</span> <a href="#!"
                                                                                                    class="text-body">price <i class="fas fa-angle-down mt-1"></i></a></p>
                                    </div>
                                </div>
                                <%-- CUpones puestos--%>
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex flex-row align-items-center">
                                                <div>
                                                    <img
                                                            src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                                                            class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                                                </div>
                                                <div class="ms-3">
                                                    <%-- CUpon titulo--%>
                                                    <h5>Cupon Iphone 11 pro</h5>
                                                        <%-- CUpon descripcion--%>
                                                    <p class="small mb-0">50% de descuento</p>
                                                </div>
                                            </div>
                                            <div class="d-flex flex-row align-items-center">
                                                <div style="width: 50px;">
                                                    <select>
                                                        <c:forEach var="i" begin="1" end="10">
                                                            <option>${i}</option>
                                                        </c:forEach>

                                                    </select>
                                                </div>
                                                <div style="width: 80px;">
                                                    <h5 class="mb-0">$0</h5>
                                                </div>
                                                <a href="#!" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                            </div>
                            <div class="col-lg-5">

                                <div class="card bg-primary text-white rounded-3">
                                    <%-- Tarjeta de credito--%>
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                            <h5 class="mb-0">Detalles de la tarjeta</h5>
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp"
                                                 class="img-fluid rounded-3" style="width: 45px;" alt="Avatar">
                                        </div>
                                        <%-- Formulario--%>
                                        <form class="mt-4" action="${pageContext.request.contextPath}/CarritoController" >
                                            <input type="text" name="op" value="transation" hidden>
                                            <div class="form-outline form-white mb-4">
                                                <input type="text" id="typeName" name="cardName" class="form-control form-control-lg" siez="17"
                                                       placeholder="Cardholder's Name" />
                                                <label class="form-label" for="typeName">Nombre de propietario</label>
                                            </div>

                                            <div class="form-outline form-white mb-4">
                                                <input type="text" name="cardNum" id="typeText" class="form-control form-control-lg" siez="17"
                                                       placeholder="1234 5678 9012 3457" minlength="19" maxlength="19" />
                                                <label class="form-label" for="typeText">Numero de Tarjeta</label>
                                            </div>

                                            <div class="row mb-4">
                                                <div class="col-md-6">
                                                    <div class="form-outline form-white">
                                                        <input type="text" id="typeExp" name="expDate" class="form-control form-control-lg"
                                                               placeholder="MM/YYYY" size="7" id="exp" minlength="7" maxlength="7" />
                                                        <label class="form-label" for="typeExp">Fecha de Expiracion </label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-outline form-white">
                                                        <input type="password" id="typeText" name="Cvv" class="form-control form-control-lg"
                                                               placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3" maxlength="3" />
                                                        <label class="form-label" for="typeText">Cvv</label>
                                                    </div>
                                                </div>
                                            </div>



                                        <hr class="my-4">

                                        <div class="d-flex justify-content-between">
                                            <p class="mb-2">Subtotal</p>
                                            <p class="mb-2">$4798.00</p>
                                        </div>

                                        <div class="d-flex justify-content-between mb-4">
                                            <p class="mb-2">Total(Incl. taxes)</p>
                                            <p class="mb-2">$4818.00</p>
                                        </div>
                                            <input type="submit" value="Enviar">
                                        </form>
                                    </div>
                                    <c:set var="lista" property="exito"></c:set>
                                    <c:forEach items="${requestScope.exito}" var="lista" >
                                        <p>${lista}</p>
                                    </c:forEach>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
